/// Estado de una relación holding-filial.
enum RelationshipStatus {
  pending,
  approved,
  rejected,
  revoked,
  cancelled,
  unknown;

  static RelationshipStatus fromApi(String? value) {
    return switch (value?.toUpperCase()) {
      'PENDING' => pending,
      'APPROVED' => approved,
      'REJECTED' => rejected,
      'REVOKED' => revoked,
      'CANCELLED' || 'CANCELED' => cancelled,
      _ => unknown,
    };
  }

  String get label => switch (this) {
        RelationshipStatus.pending => 'Pendiente',
        RelationshipStatus.approved => 'Aprobada',
        RelationshipStatus.rejected => 'Rechazada',
        RelationshipStatus.revoked => 'Revocada',
        RelationshipStatus.cancelled => 'Cancelada',
        RelationshipStatus.unknown => 'Desconocida',
      };
}

/// Rol del tenant actual dentro de una relación.
enum RelationshipRole { holding, subsidiary, unknown }

/// Relación corporativa entre un holding y una filial.
class CorporateRelationship {
  const CorporateRelationship({
    required this.id,
    required this.status,
    required this.holdingId,
    required this.subsidiaryId,
    this.holdingName,
    this.subsidiaryName,
    this.createdAt,
    this.rejectionReason,
    this.revocationReason,
  });

  final String id;
  final RelationshipStatus status;
  final String holdingId;
  final String subsidiaryId;
  final String? holdingName;
  final String? subsidiaryName;

  /// ISO-8601.
  final String? createdAt;
  final String? rejectionReason;
  final String? revocationReason;

  bool get isActiveReason =>
      (rejectionReason?.isNotEmpty ?? false) ||
      (revocationReason?.isNotEmpty ?? false);

  String? get reason =>
      rejectionReason?.isNotEmpty == true ? rejectionReason : revocationReason;

  String get dateLabel {
    final value = createdAt;
    if (value == null || value.isEmpty) return '—';
    return value.length >= 10 ? value.substring(0, 10) : value;
  }

  String get holdingLabel =>
      holdingName?.isNotEmpty == true ? holdingName! : holdingId;

  String get subsidiaryLabel =>
      subsidiaryName?.isNotEmpty == true ? subsidiaryName! : subsidiaryId;

  RelationshipRole roleFor(String? tenantId) {
    if (tenantId == null || tenantId.isEmpty) return RelationshipRole.unknown;
    if (tenantId == holdingId) return RelationshipRole.holding;
    if (tenantId == subsidiaryId) return RelationshipRole.subsidiary;
    return RelationshipRole.unknown;
  }
}

/// Token de invitación emitido por el holding.
class InviteToken {
  const InviteToken({required this.token, this.expiresAt});

  final String token;
  final String? expiresAt;
}
