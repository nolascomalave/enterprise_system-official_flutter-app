import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/merge_parties_result.dart';

part 'merge_parties_dto.freezed.dart';
part 'merge_parties_dto.g.dart';

/// Body de `POST /parties/merge`.
@freezed
abstract class MergePartiesRequestDto with _$MergePartiesRequestDto {
  const factory MergePartiesRequestDto({
    @JsonKey(name: 'source_party_id') required String sourcePartyId,
    @JsonKey(name: 'target_party_id') required String targetPartyId,
  }) = _MergePartiesRequestDto;

  factory MergePartiesRequestDto.fromJson(Map<String, dynamic> json) =>
      _$MergePartiesRequestDtoFromJson(json);
}

/// Respuesta de `POST /parties/merge`.
@freezed
abstract class MergePartiesResponseDto with _$MergePartiesResponseDto {
  const factory MergePartiesResponseDto({
    @JsonKey(name: 'source_id') String? sourceId,
    @JsonKey(name: 'target_id') String? targetId,
    @JsonKey(name: 'compressed_party_ids')
    @Default(<String>[])
    List<String> compressedPartyIds,
    @JsonKey(name: 'merged_at') String? mergedAt,
  }) = _MergePartiesResponseDto;

  factory MergePartiesResponseDto.fromJson(Map<String, dynamic> json) =>
      _$MergePartiesResponseDtoFromJson(json);
}

extension MergePartiesResponseDtoMapper on MergePartiesResponseDto {
  MergePartiesResult toEntity() => MergePartiesResult(
    sourceId: sourceId ?? '',
    targetId: targetId ?? '',
    compressedPartyIds: compressedPartyIds,
    mergedAt: mergedAt,
  );
}
