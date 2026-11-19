import 'dart:async';

import 'package:enterprise_app/features/parties/domain/entities/party.dart';
import 'package:enterprise_app/features/parties/domain/repositories/parties_repository.dart';
import 'package:enterprise_app/features/parties/presentation/providers/parties_notifier.dart';
import 'package:enterprise_app/features/parties/presentation/providers/parties_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

class FakePartiesRepository implements PartiesRepository {
  FakePartiesRepository({List<Party>? initial})
      : parties = [...?initial];

  final List<Party> parties;
  Completer<List<Party>>? fetchCompleter;
  int fetchCalls = 0;
  int createCalls = 0;

  @override
  Future<List<Party>> getParties() {
    fetchCalls++;
    if (fetchCompleter != null) return fetchCompleter!.future;
    return Future.value(List.of(parties));
  }

  @override
  Future<Party> createParty(CreatePartyParams params) async {
    createCalls++;
    final party = Party(
      id: 'created-${parties.length + 1}',
      displayName: params.displayName,
      partyType: params.partyType,
      taxId: params.taxId,
      firstName: params.firstName,
      lastName: params.lastName,
    );
    parties.add(party);
    return party;
  }
}

void main() {
  const juan = Party(
    id: 'p1',
    displayName: 'Juan Pérez',
    partyType: PartyType.individual,
    firstName: 'Juan',
    lastName: 'Pérez',
  );

  late FakePartiesRepository repository;
  late ProviderContainer container;

  setUp(() {
    repository = FakePartiesRepository(initial: [juan]);
    container = ProviderContainer(
      overrides: [
        partiesRepositoryProvider.overrideWith((ref) async => repository),
      ],
    );
    addTearDown(container.dispose);
  });

  ProviderSubscription<AsyncValue<List<Party>>> listen() =>
      container.listen(partiesProvider, (previous, next) {});

  test('carga la lista (loading → data)', () async {
    final sub = listen();
    addTearDown(sub.close);

    // Primer fetch controlado con completer para observar el loading.
    repository.fetchCompleter = Completer<List<Party>>();

    final future = container.read(partiesProvider.future);
    expect(container.read(partiesProvider), isA<AsyncLoading>());

    repository.fetchCompleter!.complete([juan]);
    final parties = await future;

    expect(parties, hasLength(1));
    expect(container.read(partiesProvider), isA<AsyncData<List<Party>>>());
    expect(repository.fetchCalls, 1);
  });

  test('crea una party y refresca la lista', () async {
    final sub = listen();
    addTearDown(sub.close);

    await container.read(partiesProvider.future);
    expect(container.read(partiesProvider).value, hasLength(1));

    final notifier = container.read(partiesProvider.notifier);
    final created = await notifier.createParty(
      const CreatePartyParams(
        displayName: 'Acme Corp',
        partyType: PartyType.organization,
        legalName: 'Acme Corporation S.A.',
        taxId: 'B12345678',
      ),
    );

    expect(created.displayName, 'Acme Corp');
    expect(repository.createCalls, 1);

    // La lista se refrescó con el nuevo registro.
    final state = await container.read(partiesProvider.future);
    expect(state, hasLength(2));
    expect(state.last.displayName, 'Acme Corp');
    expect(repository.fetchCalls, 2);
  });
}
