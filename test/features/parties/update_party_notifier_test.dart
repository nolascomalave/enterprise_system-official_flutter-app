import 'package:enterprise_app/features/parties/domain/entities/merge_parties_result.dart';
import 'package:enterprise_app/features/parties/domain/entities/party.dart';
import 'package:enterprise_app/features/parties/domain/entities/party_detail.dart';
import 'package:enterprise_app/features/parties/domain/repositories/parties_repository.dart';
import 'package:enterprise_app/features/parties/presentation/providers/parties_notifier.dart';
import 'package:enterprise_app/features/parties/presentation/providers/parties_providers.dart';
import 'package:enterprise_app/features/parties/presentation/providers/party_detail_notifier.dart';
import 'package:enterprise_app/features/parties/presentation/providers/update_party_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

class FakePartiesRepository implements PartiesRepository {
  PartyDetail detail = const PartyDetail(
    id: 'p1',
    displayName: 'Acme Corp',
    partyType: 'ORGANIZATION',
    recordStatus: 'ACTIVE',
    organization: OrganizationInfo(legalName: 'Acme S.A.', taxId: 'B123'),
  );

  int partiesFetches = 0;
  int detailFetches = 0;
  String? updatedId;
  UpdatePartyParams? updatedParams;

  @override
  Future<List<Party>> getParties() async {
    partiesFetches++;
    return [
      Party(
        id: detail.id,
        displayName: detail.displayName,
        partyType: PartyType.organization,
        legalName: detail.organization?.legalName,
        taxId: detail.organization?.taxId,
      ),
    ];
  }

  @override
  Future<PartyDetail> getPartyById(String partyId) async {
    detailFetches++;
    return detail;
  }

  @override
  Future<void> updateParty(String partyId, UpdatePartyParams params) async {
    updatedId = partyId;
    updatedParams = params;
    detail = PartyDetail(
      id: detail.id,
      displayName: params.displayName,
      partyType: detail.partyType,
      recordStatus: detail.recordStatus,
      organization: OrganizationInfo(
        legalName: params.legalName,
        tradeName: params.tradeName,
        taxId: params.taxId,
      ),
    );
  }

  @override
  Future<MergePartiesResult> mergeParties({
    required String sourcePartyId,
    required String targetPartyId,
  }) => throw UnimplementedError();

  @override
  Future<Party> createParty(CreatePartyParams params) =>
      throw UnimplementedError();
}

void main() {
  test('actualiza la party y refresca detalle y lista', () async {
    final repository = FakePartiesRepository();
    final container = ProviderContainer(
      overrides: [
        partiesRepositoryProvider.overrideWith((ref) async => repository),
      ],
    );
    addTearDown(container.dispose);
    final partiesSub = container.listen(partiesProvider, (_, _) {});
    final detailSub = container.listen(partyDetailProvider('p1'), (_, _) {});
    final updateSub = container.listen(updatePartyProvider, (_, _) {});
    addTearDown(partiesSub.close);
    addTearDown(detailSub.close);
    addTearDown(updateSub.close);

    await container.read(partiesProvider.future);
    await container.read(partyDetailProvider('p1').future);
    expect(repository.partiesFetches, 1);
    expect(repository.detailFetches, 1);

    await container
        .read(updatePartyProvider.notifier)
        .updateParty(
          partyId: 'p1',
          data: const UpdatePartyParams(
            displayName: 'Acme Corporation',
            partyType: PartyType.organization,
            legalName: 'Acme Corporation S.A.',
            taxId: 'B999',
          ),
        );

    expect(repository.updatedId, 'p1');
    expect(repository.updatedParams?.displayName, 'Acme Corporation');
    expect(repository.updatedParams?.taxId, 'B999');
    expect(repository.updatedParams?.partyType, PartyType.organization);

    // Detalle y lista se refrescaron (esperamos al rebuild lazy).
    await container.read(partiesProvider.future);
    final detailState = await container.read(partyDetailProvider('p1').future);
    expect(repository.partiesFetches, 2);
    expect(repository.detailFetches, 2);
    expect(detailState.displayName, 'Acme Corporation');
    expect(detailState.organization?.taxId, 'B999');
  });
}
