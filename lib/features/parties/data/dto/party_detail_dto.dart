import 'package:freezed_annotation/freezed_annotation.dart';

import 'party_dto.dart';

part 'party_detail_dto.freezed.dart';
part 'party_detail_dto.g.dart';

/// Detalle de party (`GET /parties/{id}`).
///
/// Contiene los campos conocidos del `PartyResponse`; las colecciones
/// opcionales (contactos, direcciones, nombres, etc.) se parsean de forma
/// tolerante en el repositorio porque el contrato puede variar.
@freezed
abstract class PartyDetailDto with _$PartyDetailDto {
  const factory PartyDetailDto({
    String? id,
    @JsonKey(name: 'display_name') String? displayName,
    @JsonKey(name: 'party_type') String? partyType,
    @JsonKey(name: 'record_status') String? recordStatus,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'canonical_party_id') String? canonicalPartyId,
    @JsonKey(name: 'person_profile') PersonProfileDto? personProfile,
    @JsonKey(name: 'organization_profile')
    OrganizationProfileDto? organizationProfile,
  }) = _PartyDetailDto;

  factory PartyDetailDto.fromJson(Map<String, dynamic> json) =>
      _$PartyDetailDtoFromJson(json);
}
