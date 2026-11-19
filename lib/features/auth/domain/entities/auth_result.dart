import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_result.freezed.dart';

/// Resultado del intento de login.
///
/// El backend puede devolver una sesión completa o exigir un segundo factor
/// (en cuyo caso entrega un `temp_token` para `/auth/2fa/verify`).
@freezed
sealed class AuthResult with _$AuthResult {
  const factory AuthResult.success(AuthSession session) = AuthSuccess;

  const factory AuthResult.requiresTwoFactor(String tempToken) =
      AuthRequiresTwoFactor;
}

/// Sesión autenticada.
class AuthSession {
  const AuthSession({
    required this.accessToken,
    this.tokenType = 'Bearer',
    this.expiresIn,
    this.tenantId,
  });

  final String accessToken;
  final String tokenType;
  final int? expiresIn;
  final String? tenantId;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthSession &&
          other.accessToken == accessToken &&
          other.tokenType == tokenType &&
          other.expiresIn == expiresIn &&
          other.tenantId == tenantId;

  @override
  int get hashCode => Object.hash(accessToken, tokenType, expiresIn, tenantId);
}
