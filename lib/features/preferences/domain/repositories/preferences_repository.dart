import '../entities/user_preferences.dart';

/// Puerto de preferencias de usuario.
abstract interface class PreferencesRepository {
  Future<UserPreferences> fetch();

  /// Actualiza (merge) las preferencias y devuelve el estado guardado.
  Future<UserPreferences> update(Map<String, dynamic> preferences);
}
