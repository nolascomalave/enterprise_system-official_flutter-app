import '../entities/client_application.dart';
import '../repositories/client_apps_repository.dart';

/// Caso de uso: listar aplicaciones cliente.
class GetClientAppsUseCase {
  const GetClientAppsUseCase(this._repository);

  final ClientAppsRepository _repository;

  Future<List<ClientApplication>> call() =>
      _repository.getClientApplications();
}

/// Caso de uso: crear una aplicación cliente (devuelve el client_secret).
class CreateClientAppUseCase {
  const CreateClientAppUseCase(this._repository);

  final ClientAppsRepository _repository;

  Future<ClientApplication> call({
    required String name,
    required List<String> scopes,
  }) =>
      _repository.createClientApplication(name: name, scopes: scopes);
}
