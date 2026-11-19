import '../entities/security_settings.dart';

/// Puerto de configuración de seguridad.
abstract interface class SettingsRepository {
  /// `PUT /auth/mfa-preferences`
  Future<void> updateMfaPreferences({
    required bool enabled,
    MfaMethod? method,
    String? otpCode,
  });

  /// `POST /auth/totp/setup`
  Future<TotpSetup> setupTotp();

  /// `POST /auth/totp/verify` → 8 códigos de respaldo.
  Future<List<String>> verifyTotp({required String code});

  /// `POST /auth/request-otp`
  Future<void> requestOtp({required MfaAction action});
}
