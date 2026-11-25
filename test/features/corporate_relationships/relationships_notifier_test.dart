import 'package:enterprise_app/features/corporate_relationships/domain/entities/corporate_relationship.dart';
import 'package:enterprise_app/features/corporate_relationships/domain/repositories/relationships_repository.dart';
import 'package:enterprise_app/features/corporate_relationships/presentation/providers/relationships_notifier.dart';
import 'package:enterprise_app/features/corporate_relationships/presentation/providers/relationships_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

class FakeRelationshipsRepository implements RelationshipsRepository {
  FakeRelationshipsRepository({List<CorporateRelationship>? initial})
      : relationships = [...?initial];

  final List<CorporateRelationship> relationships;
  int fetchCalls = 0;
  bool consumeCalled = false;
  String? consumedToken;

  @override
  Future<List<CorporateRelationship>> getRelationships() async {
    fetchCalls++;
    return List.of(relationships);
  }

  @override
  Future<void> consumeToken(String token) async {
    consumeCalled = true;
    consumedToken = token;
    for (var i = 0; i < relationships.length; i++) {
      if (relationships[i].status == RelationshipStatus.pending) {
        relationships[i] = CorporateRelationship(
          id: relationships[i].id,
          status: RelationshipStatus.approved,
          holdingId: relationships[i].holdingId,
          subsidiaryId: relationships[i].subsidiaryId,
        );
      }
    }
  }

  @override
  Future<void> initiate({required String holdingTenantId}) async {}

  @override
  Future<InviteToken> emitToken(String relationshipId) async =>
      const InviteToken(token: 'invite-token');

  @override
  Future<void> reject(String relationshipId, {String? reason}) async {}

  @override
  Future<void> revoke(String relationshipId, {String? reason}) async {}

  @override
  Future<void> cancel(String relationshipId) async {}
}

const pending = CorporateRelationship(
  id: 'r1',
  status: RelationshipStatus.pending,
  holdingId: 'tenant-holding',
  subsidiaryId: 'tenant-sub',
  createdAt: '2026-11-20T10:00:00Z',
);

void main() {
  late FakeRelationshipsRepository repository;
  late ProviderContainer container;

  setUp(() {
    repository = FakeRelationshipsRepository(initial: [pending]);
    container = ProviderContainer(
      overrides: [
        relationshipsRepositoryProvider.overrideWith((ref) async => repository),
      ],
    );
    addTearDown(container.dispose);
    final sub = container.listen(relationshipsProvider, (_, _) {});
    addTearDown(sub.close);
  });

  test('carga la lista de relaciones', () async {
    final relationships = await container.read(relationshipsProvider.future);

    expect(relationships, hasLength(1));
    expect(relationships.single.status, RelationshipStatus.pending);
    expect(relationships.single.holdingId, 'tenant-holding');
    expect(relationships.single.roleFor('tenant-holding'), RelationshipRole.holding);
    expect(relationships.single.roleFor('tenant-sub'), RelationshipRole.subsidiary);
    expect(repository.fetchCalls, 1);
  });

  test('consumir token transiciona PENDING → APPROVED y refresca', () async {
    await container.read(relationshipsProvider.future);

    final notifier = container.read(relationshipsProvider.notifier);
    await notifier.consumeToken('tok-123');

    expect(repository.consumeCalled, isTrue);
    expect(repository.consumedToken, 'tok-123');

    final state = await container.read(relationshipsProvider.future);
    expect(state.single.status, RelationshipStatus.approved);
    expect(repository.fetchCalls, 2);
  });
}
