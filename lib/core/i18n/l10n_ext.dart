import 'package:material_ui/material_ui.dart';

import 'generated/app_localizations.dart';

/// Acceso corto a las traducciones: `context.l10n.partiesTitle`.
extension L10nContext on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}
