import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/corporate_relationship.dart';

part 'relationship_dto.freezed.dart';
part 'relationship_dto.g.dart';

/// Relación corporativa (`GET /corporate-relationships`).
@freezed
abstract class TenantRelationshipDto with _$TenantRelationshipDto {
  const factory TenantRelationshipDto({
    String? id,
    String? status,
    @JsonKey(name: 'holding_id') String? holdingId,
    @JsonKey(name: 'subsidiary_id') String? subsidiaryId,
    @JsonKey(name: 'tenant_id_holding') String? tenantIdHolding,
    @JsonKey(name: 'tenant_id_subsidiary') String? tenantIdSubsidiary,
    @JsonKey(name: 'holding_tenant_id') String? holdingTenantId,
    @JsonKey(name: 'subsidiary_tenant_id') String? subsidiaryTenantId,
    @JsonKey(name: 'holding_name') String? holdingName,
    @JsonKey(name: 'subsidiary_name') String? subsidiaryName,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
    @JsonKey(name: 'requested_at') String? requestedAt,
    @JsonKey(name: 'approved_at') String? approvedAt,
    @JsonKey(name: 'rejected_at') String? rejectedAt,
    @JsonKey(name: 'canceled_at') String? canceledAt,
    @JsonKey(name: 'ends_at') String? endsAt,
    @JsonKey(name: 'token_emitted_at') String? tokenEmittedAt,
    @JsonKey(name: 'issued_at') String? issuedAt,
    @JsonKey(name: 'revoked_at') String? revokedAt,
    @JsonKey(name: 'rejection_reason') String? rejectionReason,
    @JsonKey(name: 'revocation_reason') String? revocationReason,
    @JsonKey(name: 'cancellation_reason') String? cancellationReason,
  }) = _TenantRelationshipDto;

  factory TenantRelationshipDto.fromJson(Map<String, dynamic> json) =>
      _$TenantRelationshipDtoFromJson(json);
}

/// Body de `POST /corporate-relationships/initiate`.
@freezed
abstract class InitiateRelationshipRequestDto
    with _$InitiateRelationshipRequestDto {
  const factory InitiateRelationshipRequestDto({
    @JsonKey(name: 'holding_tenant_id') required String holdingTenantId,
  }) = _InitiateRelationshipRequestDto;

  factory InitiateRelationshipRequestDto.fromJson(Map<String, dynamic> json) =>
      _$InitiateRelationshipRequestDtoFromJson(json);
}

/// Respuesta de `POST /corporate-relationships/{id}/emit-token`.
@freezed
abstract class EmitInviteTokenResponseDto with _$EmitInviteTokenResponseDto {
  const factory EmitInviteTokenResponseDto({
    String? token,
    @JsonKey(name: 'expires_at') String? expiresAt,
  }) = _EmitInviteTokenResponseDto;

  factory EmitInviteTokenResponseDto.fromJson(Map<String, dynamic> json) =>
      _$EmitInviteTokenResponseDtoFromJson(json);
}

/// Body de `POST /corporate-relationships/consume-token`.
@freezed
abstract class ConsumeInviteTokenRequestDto
    with _$ConsumeInviteTokenRequestDto {
  const factory ConsumeInviteTokenRequestDto({required String token}) =
      _ConsumeInviteTokenRequestDto;

  factory ConsumeInviteTokenRequestDto.fromJson(Map<String, dynamic> json) =>
      _$ConsumeInviteTokenRequestDtoFromJson(json);
}

/// Body opcional para reject/revoke.
@freezed
abstract class RelationshipReasonRequestDto
    with _$RelationshipReasonRequestDto {
  const factory RelationshipReasonRequestDto({
    @JsonKey(includeIfNull: false) String? reason,
  }) = _RelationshipReasonRequestDto;

  factory RelationshipReasonRequestDto.fromJson(Map<String, dynamic> json) =>
      _$RelationshipReasonRequestDtoFromJson(json);
}

extension TenantRelationshipDtoMapper on TenantRelationshipDto {
  CorporateRelationship toEntity() => CorporateRelationship(
    id: id ?? '',
    status: RelationshipStatus.fromApi(status),
    holdingId: holdingId ?? tenantIdHolding ?? holdingTenantId ?? '',
    subsidiaryId:
        subsidiaryId ?? tenantIdSubsidiary ?? subsidiaryTenantId ?? '',
    holdingName: holdingName,
    subsidiaryName: subsidiaryName,
    createdAt: createdAt ?? requestedAt,
    requestedAt: requestedAt,
    approvedAt: approvedAt,
    rejectedAt: rejectedAt,
    canceledAt: canceledAt,
    endsAt: endsAt,
    tokenEmittedAt: tokenEmittedAt ?? issuedAt,
    revokedAt: revokedAt,
    rejectionReason: rejectionReason,
    revocationReason: revocationReason,
    cancellationReason: cancellationReason,
  );
}
