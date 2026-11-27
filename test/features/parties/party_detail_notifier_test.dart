import 'dart:async';

import 'package:enterprise_app/features/parties/domain/entities/merge_parties_result.dart';
import 'package:enterprise_app/features/parties/domain/entities/party.dart';
import 'package:enterprise_app/features/parties/domain/entities/party_detail.dart';
import 'package:enterprise_app/features/parties/domain/repositories/parties_repository.dart';
import 'package:enterprise_app/features/parties/presentation/providers/parties_providers.dart';
import 'package:enterprise_app/features/parties/presentation/providers/party_detail_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

class FakePartiesRepository implements PartiesRepository {
  FakePartiesRepository({this.completer});

  final Completer<PartyDetail>? completer;
  String? requestedId;

  @override
  Future<PartyDetail> getPartyById(String partyId) {
    requestedId = partyId;
    return (completer ?? Completer<PartyDetail>()).future;
  }

  @override
  Future<void> updateParty(String partyId, UpdatePartyParams params) {
    throw UnimplementedError();
  }

  @override
  Future<MergePartiesResult> mergeParties({
    required String sourcePartyId,
    required String targetPartyId,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<List<Party>> getParties() async => const [];

  @override
  Future<Party> createParty(CreatePartyParams params) {
    throw UnimplementedError();
  }
}

const detail = PartyDetail(
  id: 'p1',
  displayName: 'Acme Corp',
  partyType: 'ORGANIZATION',
  recordStatus: 'ACTIVE',
  organization: OrganizationInfo(
    legalName: 'Acme Corporation S.A.',
    taxId: 'B12345678',
  ),
  contacts: [
    PartyContact(type: 'EMAIL', value: 'ana@acme.com', isPrimary: true),
  ],
  addresses: [PartyAddress(type: 'LEGAL', text: 'Av. Principal 123, Madrid')],
  names: [
    PartyNameEntry(name: 'Acme Corp', validFrom: '2026-01-01', validTo: null),
  ],
);

void main() {
  test('carga el detalle de una party por ID (loading → data)', () async {
    final repository = FakePartiesRepository(
      completer: Completer<PartyDetail>(),
    );
    final container = ProviderContainer(
      overrides: [
        partiesRepositoryProvider.overrideWith((ref) async => repository),
      ],
    );
    addTearDown(container.dispose);
    final sub = container.listen(partyDetailProvider('p1'), (_, _) {});
    addTearDown(sub.close);

    final future = container.read(partyDetailProvider('p1').future);
    expect(container.read(partyDetailProvider('p1')), isA<AsyncLoading>());

    repository.completer!.complete(detail);
    final loaded = await future;

    expect(repository.requestedId, 'p1');
    expect(loaded.displayName, 'Acme Corp');
    expect(loaded.isOrganization, isTrue);
    expect(loaded.organization?.taxId, 'B12345678');
    expect(loaded.contacts.single.value, 'ana@acme.com');
    expect(loaded.contacts.single.isPrimary, isTrue);
    expect(loaded.addresses.single.type, 'LEGAL');
    expect(loaded.names.single.name, 'Acme Corp');
    expect(
      container.read(partyDetailProvider('p1')),
      isA<AsyncData<PartyDetail>>(),
    );
  });
}
