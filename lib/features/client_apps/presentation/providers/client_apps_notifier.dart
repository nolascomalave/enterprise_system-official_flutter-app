import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/entities/client_application.dart';
import 'client_apps_providers.dart';

part 'client_apps_notifier.g.dart';

/// Lista de aplicaciones cliente + creación con refresco.
@riverpod
class ClientAppsNotifier extends _$ClientAppsNotifier {
  @override
  Future<List<ClientApplication>> build() async {
    final useCase = await ref.watch(getClientAppsUseCaseProvider.future);
    return useCase();
  }

  Future<ClientApplication> createApplication({
    required String name,
    required List<String> scopes,
  }) async {
    final useCase = await ref.read(createClientAppUseCaseProvider.future);
    final created = await useCase(name: name, scopes: scopes);
    ref.invalidateSelf();
    await future;
    return created;
  }

  Future<void> refresh() async {
    ref.invalidateSelf();
    await future;
  }
}
