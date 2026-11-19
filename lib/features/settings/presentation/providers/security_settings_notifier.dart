import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/entities/security_settings.dart';
import 'settings_providers.dart';

part 'security_settings_notifier.g.dart';

/// Estado y acciones de configuración de seguridad (MFA).
@riverpod
class SecuritySettingsNotifier extends _$SecuritySettingsNotifier {
  @override
  SecuritySettings build() => const SecuritySettings();

  void selectMethod(MfaMethod method) {
    if (state.enabled) return;
    state = state.copyWith(method: method);
  }

  /// `POST /auth/totp/setup` → datos para el QR.
  Future<TotpSetup> startTotpSetup() async {
    final useCase = await ref.read(setupTotpUseCaseProvider.future);
    return useCase();
  }

  /// `POST /auth/totp/verify` → códigos de respaldo y 2FA activo.
  Future<List<String>> verifyTotp({required String code}) async {
    final useCase = await ref.read(verifyTotpUseCaseProvider.future);
    final backupCodes = await useCase(code: code);
    state = state.copyWith(enabled: true, method: MfaMethod.totp);
    return backupCodes;
  }

  /// Step-up previo a cambios sensibles.
  Future<void> requestOtp(MfaAction action) async {
    final useCase = await ref.read(requestOtpUseCaseProvider.future);
    await useCase(action: action);
  }

  /// `PUT /auth/mfa-preferences {enabled: false, otp_code}`
  Future<void> disableMfa({required String otpCode}) async {
    final useCase = await ref.read(updateMfaPreferencesUseCaseProvider.future);
    await useCase(enabled: false, otpCode: otpCode);
    state = state.copyWith(enabled: false);
  }

  /// `PUT /auth/mfa-preferences {enabled: true, method: EMAIL_OTP, otp_code}`
  Future<void> enableEmailOtp({required String otpCode}) async {
    final useCase = await ref.read(updateMfaPreferencesUseCaseProvider.future);
    await useCase(
      enabled: true,
      method: MfaMethod.emailOtp,
      otpCode: otpCode,
    );
    state = state.copyWith(enabled: true, method: MfaMethod.emailOtp);
  }
}
