import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/department.dart';

part 'department_dto.freezed.dart';
part 'department_dto.g.dart';

/// Departamento (respuesta de `GET /departments`).
@freezed
abstract class DepartmentDto with _$DepartmentDto {
  const factory DepartmentDto({
    String? id,
    String? name,
    String? code,
    @JsonKey(name: 'unit_type') String? unitType,
    @JsonKey(name: 'parent_department_id') String? parentDepartmentId,
    @JsonKey(name: 'manager_party_id') String? managerPartyId,
    @JsonKey(name: 'tenant_id') String? tenantId,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
  }) = _DepartmentDto;

  factory DepartmentDto.fromJson(Map<String, dynamic> json) =>
      _$DepartmentDtoFromJson(json);
}

/// Body de `POST /departments`.
@freezed
abstract class CreateDepartmentRequestDto with _$CreateDepartmentRequestDto {
  const factory CreateDepartmentRequestDto({
    required String name,
    required String code,
    @JsonKey(name: 'unit_type') required String unitType,
    @JsonKey(name: 'parent_department_id', includeIfNull: false)
    String? parentDepartmentId,
    @JsonKey(name: 'manager_party_id', includeIfNull: false)
    String? managerPartyId,
  }) = _CreateDepartmentRequestDto;

  factory CreateDepartmentRequestDto.fromJson(Map<String, dynamic> json) =>
      _$CreateDepartmentRequestDtoFromJson(json);
}

extension DepartmentDtoMapper on DepartmentDto {
  Department toEntity() => Department(
        id: id ?? '',
        name: name ?? '—',
        code: code ?? '',
        unitType: DepartmentUnitType.fromApi(unitType),
        parentDepartmentId: parentDepartmentId,
        managerPartyId: managerPartyId,
      );
}
