import 'package:freezed_annotation/freezed_annotation.dart';

import 'party_dto.dart';

part 'update_party_dto.freezed.dart';
part 'update_party_dto.g.dart';

/// Body de `PUT /parties/{id}`.
@freezed
abstract class UpdatePartyRequestDto with _$UpdatePartyRequestDto {
  const factory UpdatePartyRequestDto({
    @JsonKey(name: 'display_name') required String displayName,
    @JsonKey(name: 'party_type') required String partyType,
    @JsonKey(name: 'person_profile', includeIfNull: false)
    CreatePersonProfileDto? personProfile,
    @JsonKey(name: 'organization_profile', includeIfNull: false)
    CreateOrganizationProfileDto? organizationProfile,
  }) = _UpdatePartyRequestDto;

  factory UpdatePartyRequestDto.fromJson(Map<String, dynamic> json) =>
      _$UpdatePartyRequestDtoFromJson(json);
}
