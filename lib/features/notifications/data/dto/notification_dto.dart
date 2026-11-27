import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/notification.dart';

part 'notification_dto.freezed.dart';
part 'notification_dto.g.dart';

/// Respuesta de `GET /notifications` y payload de `GET /notifications/stream`.
@freezed
abstract class NotificationDto with _$NotificationDto {
  const factory NotificationDto({
    required String id,
    @Default('') String type,
    @Default('') String title,
    @Default('') String body,
    @JsonKey(name: 'resource_type') @Default('') String resourceType,
    @JsonKey(name: 'resource_id') String? resourceId,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'is_read') @Default(false) bool isRead,
  }) = _NotificationDto;

  factory NotificationDto.fromJson(Map<String, dynamic> json) =>
      _$NotificationDtoFromJson(json);
}

extension NotificationDtoMapper on NotificationDto {
  Notification toEntity() {
    return Notification(
      id: id,
      type: type,
      title: title,
      body: body,
      resourceType: resourceType,
      resourceId: resourceId,
      createdAt: createdAt,
      isRead: isRead,
    );
  }
}

@freezed
abstract class NotificationListMetaDto with _$NotificationListMetaDto {
  const factory NotificationListMetaDto({
    @Default(0) int limit,
    @Default(0) int offset,
    @Default(0) int total,
  }) = _NotificationListMetaDto;

  factory NotificationListMetaDto.fromJson(Map<String, dynamic> json) =>
      _$NotificationListMetaDtoFromJson(json);
}

@freezed
abstract class NotificationListEnvelopeDto with _$NotificationListEnvelopeDto {
  const factory NotificationListEnvelopeDto({
    @Default(<NotificationDto>[]) List<NotificationDto> data,
    @Default(NotificationListMetaDto()) NotificationListMetaDto meta,
  }) = _NotificationListEnvelopeDto;

  factory NotificationListEnvelopeDto.fromJson(Map<String, dynamic> json) =>
      _$NotificationListEnvelopeDtoFromJson(json);
}
