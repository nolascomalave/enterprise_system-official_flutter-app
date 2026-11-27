import '../repositories/auth_repository.dart';

/// Caso de uso: cerrar la sesión local y revocarla en el backend.
class LogoutUseCase {
  const LogoutUseCase(this._repository);

  final AuthRepository _repository;

  Future<void> call() => _repository.logout();
}
