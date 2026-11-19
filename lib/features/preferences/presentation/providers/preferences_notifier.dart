import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/network/dio_client.dart';
import '../../domain/entities/user_preferences.dart';
import 'preferences_providers.dart';

part 'preferences_notifier.g.dart';

/// Carga las preferencias al iniciar sesión y las persiste en el backend.
@riverpod
class PreferencesNotifier extends _$PreferencesNotifier {
  @override
  Future<UserPreferences> build() async {
    final storage = ref.watch(secureStorageProvider);
    if (!await storage.hasSession()) {
      return UserPreferences.defaults;
    }
    final useCase = await ref.watch(getPreferencesUseCaseProvider.future);
    try {
      return await useCase();
    } catch (_) {
      // No bloqueamos la app si el endpoint falla: usamos defaults.
      return UserPreferences.defaults;
    }
  }

  Future<void> setTheme(ThemePreference theme) =>
      _update({'theme': theme.apiValue});

  Future<void> setLocale(String localeCode) =>
      _update({'locale': localeCode});

  Future<void> _update(Map<String, dynamic> partial) async {
    final current = state.value ?? UserPreferences.defaults;
    final merged = {...current.toMap(), ...partial};

    // Aplicación instantánea (optimista).
    state = AsyncData(UserPreferences.fromMap(merged));

    try {
      final useCase = await ref.read(updatePreferencesUseCaseProvider.future);
      final saved = await useCase(merged);
      state = AsyncData(saved);
    } catch (_) {
      state = AsyncData(current); // rollback
      rethrow;
    }
  }

  Future<void> reload() async {
    ref.invalidateSelf();
    await future;
  }
}
