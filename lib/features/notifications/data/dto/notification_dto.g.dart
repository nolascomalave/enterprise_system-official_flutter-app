// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NotificationDto _$NotificationDtoFromJson(Map<String, dynamic> json) =>
    _NotificationDto(
      id: json['id'] as String,
      type: json['type'] as String? ?? '',
      title: json['title'] as String? ?? '',
      body: json['body'] as String? ?? '',
      resourceType: json['resource_type'] as String? ?? '',
      resourceId: json['resource_id'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
      isRead: json['is_read'] as bool? ?? false,
    );

Map<String, dynamic> _$NotificationDtoToJson(_NotificationDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'title': instance.title,
      'body': instance.body,
      'resource_type': instance.resourceType,
      'resource_id': instance.resourceId,
      'created_at': instance.createdAt.toIso8601String(),
      'is_read': instance.isRead,
    };

_NotificationListMetaDto _$NotificationListMetaDtoFromJson(
  Map<String, dynamic> json,
) => _NotificationListMetaDto(
  limit: (json['limit'] as num?)?.toInt() ?? 0,
  offset: (json['offset'] as num?)?.toInt() ?? 0,
  total: (json['total'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$NotificationListMetaDtoToJson(
  _NotificationListMetaDto instance,
) => <String, dynamic>{
  'limit': instance.limit,
  'offset': instance.offset,
  'total': instance.total,
};

_NotificationListEnvelopeDto _$NotificationListEnvelopeDtoFromJson(
  Map<String, dynamic> json,
) => _NotificationListEnvelopeDto(
  data:
      (json['data'] as List<dynamic>?)
          ?.map((e) => NotificationDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <NotificationDto>[],
  meta: json['meta'] == null
      ? const NotificationListMetaDto()
      : NotificationListMetaDto.fromJson(json['meta'] as Map<String, dynamic>),
);

Map<String, dynamic> _$NotificationListEnvelopeDtoToJson(
  _NotificationListEnvelopeDto instance,
) => <String, dynamic>{'data': instance.data, 'meta': instance.meta};
