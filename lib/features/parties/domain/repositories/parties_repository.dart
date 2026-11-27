import '../entities/merge_parties_result.dart';
import '../entities/party.dart';
import '../entities/party_detail.dart';

/// Puerto del repositorio de parties.
abstract interface class PartiesRepository {
  Future<List<Party>> getParties();

  Future<PartyDetail> getPartyById(String partyId);

  Future<Party> createParty(CreatePartyParams params);

  /// `POST /parties/merge` — fusiona source en target (Golden Record).
  Future<MergePartiesResult> mergeParties({
    required String sourcePartyId,
    required String targetPartyId,
  });

  /// `PUT /parties/{id}` — actualiza el party y su perfil.
  Future<void> updateParty(String partyId, UpdatePartyParams params);
}

/// Datos del formulario de creación (mapeados al request del backend).
class CreatePartyParams {
  const CreatePartyParams({
    required this.displayName,
    required this.partyType,
    this.firstName,
    this.lastName,
    this.secondLastName,
    this.legalName,
    this.taxId,
    this.tradeName,
  });

  final String displayName;
  final PartyType partyType;

  // INDIVIDUAL
  final String? firstName;
  final String? lastName;
  final String? secondLastName;

  // ORGANIZATION
  final String? legalName;
  final String? taxId;
  final String? tradeName;
}

/// Datos editables de una party (party_type es inmutable).
class UpdatePartyParams {
  const UpdatePartyParams({
    required this.displayName,
    required this.partyType,
    this.firstName,
    this.middleName,
    this.lastName,
    this.secondLastName,
    this.birthDate,
    this.legalName,
    this.tradeName,
    this.taxId,
  });

  final String displayName;
  final PartyType partyType;

  // INDIVIDUAL
  final String? firstName;
  final String? middleName;
  final String? lastName;
  final String? secondLastName;
  final String? birthDate;

  // ORGANIZATION
  final String? legalName;
  final String? tradeName;
  final String? taxId;
}
