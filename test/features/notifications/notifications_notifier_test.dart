import 'dart:async';

import 'package:enterprise_app/features/notifications/domain/entities/notification.dart';
import 'package:enterprise_app/features/notifications/domain/entities/notification_page.dart';
import 'package:enterprise_app/features/notifications/domain/repositories/notifications_repository.dart';
import 'package:enterprise_app/features/notifications/presentation/providers/notifications_notifier.dart';
import 'package:enterprise_app/features/notifications/presentation/providers/notifications_providers.dart';
import 'package:enterprise_app/features/notifications/presentation/state/notifications_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

class FakeNotificationsRepository implements NotificationsRepository {
  final controller = StreamController<List<Notification>>.broadcast();
  String? markedId;
  int markCalls = 0;

  @override
  Future<NotificationPage> getNotifications({
    int limit = 50,
    int offset = 0,
  }) async {
    return const NotificationPage(items: [], total: 0, limit: 50, offset: 0);
  }

  @override
  Future<void> markAsRead(String notificationId) async {
    markedId = notificationId;
    markCalls++;
  }

  @override
  Stream<List<Notification>> streamNotifications({
    List<Notification>? initial,
  }) => controller.stream;
}

Notification notification({
  required String id,
  required String title,
  bool isRead = false,
  DateTime? createdAt,
}) {
  return Notification(
    id: id,
    type: 'relationship.approved',
    title: title,
    resourceType: 'tenant_relationship',
    resourceId: 'rel-1',
    createdAt: createdAt ?? DateTime.utc(2026, 11, 26, 10),
    isRead: isRead,
  );
}

void main() {
  late FakeNotificationsRepository repository;
  late ProviderContainer container;

  setUp(() {
    repository = FakeNotificationsRepository();
    container = ProviderContainer(
      overrides: [
        notificationsRepositoryProvider.overrideWith((ref) async => repository),
      ],
    );
    addTearDown(container.dispose);
    addTearDown(() => repository.controller.close());
  });

  ProviderSubscription<AsyncValue<NotificationsState>> listen() =>
      container.listen(notificationsProvider, (previous, next) {});

  test('acumula notificaciones y cuenta las no leídas', () async {
    final sub = listen();
    addTearDown(sub.close);

    final future = container.read(notificationsProvider.future);
    expect(container.read(notificationsProvider), isA<AsyncLoading>());

    final initialState = await future;
    expect(initialState.items, isEmpty);

    repository.controller.add([
      notification(id: 'n1', title: 'Relación aprobada'),
      notification(id: 'n2', title: 'Relación rechazada', isRead: true),
    ]);
    await Future<void>.delayed(Duration.zero);

    final state = container.read(notificationsProvider).requireValue;
    expect(state.items, hasLength(2));
    expect(state.unreadCount, 1);

    repository.controller.add([
      notification(id: 'n2', title: 'Relación rechazada', isRead: true),
      notification(id: 'n1', title: 'Relación aprobada'),
      notification(id: 'n3', title: 'Nueva relación'),
    ]);
    await Future<void>.delayed(Duration.zero);

    final updated = container.read(notificationsProvider).requireValue;
    expect(updated.items, hasLength(3));
    expect(updated.unreadCount, 2);
  });

  test('markAsRead actualiza el estado y llama al repositorio', () async {
    final sub = listen();
    addTearDown(sub.close);

    final future = container.read(notificationsProvider.future);
    await future;
    repository.controller.add([
      notification(id: 'n1', title: 'Relación aprobada'),
    ]);
    await Future<void>.delayed(Duration.zero);

    await container.read(notificationsProvider.notifier).markAsRead('n1');

    expect(repository.markedId, 'n1');
    final state = container.read(notificationsProvider).requireValue;
    expect(state.items.single.isRead, isTrue);
    expect(state.unreadCount, 0);
  });

  test('mantiene el estado leído aunque el SSE reenvíe la lista', () async {
    final sub = listen();
    addTearDown(sub.close);

    final future = container.read(notificationsProvider.future);
    await future;
    repository.controller.add([
      notification(id: 'n1', title: 'Relación aprobada'),
    ]);
    await Future<void>.delayed(Duration.zero);

    await container.read(notificationsProvider.notifier).markAsRead('n1');
    repository.controller.add([
      notification(id: 'n1', title: 'Relación aprobada'),
    ]);
    await Future<void>.delayed(Duration.zero);

    final state = container.read(notificationsProvider).requireValue;
    expect(state.items.single.isRead, isTrue);
    expect(state.unreadCount, 0);
  });
}
