import 'dart:async';

import 'package:enterprise_app/core/i18n/app_localizations_delegates.dart';
import 'package:enterprise_app/features/notifications/domain/entities/notification.dart';
import 'package:enterprise_app/features/notifications/domain/entities/notification_page.dart';
import 'package:enterprise_app/features/notifications/domain/repositories/notifications_repository.dart';
import 'package:enterprise_app/features/notifications/presentation/providers/notifications_providers.dart';
import 'package:enterprise_app/features/notifications/presentation/widgets/notification_bell.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart' hide Notification;

class FakeNotificationsRepository implements NotificationsRepository {
  FakeNotificationsRepository(this.controller, {this.initial = const []});

  final StreamController<List<Notification>> controller;
  final List<Notification> initial;

  @override
  Future<NotificationPage> getNotifications({
    int limit = 50,
    int offset = 0,
  }) async {
    return NotificationPage(
      items: initial,
      total: initial.length,
      limit: 50,
      offset: 0,
    );
  }

  @override
  Future<void> markAsRead(String notificationId) async {}

  @override
  Stream<List<Notification>> streamNotifications({
    List<Notification>? initial,
  }) => controller.stream;
}

Widget buildBell(FakeNotificationsRepository repository) {
  return ProviderScope(
    overrides: [
      notificationsRepositoryProvider.overrideWith((ref) async => repository),
    ],
    child: MaterialApp(
      locale: const Locale('es'),
      localizationsDelegates: appLocalizationsDelegates,
      supportedLocales: appSupportedLocales,
      theme: ThemeData.dark(useMaterial3: true)
          .copyWith(splashFactory: InkRipple.splashFactory),
      home: const Scaffold(body: Center(child: NotificationBell())),
    ),
  );
}

void main() {
  testWidgets('muestra el badge de no leídas y la lista al abrir', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(1400, 900);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    final controller = StreamController<List<Notification>>.broadcast();
    addTearDown(() => controller.close());
    final now = DateTime.now();
    final repository = FakeNotificationsRepository(
      controller,
      initial: [
        Notification(
          id: 'n1',
          type: 'relationship.approved',
          title: 'Relación aprobada',
          body: 'La filial aprobó la relación',
          resourceType: 'tenant_relationship',
          resourceId: 'rel-1',
          createdAt: now.subtract(const Duration(minutes: 5)),
        ),
        Notification(
          id: 'n2',
          type: 'relationship.rejected',
          title: 'Relación rechazada',
          createdAt: now.subtract(const Duration(hours: 2)),
          isRead: true,
        ),
      ],
    );

    await tester.pumpWidget(buildBell(repository));
    await tester.pumpAndSettle();

    expect(find.text('1'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.notifications_none_rounded));
    await tester.pumpAndSettle();

    expect(find.text('Notificaciones'), findsOneWidget);
    expect(find.text('Relación aprobada'), findsOneWidget);
    expect(find.text('Relación rechazada'), findsOneWidget);
    expect(find.text('Hace 5 min'), findsOneWidget);
    expect(find.text('Hace 2 h'), findsOneWidget);
    expect(find.byKey(const Key('notification_unread_n1')), findsOneWidget);
    expect(find.byKey(const Key('notification_unread_n2')), findsNothing);
  });

  testWidgets('muestra el empty state cuando no hay notificaciones', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(1400, 900);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    final controller = StreamController<List<Notification>>.broadcast();
    addTearDown(() => controller.close());
    final repository = FakeNotificationsRepository(controller);

    await tester.pumpWidget(buildBell(repository));
    await tester.pumpAndSettle();
    controller.add(const []);
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 50));

    expect(find.text('0'), findsNothing);

    await tester.tap(find.byIcon(Icons.notifications_none_rounded));
    await tester.pumpAndSettle();

    expect(find.text('No tienes notificaciones'), findsOneWidget);
    expect(find.byIcon(Icons.notifications_off_outlined), findsOneWidget);
  });
}
