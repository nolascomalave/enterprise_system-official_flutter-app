import '../entities/notification.dart';
import '../entities/notification_page.dart';

/// Puerta de acceso a las notificaciones del usuario autenticado.
abstract class NotificationsRepository {
  /// `GET /notifications?limit&offset` — lista paginada.
  Future<NotificationPage> getNotifications({int limit = 50, int offset = 0});

  /// `PUT /notifications/{id}/read`.
  Future<void> markAsRead(String notificationId);

  /// `GET /notifications/stream` (SSE) combinado con la lista inicial.
  ///
  /// Emite la lista acumulada y ordenada cada vez que llega un evento.
  /// Si se pasa [initial], evita el GET inicial (útil tras el primer fetch).
  Stream<List<Notification>> streamNotifications({List<Notification>? initial});
}
