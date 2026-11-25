/// Perfil de persona en el detalle.
class PersonInfo {
  const PersonInfo({
    this.firstName,
    this.middleName,
    this.lastName,
    this.secondLastName,
    this.birthDate,
  });

  final String? firstName;
  final String? middleName;
  final String? lastName;
  final String? secondLastName;
  final String? birthDate;
}

/// Perfil de organización en el detalle.
class OrganizationInfo {
  const OrganizationInfo({this.legalName, this.tradeName, this.taxId});

  final String? legalName;
  final String? tradeName;
  final String? taxId;
}

class PartyContact {
  const PartyContact({
    required this.type,
    required this.value,
    this.isPrimary = false,
  });

  final String type;
  final String value;
  final bool isPrimary;

  bool get isEmail => type.toLowerCase().contains('mail');
  bool get isPhone => type.toLowerCase().contains('phone') ||
      type.toLowerCase().contains('tel');
}

class PartyAddress {
  const PartyAddress({required this.type, required this.text});

  final String type;
  final String text;
}

class PartyNameEntry {
  const PartyNameEntry({required this.name, this.validFrom, this.validTo});

  final String name;
  final String? validFrom;
  final String? validTo;
}

class PartyDocument {
  const PartyDocument({required this.type, required this.value});

  final String type;
  final String value;
}

/// Detalle completo de una party.
class PartyDetail {
  const PartyDetail({
    required this.id,
    required this.displayName,
    required this.partyType,
    required this.recordStatus,
    this.createdAt,
    this.person,
    this.organization,
    this.contacts = const [],
    this.addresses = const [],
    this.names = const [],
    this.nationalities = const [],
    this.documents = const [],
  });

  final String id;
  final String displayName;
  final String partyType;
  final String recordStatus;
  final String? createdAt;
  final PersonInfo? person;
  final OrganizationInfo? organization;
  final List<PartyContact> contacts;
  final List<PartyAddress> addresses;
  final List<PartyNameEntry> names;
  final List<String> nationalities;
  final List<PartyDocument> documents;

  bool get isOrganization => partyType.toUpperCase() == 'ORGANIZATION';
  bool get isActive => recordStatus.toUpperCase() == 'ACTIVE';

  String get typeLabel => isOrganization ? 'Organización' : 'Persona';

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
