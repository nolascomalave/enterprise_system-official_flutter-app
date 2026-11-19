import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/employee.dart';

part 'job_dto.freezed.dart';
part 'job_dto.g.dart';

/// Puesto (`GET /jobs`).
@freezed
abstract class JobDto with _$JobDto {
  const factory JobDto({
    String? id,
    String? title,
    String? code,
    String? description,
    @JsonKey(name: 'job_family_id') String? jobFamilyId,
    @JsonKey(name: 'min_salary') String? minSalary,
    @JsonKey(name: 'max_salary') String? maxSalary,
  }) = _JobDto;

  factory JobDto.fromJson(Map<String, dynamic> json) => _$JobDtoFromJson(json);
}

extension JobDtoMapper on JobDto {
  Job toEntity() => Job(
        id: id ?? '',
        title: title ?? '—',
        code: code ?? '',
      );
}
