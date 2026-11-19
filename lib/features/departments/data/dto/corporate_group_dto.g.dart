// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'corporate_group_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CorporateGroupDto _$CorporateGroupDtoFromJson(Map<String, dynamic> json) =>
    _CorporateGroupDto(
      id: json['id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      tenantId: json['tenant_id'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$CorporateGroupDtoToJson(_CorporateGroupDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'tenant_id': instance.tenantId,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

_CreateCorporateGroupRequestDto _$CreateCorporateGroupRequestDtoFromJson(
  Map<String, dynamic> json,
) => _CreateCorporateGroupRequestDto(
  name: json['name'] as String,
  description: json['description'] as String?,
);

Map<String, dynamic> _$CreateCorporateGroupRequestDtoToJson(
  _CreateCorporateGroupRequestDto instance,
) => <String, dynamic>{
  'name': instance.name,
  'description': ?instance.description,
};

_AssignDepartmentToGroupRequestDto _$AssignDepartmentToGroupRequestDtoFromJson(
  Map<String, dynamic> json,
) => _AssignDepartmentToGroupRequestDto(
  corporateGroupId: json['corporate_group_id'] as String,
);

Map<String, dynamic> _$AssignDepartmentToGroupRequestDtoToJson(
  _AssignDepartmentToGroupRequestDto instance,
) => <String, dynamic>{'corporate_group_id': instance.corporateGroupId};
