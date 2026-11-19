import '../entities/security_settings.dart';
import '../repositories/settings_repository.dart';

class UpdateMfaPreferencesUseCase {
  const UpdateMfaPreferencesUseCase(this._repository);

  final SettingsRepository _repository;

  Future<void> call({
    required bool enabled,
    MfaMethod? method,
    String? otpCode,
  }) =>
      _repository.updateMfaPreferences(
        enabled: enabled,
        method: method,
        otpCode: otpCode,
      );
}

class SetupTotpUseCase {
  const SetupTotpUseCase(this._repository);

  final SettingsRepository _repository;

  Future<TotpSetup> call() => _repository.setupTotp();
}

class VerifyTotpUseCase {
  const VerifyTotpUseCase(this._repository);

  final SettingsRepository _repository;

  Future<List<String>> call({required String code}) =>
      _repository.verifyTotp(code: code);
}

class RequestOtpUseCase {
  const RequestOtpUseCase(this._repository);

  final SettingsRepository _repository;

  Future<void> call({required MfaAction action}) =>
      _repository.requestOtp(action: action);
}
