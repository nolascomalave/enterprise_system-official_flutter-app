import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/employee.dart';

part 'department_dto.freezed.dart';
part 'department_dto.g.dart';

/// Departamento (`GET /departments`).
@freezed
abstract class DepartmentDto with _$DepartmentDto {
  const factory DepartmentDto({
    String? id,
    String? name,
    String? code,
    @JsonKey(name: 'unit_type') String? unitType,
    @JsonKey(name: 'parent_department_id') String? parentDepartmentId,
    @JsonKey(name: 'manager_party_id') String? managerPartyId,
  }) = _DepartmentDto;

  factory DepartmentDto.fromJson(Map<String, dynamic> json) =>
      _$DepartmentDtoFromJson(json);
}

extension DepartmentDtoMapper on DepartmentDto {
  Department toEntity() =>
      Department(id: id ?? '', name: name ?? '—', code: code ?? '');
}
