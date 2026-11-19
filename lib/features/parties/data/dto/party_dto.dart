import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/party.dart';

part 'party_dto.freezed.dart';
part 'party_dto.g.dart';

/// Perfil de persona (respuesta).
@freezed
abstract class PersonProfileDto with _$PersonProfileDto {
  const factory PersonProfileDto({
    String? id,
    @JsonKey(name: 'party_id') String? partyId,
    @JsonKey(name: 'first_name') String? firstName,
    @JsonKey(name: 'middle_name') String? middleName,
    @JsonKey(name: 'last_name') String? lastName,
    @JsonKey(name: 'second_last_name') String? secondLastName,
    @JsonKey(name: 'birth_date') String? birthDate,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
  }) = _PersonProfileDto;

  factory PersonProfileDto.fromJson(Map<String, dynamic> json) =>
      _$PersonProfileDtoFromJson(json);
}

/// Perfil de organización (respuesta).
@freezed
abstract class OrganizationProfileDto with _$OrganizationProfileDto {
  const factory OrganizationProfileDto({
    String? id,
    @JsonKey(name: 'party_id') String? partyId,
    @JsonKey(name: 'legal_name') String? legalName,
    @JsonKey(name: 'trade_name') String? tradeName,
    @JsonKey(name: 'tax_id') String? taxId,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
  }) = _OrganizationProfileDto;

  factory OrganizationProfileDto.fromJson(Map<String, dynamic> json) =>
      _$OrganizationProfileDtoFromJson(json);
}

/// Party (respuesta de `GET /parties` y `POST /parties`).
@freezed
abstract class PartyDto with _$PartyDto {
  const factory PartyDto({
    String? id,
    @JsonKey(name: 'canonical_party_id') String? canonicalPartyId,
    @JsonKey(name: 'display_name') String? displayName,
    @JsonKey(name: 'party_type') String? partyType,
    @JsonKey(name: 'record_status') String? recordStatus,
    @JsonKey(name: 'tenant_id') String? tenantId,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
    @JsonKey(name: 'deleted_at') String? deletedAt,
    @JsonKey(name: 'person_profile') PersonProfileDto? personProfile,
    @JsonKey(name: 'organization_profile')
    OrganizationProfileDto? organizationProfile,
  }) = _PartyDto;

  factory PartyDto.fromJson(Map<String, dynamic> json) =>
      _$PartyDtoFromJson(json);
}

/// Body de `POST /parties` — perfil de persona.
@freezed
abstract class CreatePersonProfileDto with _$CreatePersonProfileDto {
  const factory CreatePersonProfileDto({
    @JsonKey(name: 'first_name', includeIfNull: false) String? firstName,
    @JsonKey(name: 'middle_name', includeIfNull: false) String? middleName,
    @JsonKey(name: 'last_name', includeIfNull: false) String? lastName,
    @JsonKey(name: 'second_last_name', includeIfNull: false)
    String? secondLastName,
    @JsonKey(name: 'birth_date', includeIfNull: false) String? birthDate,
  }) = _CreatePersonProfileDto;

  factory CreatePersonProfileDto.fromJson(Map<String, dynamic> json) =>
      _$CreatePersonProfileDtoFromJson(json);
}

/// Body de `POST /parties` — perfil de organización.
@freezed
abstract class CreateOrganizationProfileDto with _$CreateOrganizationProfileDto {
  const factory CreateOrganizationProfileDto({
    @JsonKey(name: 'legal_name', includeIfNull: false) String? legalName,
    @JsonKey(name: 'trade_name', includeIfNull: false) String? tradeName,
    @JsonKey(name: 'tax_id', includeIfNull: false) String? taxId,
  }) = _CreateOrganizationProfileDto;

  factory CreateOrganizationProfileDto.fromJson(Map<String, dynamic> json) =>
      _$CreateOrganizationProfileDtoFromJson(json);
}

/// Body de `POST /parties`.
@freezed
abstract class CreatePartyRequestDto with _$CreatePartyRequestDto {
  const factory CreatePartyRequestDto({
    @JsonKey(name: 'display_name') required String displayName,
    @JsonKey(name: 'party_type') required String partyType,
    @JsonKey(name: 'person_profile', includeIfNull: false)
    CreatePersonProfileDto? personProfile,
    @JsonKey(name: 'organization_profile', includeIfNull: false)
    CreateOrganizationProfileDto? organizationProfile,
  }) = _CreatePartyRequestDto;

  factory CreatePartyRequestDto.fromJson(Map<String, dynamic> json) =>
      _$CreatePartyRequestDtoFromJson(json);
}

extension PartyDtoMapper on PartyDto {
  Party toEntity() {
    return Party(
      id: id ?? '',
      displayName: displayName ?? '—',
      partyType: PartyType.fromApi(partyType ?? 'INDIVIDUAL'),
      recordStatus: recordStatus ?? 'ACTIVE',
      firstName: personProfile?.firstName,
      lastName: personProfile?.lastName,
      legalName: organizationProfile?.legalName,
      taxId: organizationProfile?.taxId,
      createdAt: createdAt,
    );
  }
}
