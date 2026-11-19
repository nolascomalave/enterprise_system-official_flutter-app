import 'package:material_ui/material_ui.dart';

/// Preferencia de tema guardada en el backend (`light` | `dark` | `system`).
enum ThemePreference {
  light,
  dark,
  system;

  static ThemePreference fromApi(String? value) {
    return switch (value?.toLowerCase()) {
      'light' => light,
      'dark' => dark,
      _ => system,
    };
  }

  String get apiValue => name;

  String get label => switch (this) {
        ThemePreference.light => 'Claro',
        ThemePreference.dark => 'Oscuro',
        ThemePreference.system => 'Sistema',
      };

  ThemeMode get themeMode => switch (this) {
        ThemePreference.light => ThemeMode.light,
        ThemePreference.dark => ThemeMode.dark,
        ThemePreference.system => ThemeMode.system,
      };
}

/// Preferencias de UI del usuario (`GET/PUT /users/me/preferences`).
class UserPreferences {
  const UserPreferences({
    this.theme = ThemePreference.system,
    this.localeCode = 'es',
    this.raw = const {},
  });

  final ThemePreference theme;
  final String localeCode;

  /// Mapa completo recibido del backend (preserva claves desconocidas).
  final Map<String, dynamic> raw;

  static const UserPreferences defaults = UserPreferences();

  ThemeMode get themeMode => theme.themeMode;

  Locale get locale => Locale(localeCode);

  UserPreferences copyWith({
    ThemePreference? theme,
    String? localeCode,
    Map<String, dynamic>? raw,
  }) {
    return UserPreferences(
      theme: theme ?? this.theme,
      localeCode: localeCode ?? this.localeCode,
      raw: raw ?? this.raw,
    );
  }

  factory UserPreferences.fromMap(Map<String, dynamic> map) {
    final theme = map['theme'] ?? map['theme_mode'];
    final locale = map['locale'] ?? map['language'];
    return UserPreferences(
      theme: ThemePreference.fromApi(theme is String ? theme : null),
      localeCode: locale is String && locale.isNotEmpty ? locale : 'es',
      raw: Map<String, dynamic>.from(map),
    );
  }

  Map<String, dynamic> toMap() => {
        ...raw,
        'theme': theme.apiValue,
        'locale': localeCode,
      };
}
