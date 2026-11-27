import '../entities/auth_result.dart';
import '../repositories/auth_repository.dart';

/// Caso de uso: verificar el segundo factor (TOTP / backup code).
class VerifyTwoFactorUseCase {
  const VerifyTwoFactorUseCase(this._repository);

  final AuthRepository _repository;

  Future<AuthSession> call({required String tempToken, required String code}) {
    return _repository.verifyTwoFactor(tempToken: tempToken, code: code);
  }
}
