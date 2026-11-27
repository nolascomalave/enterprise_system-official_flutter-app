import '../entities/notification.dart';
import '../entities/notification_page.dart';
import '../repositories/notifications_repository.dart';

/// Caso de uso: cargar la primera página de notificaciones.
class GetNotificationsUseCase {
  const GetNotificationsUseCase(this._repository);

  final NotificationsRepository _repository;

  Future<NotificationPage> call({int limit = 50, int offset = 0}) =>
      _repository.getNotifications(limit: limit, offset: offset);
}

/// Caso de uso: marcar una notificación como leída.
class MarkNotificationReadUseCase {
  const MarkNotificationReadUseCase(this._repository);

  final NotificationsRepository _repository;

  Future<void> call(String notificationId) =>
      _repository.markAsRead(notificationId);
}

/// Caso de uso: escuchar el stream SSE de notificaciones.
class StreamNotificationsUseCase {
  const StreamNotificationsUseCase(this._repository);

  final NotificationsRepository _repository;

  Stream<List<Notification>> call({List<Notification>? initial}) =>
      _repository.streamNotifications(initial: initial);
}
