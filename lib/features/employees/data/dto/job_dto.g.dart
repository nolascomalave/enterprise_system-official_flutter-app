// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_JobDto _$JobDtoFromJson(Map<String, dynamic> json) => _JobDto(
  id: json['id'] as String?,
  title: json['title'] as String?,
  code: json['code'] as String?,
  description: json['description'] as String?,
  jobFamilyId: json['job_family_id'] as String?,
  minSalary: json['min_salary'] as String?,
  maxSalary: json['max_salary'] as String?,
);

Map<String, dynamic> _$JobDtoToJson(_JobDto instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'code': instance.code,
  'description': instance.description,
  'job_family_id': instance.jobFamilyId,
  'min_salary': instance.minSalary,
  'max_salary': instance.maxSalary,
};
