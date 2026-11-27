import 'package:flutter/foundation.dart';

/// Notificación in-app del tenant/usuario autenticado.
@immutable
class Notification {
  const Notification({
    required this.id,
    required this.type,
    required this.title,
    this.body = '',
    this.resourceType = '',
    this.resourceId,
    required this.createdAt,
    this.isRead = false,
  });

  final String id;
  final String type;
  final String title;
  final String body;
  final String resourceType;
  final String? resourceId;
  final DateTime createdAt;
  final bool isRead;

  Notification copyWith({bool? isRead}) {
    return Notification(
      id: id,
      type: type,
      title: title,
      body: body,
      resourceType: resourceType,
      resourceId: resourceId,
      createdAt: createdAt,
      isRead: isRead ?? this.isRead,
    );
  }
}
