import 'package:material_ui/material_ui.dart';

import '../../../../core/i18n/l10n_ext.dart';
import 'login_state.dart';

/// Traduce los errores genéricos del login; los mensajes del backend se
/// muestran tal cual.
extension LoginErrorL10n on LoginError {
  String localizedMessage(BuildContext context) => switch (kind) {
    LoginErrorKind.loginFailed => context.l10n.loginFailed,
    LoginErrorKind.sessionExpired => context.l10n.sessionExpired,
    LoginErrorKind.verifyFailed => context.l10n.verifyFailed,
    null => message,
  };
}
