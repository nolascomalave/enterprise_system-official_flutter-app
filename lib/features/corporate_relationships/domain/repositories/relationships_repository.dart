import '../entities/corporate_relationship.dart';

/// Puerto de relaciones corporativas (holding-filial).
///
/// Rutas asumidas del backend (documentadas en la implementación):
/// - GET  /tenant-relationships
/// - POST /tenant-relationships/initiate
/// - POST /tenant-relationships/{id}/emit-token
/// - POST /tenant-relationships/consume-token
/// - POST /tenant-relationships/{id}/reject
/// - POST /tenant-relationships/{id}/revoke
/// - POST /tenant-relationships/{id}/cancel
abstract interface class RelationshipsRepository {
  Future<List<CorporateRelationship>> getRelationships();

  Future<void> initiate({required String holdingTenantId});

  Future<InviteToken> emitToken(String relationshipId);

  Future<void> consumeToken(String token);

  Future<void> reject(String relationshipId, {String? reason});

  Future<void> revoke(String relationshipId, {String? reason});

  Future<void> cancel(String relationshipId);
}
