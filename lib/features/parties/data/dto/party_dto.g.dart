// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'party_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PersonProfileDto _$PersonProfileDtoFromJson(Map<String, dynamic> json) =>
    _PersonProfileDto(
      id: json['id'] as String?,
      partyId: json['party_id'] as String?,
      firstName: json['first_name'] as String?,
      middleName: json['middle_name'] as String?,
      lastName: json['last_name'] as String?,
      secondLastName: json['second_last_name'] as String?,
      birthDate: json['birth_date'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$PersonProfileDtoToJson(_PersonProfileDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'party_id': instance.partyId,
      'first_name': instance.firstName,
      'middle_name': instance.middleName,
      'last_name': instance.lastName,
      'second_last_name': instance.secondLastName,
      'birth_date': instance.birthDate,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

_OrganizationProfileDto _$OrganizationProfileDtoFromJson(
  Map<String, dynamic> json,
) => _OrganizationProfileDto(
  id: json['id'] as String?,
  partyId: json['party_id'] as String?,
  legalName: json['legal_name'] as String?,
  tradeName: json['trade_name'] as String?,
  taxId: json['tax_id'] as String?,
  createdAt: json['created_at'] as String?,
  updatedAt: json['updated_at'] as String?,
);

Map<String, dynamic> _$OrganizationProfileDtoToJson(
  _OrganizationProfileDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'party_id': instance.partyId,
  'legal_name': instance.legalName,
  'trade_name': instance.tradeName,
  'tax_id': instance.taxId,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
};

_PartyDto _$PartyDtoFromJson(Map<String, dynamic> json) => _PartyDto(
  id: json['id'] as String?,
  canonicalPartyId: json['canonical_party_id'] as String?,
  displayName: json['display_name'] as String?,
  partyType: json['party_type'] as String?,
  recordStatus: json['record_status'] as String?,
  tenantId: json['tenant_id'] as String?,
  createdAt: json['created_at'] as String?,
  updatedAt: json['updated_at'] as String?,
  deletedAt: json['deleted_at'] as String?,
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

Map<String, dynamic> _$PartyDtoToJson(_PartyDto instance) => <String, dynamic>{
  'id': instance.id,
  'canonical_party_id': instance.canonicalPartyId,
  'display_name': instance.displayName,
  'party_type': instance.partyType,
  'record_status': instance.recordStatus,
  'tenant_id': instance.tenantId,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
  'deleted_at': instance.deletedAt,
  'person_profile': instance.personProfile,
  'organization_profile': instance.organizationProfile,
};

_CreatePersonProfileDto _$CreatePersonProfileDtoFromJson(
  Map<String, dynamic> json,
) => _CreatePersonProfileDto(
  firstName: json['first_name'] as String?,
  middleName: json['middle_name'] as String?,
  lastName: json['last_name'] as String?,
  secondLastName: json['second_last_name'] as String?,
  birthDate: json['birth_date'] as String?,
);

Map<String, dynamic> _$CreatePersonProfileDtoToJson(
  _CreatePersonProfileDto instance,
) => <String, dynamic>{
  'first_name': ?instance.firstName,
  'middle_name': ?instance.middleName,
  'last_name': ?instance.lastName,
  'second_last_name': ?instance.secondLastName,
  'birth_date': ?instance.birthDate,
};

_CreateOrganizationProfileDto _$CreateOrganizationProfileDtoFromJson(
  Map<String, dynamic> json,
) => _CreateOrganizationProfileDto(
  legalName: json['legal_name'] as String?,
  tradeName: json['trade_name'] as String?,
  taxId: json['tax_id'] as String?,
);

Map<String, dynamic> _$CreateOrganizationProfileDtoToJson(
  _CreateOrganizationProfileDto instance,
) => <String, dynamic>{
  'legal_name': ?instance.legalName,
  'trade_name': ?instance.tradeName,
  'tax_id': ?instance.taxId,
};

_CreatePartyRequestDto _$CreatePartyRequestDtoFromJson(
  Map<String, dynamic> json,
) => _CreatePartyRequestDto(
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

Map<String, dynamic> _$CreatePartyRequestDtoToJson(
  _CreatePartyRequestDto instance,
) => <String, dynamic>{
  'display_name': instance.displayName,
  'party_type': instance.partyType,
  'person_profile': ?instance.personProfile,
  'organization_profile': ?instance.organizationProfile,
};
