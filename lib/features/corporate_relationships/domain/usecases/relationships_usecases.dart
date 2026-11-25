import '../entities/corporate_relationship.dart';
import '../repositories/relationships_repository.dart';

class GetRelationshipsUseCase {
  const GetRelationshipsUseCase(this._repository);

  final RelationshipsRepository _repository;

  Future<List<CorporateRelationship>> call() => _repository.getRelationships();
}

class InitiateRelationshipUseCase {
  const InitiateRelationshipUseCase(this._repository);

  final RelationshipsRepository _repository;

  Future<void> call({required String holdingTenantId}) =>
      _repository.initiate(holdingTenantId: holdingTenantId);
}

class EmitInviteTokenUseCase {
  const EmitInviteTokenUseCase(this._repository);

  final RelationshipsRepository _repository;

  Future<InviteToken> call(String relationshipId) =>
      _repository.emitToken(relationshipId);
}

class ConsumeInviteTokenUseCase {
  const ConsumeInviteTokenUseCase(this._repository);

  final RelationshipsRepository _repository;

  Future<void> call(String token) => _repository.consumeToken(token);
}

class RejectRelationshipUseCase {
  const RejectRelationshipUseCase(this._repository);

  final RelationshipsRepository _repository;

  Future<void> call(String relationshipId, {String? reason}) =>
      _repository.reject(relationshipId, reason: reason);
}

class RevokeRelationshipUseCase {
  const RevokeRelationshipUseCase(this._repository);

  final RelationshipsRepository _repository;

  Future<void> call(String relationshipId, {String? reason}) =>
      _repository.revoke(relationshipId, reason: reason);
}

class CancelRelationshipUseCase {
  const CancelRelationshipUseCase(this._repository);

  final RelationshipsRepository _repository;

  Future<void> call(String relationshipId) =>
      _repository.cancel(relationshipId);
}
