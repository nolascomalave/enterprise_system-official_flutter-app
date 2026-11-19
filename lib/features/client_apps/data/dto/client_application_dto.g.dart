// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_application_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ClientApplicationDto _$ClientApplicationDtoFromJson(
  Map<String, dynamic> json,
) => _ClientApplicationDto(
  id: json['id'] as String?,
  name: json['name'] as String?,
  clientId: json['client_id'] as String?,
  clientSecret: json['client_secret'] as String?,
  scopes:
      (json['scopes'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const <String>[],
  isActive: json['is_active'] as bool? ?? true,
  clientType: json['client_type'] as String?,
  applicationScope: json['application_scope'] as String?,
  tenantId: json['tenant_id'] as String?,
  createdAt: json['created_at'] as String?,
);

Map<String, dynamic> _$ClientApplicationDtoToJson(
  _ClientApplicationDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'client_id': instance.clientId,
  'client_secret': instance.clientSecret,
  'scopes': instance.scopes,
  'is_active': instance.isActive,
  'client_type': instance.clientType,
  'application_scope': instance.applicationScope,
  'tenant_id': instance.tenantId,
  'created_at': instance.createdAt,
};

_CreateClientApplicationRequestDto _$CreateClientApplicationRequestDtoFromJson(
  Map<String, dynamic> json,
) => _CreateClientApplicationRequestDto(
  name: json['name'] as String,
  scopes: (json['scopes'] as List<dynamic>).map((e) => e as String).toList(),
);

Map<String, dynamic> _$CreateClientApplicationRequestDtoToJson(
  _CreateClientApplicationRequestDto instance,
) => <String, dynamic>{'name': instance.name, 'scopes': instance.scopes};
