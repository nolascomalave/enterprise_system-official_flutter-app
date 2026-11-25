import '../entities/corporate_relationship.dart';

/// Puerto de relaciones corporativas (holding-filial).
///
/// Rutas asumidas del backend (documentadas en la implementación):
/// - GET  /corporate-relationships
/// - POST /corporate-relationships/initiate
/// - POST /corporate-relationships/{id}/emit-token
/// - POST /corporate-relationships/consume-token
/// - POST /corporate-relationships/{id}/reject
/// - POST /corporate-relationships/{id}/revoke
/// - POST /corporate-relationships/{id}/cancel
abstract interface class RelationshipsRepository {
  Future<List<CorporateRelationship>> getRelationships();

  Future<void> initiate({required String holdingTenantId});

  Future<InviteToken> emitToken(String relationshipId);

  Future<void> consumeToken(String token);

  Future<void> reject(String relationshipId, {String? reason});

  Future<void> revoke(String relationshipId, {String? reason});

  Future<void> cancel(String relationshipId);
}
