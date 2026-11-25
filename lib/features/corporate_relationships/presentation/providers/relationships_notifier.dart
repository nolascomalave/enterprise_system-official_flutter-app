import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/entities/corporate_relationship.dart';
import 'relationships_providers.dart';

part 'relationships_notifier.g.dart';

/// Lista de relaciones corporativas + acciones de la máquina de estados.
@riverpod
class RelationshipsNotifier extends _$RelationshipsNotifier {
  @override
  Future<List<CorporateRelationship>> build() async {
    final useCase = await ref.watch(getRelationshipsUseCaseProvider.future);
    return useCase();
  }

  Future<void> _refresh() async {
    ref.invalidateSelf();
    await future;
  }

  Future<void> initiate({required String holdingTenantId}) async {
    final useCase = await ref.read(initiateRelationshipUseCaseProvider.future);
    await useCase(holdingTenantId: holdingTenantId);
    await _refresh();
  }

  Future<InviteToken> emitToken(String relationshipId) async {
    final useCase = await ref.read(emitInviteTokenUseCaseProvider.future);
    return useCase(relationshipId);
  }

  /// Consumir el token aprueba la relación; se refleja al refrescar.
  Future<void> consumeToken(String token) async {
    final useCase = await ref.read(consumeInviteTokenUseCaseProvider.future);
    await useCase(token);
    await _refresh();
  }

  Future<void> reject(String relationshipId, {String? reason}) async {
    final useCase = await ref.read(rejectRelationshipUseCaseProvider.future);
    await useCase(relationshipId, reason: reason);
    await _refresh();
  }

  Future<void> revoke(String relationshipId, {String? reason}) async {
    final useCase = await ref.read(revokeRelationshipUseCaseProvider.future);
    await useCase(relationshipId, reason: reason);
    await _refresh();
  }

  Future<void> cancel(String relationshipId) async {
    final useCase = await ref.read(cancelRelationshipUseCaseProvider.future);
    await useCase(relationshipId);
    await _refresh();
  }

  Future<void> refresh() => _refresh();
}
