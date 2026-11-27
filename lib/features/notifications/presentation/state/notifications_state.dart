import 'package:flutter/foundation.dart';

import '../../domain/entities/notification.dart';

/// Estado de la campana y del panel de notificaciones.
@immutable
class NotificationsState {
  const NotificationsState({this.items = const [], this.total = 0});

  final List<Notification> items;
  final int total;

  int get unreadCount => items.where((item) => !item.isRead).length;

  NotificationsState copyWith({List<Notification>? items, int? total}) {
    return NotificationsState(
      items: items ?? this.items,
      total: total ?? this.total,
    );
  }
}
