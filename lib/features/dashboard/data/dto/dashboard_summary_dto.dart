import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/dashboard_summary.dart';

part 'dashboard_summary_dto.freezed.dart';
part 'dashboard_summary_dto.g.dart';

/// Party reciente del resumen.
@freezed
abstract class RecentPartyDto with _$RecentPartyDto {
  const factory RecentPartyDto({
    String? id,
    @JsonKey(name: 'display_name') String? displayName,
    @JsonKey(name: 'party_type') String? partyType,
    @JsonKey(name: 'record_status') String? recordStatus,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
  }) = _RecentPartyDto;

  factory RecentPartyDto.fromJson(Map<String, dynamic> json) =>
      _$RecentPartyDtoFromJson(json);
}

/// Respuesta de `GET /dashboard/summary`.
@freezed
abstract class DashboardSummaryDto with _$DashboardSummaryDto {
  const factory DashboardSummaryDto({
    @JsonKey(name: 'total_parties') @Default(0) int totalParties,
    @JsonKey(name: 'total_employees') @Default(0) int totalEmployees,
    @JsonKey(name: 'total_departments') @Default(0) int totalDepartments,
    @JsonKey(name: 'recent_parties')
    @Default(<RecentPartyDto>[])
    List<RecentPartyDto> recentParties,
  }) = _DashboardSummaryDto;

  factory DashboardSummaryDto.fromJson(Map<String, dynamic> json) =>
      _$DashboardSummaryDtoFromJson(json);
}

extension DashboardSummaryDtoMapper on DashboardSummaryDto {
  DashboardSummary toEntity() => DashboardSummary(
        totalParties: totalParties,
        totalEmployees: totalEmployees,
        totalDepartments: totalDepartments,
        recentParties: [
          for (final party in recentParties)
            RecentParty(
              id: party.id ?? '',
              displayName: party.displayName ?? '—',
              type: RecentPartyType.fromApi(party.partyType),
              status: party.recordStatus ?? 'ACTIVE',
              createdAt: party.createdAt,
            ),
        ],
      );
}
