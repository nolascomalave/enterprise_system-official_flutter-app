/// Tipo de party según el backend.
enum PartyType {
  individual,
  organization;

  static PartyType fromApi(String value) =>
      value.toUpperCase() == 'ORGANIZATION' ? organization : individual;

  String get apiValue => name.toUpperCase();

  String get label => this == PartyType.organization ? 'Organización' : 'Persona';
}

/// Entidad de dominio Party.
class Party {
  const Party({
    required this.id,
    required this.displayName,
    required this.partyType,
    this.recordStatus = 'ACTIVE',
    this.firstName,
    this.lastName,
    this.legalName,
    this.taxId,
    this.createdAt,
  });

  final String id;
  final String displayName;
  final PartyType partyType;
  final String recordStatus;
  final String? firstName;
  final String? lastName;
  final String? legalName;
  final String? taxId;
  final String? createdAt;

  bool get isActive => recordStatus.toUpperCase() == 'ACTIVE';

  /// Detalle breve según el tipo de party.
  String get profileDetail {
    if (partyType == PartyType.organization) {
      return taxId?.isNotEmpty == true ? taxId! : (legalName ?? '—');
    }
    final name = [firstName, lastName].whereType<String>().where((v) => v.isNotEmpty).join(' ');
    return name.isEmpty ? '—' : name;
  }

  /// Iniciales para el avatar.
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
