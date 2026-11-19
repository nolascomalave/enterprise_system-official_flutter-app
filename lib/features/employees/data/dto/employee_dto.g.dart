// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EmployeeDto _$EmployeeDtoFromJson(Map<String, dynamic> json) => _EmployeeDto(
  partyId: json['party_id'] as String?,
  employeeCode: json['employee_code'] as String?,
  jobId: json['job_id'] as String?,
  departmentId: json['department_id'] as String?,
  managerPartyId: json['manager_party_id'] as String?,
  hireDate: json['hire_date'] as String?,
  status: json['status'] as String?,
  tenantId: json['tenant_id'] as String?,
  createdAt: json['created_at'] as String?,
  updatedAt: json['updated_at'] as String?,
);

Map<String, dynamic> _$EmployeeDtoToJson(_EmployeeDto instance) =>
    <String, dynamic>{
      'party_id': instance.partyId,
      'employee_code': instance.employeeCode,
      'job_id': instance.jobId,
      'department_id': instance.departmentId,
      'manager_party_id': instance.managerPartyId,
      'hire_date': instance.hireDate,
      'status': instance.status,
      'tenant_id': instance.tenantId,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

_CreateEmployeeRequestDto _$CreateEmployeeRequestDtoFromJson(
  Map<String, dynamic> json,
) => _CreateEmployeeRequestDto(
  partyId: json['party_id'] as String,
  employeeCode: json['employee_code'] as String,
  hireDate: json['hire_date'] as String,
  jobId: json['job_id'] as String,
  departmentId: json['department_id'] as String,
  managerPartyId: json['manager_party_id'] as String?,
  status: json['status'] as String?,
);

Map<String, dynamic> _$CreateEmployeeRequestDtoToJson(
  _CreateEmployeeRequestDto instance,
) => <String, dynamic>{
  'party_id': instance.partyId,
  'employee_code': instance.employeeCode,
  'hire_date': instance.hireDate,
  'job_id': instance.jobId,
  'department_id': instance.departmentId,
  'manager_party_id': ?instance.managerPartyId,
  'status': ?instance.status,
};
