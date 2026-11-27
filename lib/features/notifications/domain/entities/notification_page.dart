import 'notification.dart';

/// Página de notificaciones devuelta por `GET /notifications`.
class NotificationPage {
  const NotificationPage({
    required this.items,
    required this.total,
    required this.limit,
    required this.offset,
  });

  final List<Notification> items;
  final int total;
  final int limit;
  final int offset;
}
