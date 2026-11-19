// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_summary_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RecentPartyDto _$RecentPartyDtoFromJson(Map<String, dynamic> json) =>
    _RecentPartyDto(
      id: json['id'] as String?,
      displayName: json['display_name'] as String?,
      partyType: json['party_type'] as String?,
      recordStatus: json['record_status'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$RecentPartyDtoToJson(_RecentPartyDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'display_name': instance.displayName,
      'party_type': instance.partyType,
      'record_status': instance.recordStatus,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

_DashboardSummaryDto _$DashboardSummaryDtoFromJson(Map<String, dynamic> json) =>
    _DashboardSummaryDto(
      totalParties: (json['total_parties'] as num?)?.toInt() ?? 0,
      totalEmployees: (json['total_employees'] as num?)?.toInt() ?? 0,
      totalDepartments: (json['total_departments'] as num?)?.toInt() ?? 0,
      recentParties:
          (json['recent_parties'] as List<dynamic>?)
              ?.map((e) => RecentPartyDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <RecentPartyDto>[],
    );

Map<String, dynamic> _$DashboardSummaryDtoToJson(
  _DashboardSummaryDto instance,
) => <String, dynamic>{
  'total_parties': instance.totalParties,
  'total_employees': instance.totalEmployees,
  'total_departments': instance.totalDepartments,
  'recent_parties': instance.recentParties,
};
