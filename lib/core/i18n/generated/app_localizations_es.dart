// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'Enterprise App';

  @override
  String get loginTitle => 'Bienvenido de nuevo';

  @override
  String get loginSubtitle =>
      'Inicia sesión para acceder a tu espacio de trabajo';

  @override
  String get emailLabel => 'Correo electrónico';

  @override
  String get passwordLabel => 'Contraseña';

  @override
  String get organizationLabel => 'Organización';

  @override
  String get signIn => 'Iniciar sesión';

  @override
  String get forgotPassword => '¿Olvidaste tu contraseña?';

  @override
  String get registerCompany => 'Registrar nueva empresa';

  @override
  String get dashboardTitle => 'Dashboard';

  @override
  String get dashboardSubtitle => 'Resumen general de Acme Corporation';

  @override
  String get comingSoon => 'Próximamente';

  @override
  String get tenantLabel => 'Organización';

  @override
  String get tenantHint => 'UUID de la organización';

  @override
  String get brandHeadline => 'Diseñado para operar al nivel de tu ambición.';

  @override
  String get brandSubtitle =>
      'Profundidad de datos empresarial con una experiencia que se siente inevitable.';

  @override
  String get statParties => 'Parties';

  @override
  String get statUptime => 'Uptime';

  @override
  String get twoFactorTitle => 'Verificación en dos pasos';

  @override
  String get twoFactorSubtitle =>
      'Introduce el código de 6 dígitos de tu app autenticadora';

  @override
  String get codeLabel => 'Código de verificación';

  @override
  String get verify => 'Verificar';

  @override
  String get backToLogin => 'Volver al inicio de sesión';

  @override
  String get errorGeneric => 'Algo ha salido mal. Inténtalo de nuevo.';
}
