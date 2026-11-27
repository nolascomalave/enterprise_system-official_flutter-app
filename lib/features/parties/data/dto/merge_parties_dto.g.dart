// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'merge_parties_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MergePartiesRequestDto _$MergePartiesRequestDtoFromJson(
  Map<String, dynamic> json,
) => _MergePartiesRequestDto(
  sourcePartyId: json['source_party_id'] as String,
  targetPartyId: json['target_party_id'] as String,
);

Map<String, dynamic> _$MergePartiesRequestDtoToJson(
  _MergePartiesRequestDto instance,
) => <String, dynamic>{
  'source_party_id': instance.sourcePartyId,
  'target_party_id': instance.targetPartyId,
};

_MergePartiesResponseDto _$MergePartiesResponseDtoFromJson(
  Map<String, dynamic> json,
) => _MergePartiesResponseDto(
  sourceId: json['source_id'] as String?,
  targetId: json['target_id'] as String?,
  compressedPartyIds:
      (json['compressed_party_ids'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const <String>[],
  mergedAt: json['merged_at'] as String?,
);

Map<String, dynamic> _$MergePartiesResponseDtoToJson(
  _MergePartiesResponseDto instance,
) => <String, dynamic>{
  'source_id': instance.sourceId,
  'target_id': instance.targetId,
  'compressed_party_ids': instance.compressedPartyIds,
  'merged_at': instance.mergedAt,
};
