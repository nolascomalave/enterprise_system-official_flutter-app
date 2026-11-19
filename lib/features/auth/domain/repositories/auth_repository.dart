import '../entities/auth_result.dart';

/// Puerto de autenticación (implementado en la capa de datos).
abstract interface class AuthRepository {
  /// Autentica con email/password/tenant.
  ///
  /// Devuelve [AuthSuccess] con la sesión o [AuthRequiresTwoFactor] si el
  /// backend exige un segundo factor.
  Future<AuthResult> login({
    required String email,
    required String password,
    required String tenantId,
  });

  /// Completa el segundo factor con el `temp_token` y el código TOTP.
  Future<AuthSession> verifyTwoFactor({
    required String tempToken,
    required String code,
  });
}
