import '../entities/party.dart';
import '../entities/party_detail.dart';

/// Puerto del repositorio de parties.
abstract interface class PartiesRepository {
  Future<List<Party>> getParties();

  Future<PartyDetail> getPartyById(String partyId);

  Future<Party> createParty(CreatePartyParams params);
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
