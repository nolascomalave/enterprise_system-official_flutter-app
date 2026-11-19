/// Tipo de party para los registros recientes.
enum RecentPartyType {
  individual,
  organization;

  static RecentPartyType fromApi(String? value) =>
      value?.toUpperCase() == 'ORGANIZATION' ? organization : individual;

  String get label => this == RecentPartyType.organization ? 'Organización' : 'Persona';
}

/// Party reciente mostrada en el data grid del dashboard.
class RecentParty {
  const RecentParty({
    required this.id,
    required this.displayName,
    required this.type,
    required this.status,
    this.createdAt,
  });

  final String id;
  final String displayName;
  final RecentPartyType type;
  final String status;
  final String? createdAt;

  bool get isActive => status.toUpperCase() == 'ACTIVE';

  /// Fecha corta `YYYY-MM-DD` a partir del ISO devuelto por el backend.
  String get dateLabel {
    final value = createdAt;
    if (value == null || value.isEmpty) return '—';
    return value.length >= 10 ? value.substring(0, 10) : value;
  }

  String get initials {
    final parts = displayName
        .trim()
        .split(RegExp(r'\s+'))
        .where((part) => part.isNotEmpty)
        .toList();
    if (parts.isEmpty) return '?';
    if (parts.length == 1) {
      final single = parts.first;
      return (single.length >= 2 ? single.substring(0, 2) : single).toUpperCase();
    }
    return '${parts.first.substring(0, 1)}${parts[1].substring(0, 1)}'.toUpperCase();
  }
}

/// Resumen del dashboard (`GET /dashboard/summary`).
class DashboardSummary {
  const DashboardSummary({
    required this.totalParties,
    required this.totalEmployees,
    required this.totalDepartments,
    required this.recentParties,
  });

  final int totalParties;
  final int totalEmployees;
  final int totalDepartments;
  final List<RecentParty> recentParties;
}
