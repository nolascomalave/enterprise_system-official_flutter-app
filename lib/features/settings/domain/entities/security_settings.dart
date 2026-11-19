/// Método de segundo factor.
enum MfaMethod {
  totp,
  emailOtp;

  static MfaMethod fromApi(String? value) =>
      value?.toUpperCase() == 'EMAIL_OTP' ? emailOtp : totp;

  String get apiValue => switch (this) {
        MfaMethod.totp => 'TOTP',
        MfaMethod.emailOtp => 'EMAIL_OTP',
      };

  String get label => switch (this) {
        MfaMethod.totp => 'App autenticadora',
        MfaMethod.emailOtp => 'Código al correo',
      };
}

/// Acción de step-up (código OTP previo a un cambio sensible).
enum MfaAction {
  disableMfa,
  enableMfa;

  String get apiValue => switch (this) {
        MfaAction.disableMfa => 'DISABLE_MFA',
        MfaAction.enableMfa => 'ENABLE_MFA',
      };
}

/// Configuración de seguridad en memoria (no hay GET de preferencias).
class SecuritySettings {
  const SecuritySettings({
    this.enabled = false,
    this.method = MfaMethod.totp,
  });

  final bool enabled;
  final MfaMethod method;

  SecuritySettings copyWith({bool? enabled, MfaMethod? method}) =>
      SecuritySettings(
        enabled: enabled ?? this.enabled,
        method: method ?? this.method,
      );
}

/// Datos del enrolment TOTP.
class TotpSetup {
  const TotpSetup({required this.otpauthUrl, required this.secret});

  final String otpauthUrl;
  final String secret;
}
