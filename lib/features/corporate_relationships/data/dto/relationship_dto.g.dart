// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'relationship_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TenantRelationshipDto _$TenantRelationshipDtoFromJson(
  Map<String, dynamic> json,
) => _TenantRelationshipDto(
  id: json['id'] as String?,
  status: json['status'] as String?,
  holdingId: json['holding_id'] as String?,
  subsidiaryId: json['subsidiary_id'] as String?,
  holdingName: json['holding_name'] as String?,
  subsidiaryName: json['subsidiary_name'] as String?,
  createdAt: json['created_at'] as String?,
  updatedAt: json['updated_at'] as String?,
  rejectionReason: json['rejection_reason'] as String?,
  revocationReason: json['revocation_reason'] as String?,
);

Map<String, dynamic> _$TenantRelationshipDtoToJson(
  _TenantRelationshipDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'status': instance.status,
  'holding_id': instance.holdingId,
  'subsidiary_id': instance.subsidiaryId,
  'holding_name': instance.holdingName,
  'subsidiary_name': instance.subsidiaryName,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
  'rejection_reason': instance.rejectionReason,
  'revocation_reason': instance.revocationReason,
};

_InitiateRelationshipRequestDto _$InitiateRelationshipRequestDtoFromJson(
  Map<String, dynamic> json,
) => _InitiateRelationshipRequestDto(
  holdingTenantId: json['holding_tenant_id'] as String,
);

Map<String, dynamic> _$InitiateRelationshipRequestDtoToJson(
  _InitiateRelationshipRequestDto instance,
) => <String, dynamic>{'holding_tenant_id': instance.holdingTenantId};

_EmitInviteTokenResponseDto _$EmitInviteTokenResponseDtoFromJson(
  Map<String, dynamic> json,
) => _EmitInviteTokenResponseDto(
  token: json['token'] as String?,
  expiresAt: json['expires_at'] as String?,
);

Map<String, dynamic> _$EmitInviteTokenResponseDtoToJson(
  _EmitInviteTokenResponseDto instance,
) => <String, dynamic>{
  'token': instance.token,
  'expires_at': instance.expiresAt,
};

_ConsumeInviteTokenRequestDto _$ConsumeInviteTokenRequestDtoFromJson(
  Map<String, dynamic> json,
) => _ConsumeInviteTokenRequestDto(token: json['token'] as String);

Map<String, dynamic> _$ConsumeInviteTokenRequestDtoToJson(
  _ConsumeInviteTokenRequestDto instance,
) => <String, dynamic>{'token': instance.token};

_RelationshipReasonRequestDto _$RelationshipReasonRequestDtoFromJson(
  Map<String, dynamic> json,
) => _RelationshipReasonRequestDto(reason: json['reason'] as String?);

Map<String, dynamic> _$RelationshipReasonRequestDtoToJson(
  _RelationshipReasonRequestDto instance,
) => <String, dynamic>{'reason': ?instance.reason};
