// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'department_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DepartmentDto _$DepartmentDtoFromJson(Map<String, dynamic> json) =>
    _DepartmentDto(
      id: json['id'] as String?,
      name: json['name'] as String?,
      code: json['code'] as String?,
      unitType: json['unit_type'] as String?,
      parentDepartmentId: json['parent_department_id'] as String?,
      managerPartyId: json['manager_party_id'] as String?,
    );

Map<String, dynamic> _$DepartmentDtoToJson(_DepartmentDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'unit_type': instance.unitType,
      'parent_department_id': instance.parentDepartmentId,
      'manager_party_id': instance.managerPartyId,
    };
