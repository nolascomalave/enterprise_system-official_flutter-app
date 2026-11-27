import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_localizations/flutter_localizations.dart'
    show GlobalWidgetsLocalizations;
import 'package:material_ui/material_ui.dart';

import 'generated/app_localizations.dart';

/// Delegates compatibles con `material_ui` / `cupertino_ui` (Flutter 3.50+).
///
/// El archivo generado por `gen-l10n` incluye los delegates de
/// `flutter_localizations`, que pertenecen a las librerías antiguas y no
/// satisfacen a los widgets de `material_ui`.
const List<Locale> appSupportedLocales = AppLocalizations.supportedLocales;

const List<LocalizationsDelegate<dynamic>> appLocalizationsDelegates =
    <LocalizationsDelegate<dynamic>>[
      AppLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ];
