import 'package:enterprise_app/features/corporate_relationships/domain/entities/corporate_relationship.dart';
import 'package:enterprise_app/features/corporate_relationships/domain/repositories/relationships_repository.dart';
import 'package:enterprise_app/features/corporate_relationships/presentation/providers/relationship_detail_notifier.dart';
import 'package:enterprise_app/features/corporate_relationships/presentation/providers/relationships_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

class FakeRelationshipsRepository implements RelationshipsRepository {
  FakeRelationshipsRepository(this.relationships);

  final List<CorporateRelationship> relationships;
  int fetchCalls = 0;

  @override
  Future<List<CorporateRelationship>> getRelationships() async {
    fetchCalls++;
    return relationships;
  }

  @override
  Future<void> initiate({required String holdingTenantId}) async {}

  @override
  Future<InviteToken> emitToken(String relationshipId) async =>
      const InviteToken(token: 'token');

  @override
  Future<void> consumeToken(String token) async {}

  @override
  Future<void> reject(String relationshipId, {String? reason}) async {}

  @override
  Future<void> revoke(String relationshipId, {String? reason}) async {}

  @override
  Future<void> cancel(String relationshipId) async {}
}

const relationship = CorporateRelationship(
  id: 'r1',
  status: RelationshipStatus.approved,
  holdingId: 'h1',
  subsidiaryId: 's1',
  holdingName: 'Acme Holding',
  subsidiaryName: 'Acme Sub',
  requestedAt: '2026-01-01T10:00:00Z',
  approvedAt: '2026-01-02T14:30:00Z',
);

void main() {
  test('carga la relación por ID desde el listado', () async {
    final repository = FakeRelationshipsRepository(const [relationship]);
    final container = ProviderContainer(
      overrides: [
        relationshipsRepositoryProvider.overrideWith((ref) async => repository),
      ],
    );
    addTearDown(container.dispose);
    final sub = container.listen(
      relationshipDetailProvider('r1'),
      (previous, next) {},
    );
    addTearDown(sub.close);

    final result = await container.read(
      relationshipDetailProvider('r1').future,
    );

    expect(result.id, 'r1');
    expect(result.status, RelationshipStatus.approved);
    expect(result.requestedAt, '2026-01-01T10:00:00Z');
    expect(result.approvedAt, '2026-01-02T14:30:00Z');
    expect(repository.fetchCalls, 1);
  });
}
