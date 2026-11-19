import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/corporate_group.dart';

part 'corporate_group_dto.freezed.dart';
part 'corporate_group_dto.g.dart';

/// Grupo corporativo (respuesta).
@freezed
abstract class CorporateGroupDto with _$CorporateGroupDto {
  const factory CorporateGroupDto({
    String? id,
    String? name,
    String? description,
    @JsonKey(name: 'tenant_id') String? tenantId,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
  }) = _CorporateGroupDto;

  factory CorporateGroupDto.fromJson(Map<String, dynamic> json) =>
      _$CorporateGroupDtoFromJson(json);
}

/// Body de `POST /corporate-groups`.
@freezed
abstract class CreateCorporateGroupRequestDto
    with _$CreateCorporateGroupRequestDto {
  const factory CreateCorporateGroupRequestDto({
    required String name,
    @JsonKey(includeIfNull: false) String? description,
  }) = _CreateCorporateGroupRequestDto;

  factory CreateCorporateGroupRequestDto.fromJson(Map<String, dynamic> json) =>
      _$CreateCorporateGroupRequestDtoFromJson(json);
}

/// Body de `POST /departments/{id}/groups`.
@freezed
abstract class AssignDepartmentToGroupRequestDto
    with _$AssignDepartmentToGroupRequestDto {
  const factory AssignDepartmentToGroupRequestDto({
    @JsonKey(name: 'corporate_group_id') required String corporateGroupId,
  }) = _AssignDepartmentToGroupRequestDto;

  factory AssignDepartmentToGroupRequestDto.fromJson(Map<String, dynamic> json) =>
      _$AssignDepartmentToGroupRequestDtoFromJson(json);
}

extension CorporateGroupDtoMapper on CorporateGroupDto {
  CorporateGroup toEntity() => CorporateGroup(
        id: id ?? '',
        name: name ?? '—',
        description: description,
      );
}
