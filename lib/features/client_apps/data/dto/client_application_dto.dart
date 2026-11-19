import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/client_application.dart';

part 'client_application_dto.freezed.dart';
part 'client_application_dto.g.dart';

/// Aplicación cliente (`GET/POST /client-applications`).
@freezed
abstract class ClientApplicationDto with _$ClientApplicationDto {
  const factory ClientApplicationDto({
    String? id,
    String? name,
    @JsonKey(name: 'client_id') String? clientId,
    @JsonKey(name: 'client_secret') String? clientSecret,
    @Default(<String>[]) List<String> scopes,
    @JsonKey(name: 'is_active') @Default(true) bool isActive,
    @JsonKey(name: 'client_type') String? clientType,
    @JsonKey(name: 'application_scope') String? applicationScope,
    @JsonKey(name: 'tenant_id') String? tenantId,
    @JsonKey(name: 'created_at') String? createdAt,
  }) = _ClientApplicationDto;

  factory ClientApplicationDto.fromJson(Map<String, dynamic> json) =>
      _$ClientApplicationDtoFromJson(json);
}

/// Body de `POST /client-applications`.
@freezed
abstract class CreateClientApplicationRequestDto
    with _$CreateClientApplicationRequestDto {
  const factory CreateClientApplicationRequestDto({
    required String name,
    required List<String> scopes,
  }) = _CreateClientApplicationRequestDto;

  factory CreateClientApplicationRequestDto.fromJson(Map<String, dynamic> json) =>
      _$CreateClientApplicationRequestDtoFromJson(json);
}

extension ClientApplicationDtoMapper on ClientApplicationDto {
  ClientApplication toEntity() => ClientApplication(
        id: id ?? '',
        name: name ?? '—',
        clientId: clientId ?? '',
        scopes: scopes,
        isActive: isActive,
        clientSecret: clientSecret,
      );
}
