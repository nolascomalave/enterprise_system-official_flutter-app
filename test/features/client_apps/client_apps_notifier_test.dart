import 'package:enterprise_app/features/client_apps/domain/entities/client_application.dart';
import 'package:enterprise_app/features/client_apps/domain/repositories/client_apps_repository.dart';
import 'package:enterprise_app/features/client_apps/presentation/providers/client_apps_notifier.dart';
import 'package:enterprise_app/features/client_apps/presentation/providers/client_apps_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

class FakeClientAppsRepository implements ClientAppsRepository {
  FakeClientAppsRepository({List<ClientApplication>? initial})
      : apps = [...?initial];

  final List<ClientApplication> apps;
  int fetchCalls = 0;
  int createCalls = 0;
  String? lastSecret;

  @override
  Future<List<ClientApplication>> getClientApplications() async {
    fetchCalls++;
    return List.of(apps);
  }

  @override
  Future<ClientApplication> createClientApplication({
    required String name,
    required List<String> scopes,
  }) async {
    createCalls++;
    lastSecret = 'secret-$createCalls';
    final created = ClientApplication(
      id: 'app-$createCalls',
      name: name,
      clientId: 'client-$createCalls',
      scopes: scopes,
      isActive: true,
      clientSecret: lastSecret,
    );
    apps.add(created);
    return created;
  }
}

void main() {
  late FakeClientAppsRepository repository;
  late ProviderContainer container;

  setUp(() {
    repository = FakeClientAppsRepository(
      initial: const [
        ClientApplication(
          id: 'a1',
          name: 'Portal legacy',
          clientId: 'cid-1',
          scopes: ['parties:read'],
          isActive: true,
        ),
        ClientApplication(
          id: 'a2',
          name: 'Integración ERP',
          clientId: 'cid-2',
          scopes: ['employees:read'],
          isActive: false,
        ),
      ],
    );
    container = ProviderContainer(
      overrides: [
        clientAppsRepositoryProvider.overrideWith((ref) async => repository),
      ],
    );
    addTearDown(container.dispose);
    final sub = container.listen(clientAppsProvider, (_, _) {});
    addTearDown(sub.close);
  });

  test('carga la lista de aplicaciones', () async {
    final apps = await container.read(clientAppsProvider.future);

    expect(apps, hasLength(2));
    expect(apps.first.name, 'Portal legacy');
    expect(apps.first.clientId, 'cid-1');
    expect(apps.last.isActive, isFalse);
    expect(apps.last.statusLabel, 'Inactiva');
    expect(repository.fetchCalls, 1);
  });

  test('crea una aplicación, devuelve el secret y refresca la lista',
      () async {
    await container.read(clientAppsProvider.future);

    final notifier = container.read(clientAppsProvider.notifier);
    final created = await notifier.createApplication(
      name: 'Nueva integración',
      scopes: ['parties:read', 'parties:write'],
    );

    expect(created.clientSecret, 'secret-1');
    expect(created.name, 'Nueva integración');
    expect(repository.createCalls, 1);
    expect(repository.fetchCalls, 2);

    final state = await container.read(clientAppsProvider.future);
    expect(state, hasLength(3));
    expect(state.last.name, 'Nueva integración');
  });
}
