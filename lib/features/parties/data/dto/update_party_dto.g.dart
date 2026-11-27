// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_party_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UpdatePartyRequestDto _$UpdatePartyRequestDtoFromJson(
  Map<String, dynamic> json,
) => _UpdatePartyRequestDto(
  displayName: json['display_name'] as String,
  partyType: json['party_type'] as String,
  personProfile: json['person_profile'] == null
      ? null
      : CreatePersonProfileDto.fromJson(
          json['person_profile'] as Map<String, dynamic>,
        ),
  organizationProfile: json['organization_profile'] == null
      ? null
      : CreateOrganizationProfileDto.fromJson(
          json['organization_profile'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$UpdatePartyRequestDtoToJson(
  _UpdatePartyRequestDto instance,
) => <String, dynamic>{
  'display_name': instance.displayName,
  'party_type': instance.partyType,
  'person_profile': ?instance.personProfile,
  'organization_profile': ?instance.organizationProfile,
};
