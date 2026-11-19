import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/employee.dart';

part 'employee_dto.freezed.dart';
part 'employee_dto.g.dart';

/// Empleado (respuesta de `GET /employees`).
@freezed
abstract class EmployeeDto with _$EmployeeDto {
  const factory EmployeeDto({
    @JsonKey(name: 'party_id') String? partyId,
    @JsonKey(name: 'employee_code') String? employeeCode,
    @JsonKey(name: 'job_id') String? jobId,
    @JsonKey(name: 'department_id') String? departmentId,
    @JsonKey(name: 'manager_party_id') String? managerPartyId,
    @JsonKey(name: 'hire_date') String? hireDate,
    String? status,
    @JsonKey(name: 'tenant_id') String? tenantId,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
  }) = _EmployeeDto;

  factory EmployeeDto.fromJson(Map<String, dynamic> json) =>
      _$EmployeeDtoFromJson(json);
}

/// Body de `POST /employees`.
@freezed
abstract class CreateEmployeeRequestDto with _$CreateEmployeeRequestDto {
  const factory CreateEmployeeRequestDto({
    @JsonKey(name: 'party_id') required String partyId,
    @JsonKey(name: 'employee_code') required String employeeCode,
    @JsonKey(name: 'hire_date') required String hireDate,
    @JsonKey(name: 'job_id') required String jobId,
    @JsonKey(name: 'department_id') required String departmentId,
    @JsonKey(name: 'manager_party_id', includeIfNull: false)
    String? managerPartyId,
    @JsonKey(includeIfNull: false) String? status,
  }) = _CreateEmployeeRequestDto;

  factory CreateEmployeeRequestDto.fromJson(Map<String, dynamic> json) =>
      _$CreateEmployeeRequestDtoFromJson(json);
}

extension EmployeeDtoMapper on EmployeeDto {
  Employee toEntity() {
    return Employee(
      partyId: partyId ?? '',
      employeeCode: employeeCode ?? '',
      jobId: jobId ?? '',
      departmentId: departmentId ?? '',
      hireDate: hireDate ?? '',
      managerPartyId: managerPartyId,
      status: EmployeeStatus.fromApi(status),
    );
  }
}
