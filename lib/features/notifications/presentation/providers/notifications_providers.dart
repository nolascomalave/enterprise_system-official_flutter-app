import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/dio_client.dart';
import '../../data/repositories/notifications_repository_impl.dart';
import '../../data/services/notification_sse_client.dart';
import '../../domain/repositories/notifications_repository.dart';
import '../../domain/usecases/notification_usecases.dart';

/// Cliente SSE (usa el token de la sesión en cada reconexión).
final notificationSseClientProvider = Provider<NotificationSseClient>((ref) {
  return HttpNotificationSseClient(
    baseUrl: apiBaseUrl,
    storage: ref.watch(secureStorageProvider),
  );
});

final notificationsRepositoryProvider = FutureProvider<NotificationsRepository>(
  (ref) async {
    final dio = await ref.watch(dioProvider.future);
    return NotificationsRepositoryImpl(
      dio,
      ref.watch(notificationSseClientProvider),
    );
  },
);

final getNotificationsUseCaseProvider = FutureProvider<GetNotificationsUseCase>(
  (ref) async {
    final repository = await ref.watch(notificationsRepositoryProvider.future);
    return GetNotificationsUseCase(repository);
  },
);

final markNotificationReadUseCaseProvider =
    FutureProvider<MarkNotificationReadUseCase>((ref) async {
      final repository = await ref.watch(
        notificationsRepositoryProvider.future,
      );
      return MarkNotificationReadUseCase(repository);
    });

final streamNotificationsUseCaseProvider =
    FutureProvider<StreamNotificationsUseCase>((ref) async {
      final repository = await ref.watch(
        notificationsRepositoryProvider.future,
      );
      return StreamNotificationsUseCase(repository);
    });
