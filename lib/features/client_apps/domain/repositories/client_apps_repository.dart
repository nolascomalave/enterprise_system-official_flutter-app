import '../entities/client_application.dart';

/// Puerto de aplicaciones cliente.
abstract interface class ClientAppsRepository {
  Future<List<ClientApplication>> getClientApplications();

  Future<ClientApplication> createClientApplication({
    required String name,
    required List<String> scopes,
  });
}
