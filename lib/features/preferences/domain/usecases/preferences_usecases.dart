import '../entities/user_preferences.dart';
import '../repositories/preferences_repository.dart';

/// Caso de uso: cargar preferencias del usuario.
class GetPreferencesUseCase {
  const GetPreferencesUseCase(this._repository);

  final PreferencesRepository _repository;

  Future<UserPreferences> call() => _repository.fetch();
}

/// Caso de uso: guardar preferencias (parcial o completa).
class UpdatePreferencesUseCase {
  const UpdatePreferencesUseCase(this._repository);

  final PreferencesRepository _repository;

  Future<UserPreferences> call(Map<String, dynamic> preferences) =>
      _repository.update(preferences);
}
