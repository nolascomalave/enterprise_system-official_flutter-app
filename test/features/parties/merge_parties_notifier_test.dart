import 'package:enterprise_app/features/parties/domain/entities/merge_parties_result.dart';
import 'package:enterprise_app/features/parties/domain/entities/party.dart';
import 'package:enterprise_app/features/parties/domain/entities/party_detail.dart';
import 'package:enterprise_app/features/parties/domain/repositories/parties_repository.dart';
import 'package:enterprise_app/features/parties/presentation/providers/merge_parties_notifier.dart';
import 'package:enterprise_app/features/parties/presentation/providers/parties_notifier.dart';
import 'package:enterprise_app/features/parties/presentation/providers/parties_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

class FakePartiesRepository implements PartiesRepository {
  final List<Party> parties = [
    const Party(
      id: 'p1',
      displayName: 'Acme Corp',
      partyType: PartyType.organization,
    ),
    const Party(
      id: 'p2',
      displayName: 'Acme Corporation',
      partyType: PartyType.organization,
    ),
  ];

  int fetchCalls = 0;
  String? lastSourceId;
  String? lastTargetId;

  @override
  Future<List<Party>> getParties() async {
    fetchCalls++;
    return List.of(parties);
  }

  @override
  Future<void> updateParty(String partyId, UpdatePartyParams params) {
    throw UnimplementedError();
  }

  @override
  Future<MergePartiesResult> mergeParties({
    required String sourcePartyId,
    required String targetPartyId,
  }) async {
    lastSourceId = sourcePartyId;
    lastTargetId = targetPartyId;
    for (var i = 0; i < parties.length; i++) {
      if (parties[i].id == sourcePartyId) {
        parties[i] = Party(
          id: parties[i].id,
          displayName: parties[i].displayName,
          partyType: parties[i].partyType,
          recordStatus: 'MERGED',
          canonicalPartyId: targetPartyId,
        );
      }
    }
    return MergePartiesResult(
      sourceId: sourcePartyId,
      targetId: targetPartyId,
      compressedPartyIds: const ['p3'],
      mergedAt: '2026-11-26T10:00:00Z',
    );
  }

  @override
  Future<PartyDetail> getPartyById(String partyId) =>
      throw UnimplementedError();

  @override
  Future<Party> createParty(CreatePartyParams params) =>
      throw UnimplementedError();
}

void main() {
  test('merge fusiona source en target y refresca la lista', () async {
    final repository = FakePartiesRepository();
    final container = ProviderContainer(
      overrides: [
        partiesRepositoryProvider.overrideWith((ref) async => repository),
      ],
    );
    addTearDown(container.dispose);
    final partiesSub = container.listen(partiesProvider, (_, _) {});
    final mergeSub = container.listen(mergePartiesProvider, (_, _) {});
    addTearDown(partiesSub.close);
    addTearDown(mergeSub.close);

    await container.read(partiesProvider.future);
    expect(container.read(partiesProvider).value, hasLength(2));
    expect(repository.fetchCalls, 1);

    final notifier = container.read(mergePartiesProvider.notifier);
    final result = await notifier.merge(
      sourcePartyId: 'p2',
      targetPartyId: 'p1',
    );

    expect(repository.lastSourceId, 'p2');
    expect(repository.lastTargetId, 'p1');
    expect(result.sourceId, 'p2');
    expect(result.targetId, 'p1');
    expect(result.compressedPartyIds, contains('p3'));
    expect(
      container.read(mergePartiesProvider),
      isA<AsyncData<MergePartiesResult?>>(),
    );

    // La lista se refrescó y el source quedó marcado como fusionado.
    final refreshed = await container.read(partiesProvider.future);
    expect(repository.fetchCalls, 2);
    final source = refreshed.firstWhere((party) => party.id == 'p2');
    expect(source.isMerged, isTrue);
    expect(source.canonicalPartyId, 'p1');
  });
}
