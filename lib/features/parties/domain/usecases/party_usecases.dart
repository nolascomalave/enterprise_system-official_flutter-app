import '../entities/merge_parties_result.dart';
import '../entities/party.dart';
import '../entities/party_detail.dart';
import '../repositories/parties_repository.dart';

/// Caso de uso: listar parties activas.
class GetPartiesUseCase {
  const GetPartiesUseCase(this._repository);

  final PartiesRepository _repository;

  Future<List<Party>> call() => _repository.getParties();
}

/// Caso de uso: obtener el detalle de una party.
class GetPartyDetailUseCase {
  const GetPartyDetailUseCase(this._repository);

  final PartiesRepository _repository;

  Future<PartyDetail> call(String partyId) => _repository.getPartyById(partyId);
}

/// Caso de uso: crear una party (persona u organización).
class CreatePartyUseCase {
  const CreatePartyUseCase(this._repository);

  final PartiesRepository _repository;

  Future<Party> call(CreatePartyParams params) =>
      _repository.createParty(params);
}

/// Caso de uso: actualizar una party existente.
class UpdatePartyUseCase {
  const UpdatePartyUseCase(this._repository);

  final PartiesRepository _repository;

  Future<void> call(String partyId, UpdatePartyParams data) =>
      _repository.updateParty(partyId, data);
}

/// Caso de uso: fusionar dos parties (Golden Record).
class MergePartiesUseCase {
  const MergePartiesUseCase(this._repository);

  final PartiesRepository _repository;

  Future<MergePartiesResult> call({
    required String sourcePartyId,
    required String targetPartyId,
  }) => _repository.mergeParties(
    sourcePartyId: sourcePartyId,
    targetPartyId: targetPartyId,
  );
}
