// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'party_detail_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PartyDetailDto _$PartyDetailDtoFromJson(Map<String, dynamic> json) =>
    _PartyDetailDto(
      id: json['id'] as String?,
      displayName: json['display_name'] as String?,
      partyType: json['party_type'] as String?,
      recordStatus: json['record_status'] as String?,
      createdAt: json['created_at'] as String?,
      canonicalPartyId: json['canonical_party_id'] as String?,
      personProfile: json['person_profile'] == null
          ? null
          : PersonProfileDto.fromJson(
              json['person_profile'] as Map<String, dynamic>,
            ),
      organizationProfile: json['organization_profile'] == null
          ? null
          : OrganizationProfileDto.fromJson(
              json['organization_profile'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$PartyDetailDtoToJson(_PartyDetailDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'display_name': instance.displayName,
      'party_type': instance.partyType,
      'record_status': instance.recordStatus,
      'created_at': instance.createdAt,
      'canonical_party_id': instance.canonicalPartyId,
      'person_profile': instance.personProfile,
      'organization_profile': instance.organizationProfile,
    };
