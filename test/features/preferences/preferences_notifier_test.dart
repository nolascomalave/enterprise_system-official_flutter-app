import 'package:enterprise_app/core/network/dio_client.dart';
import 'package:enterprise_app/core/network/secure_storage_service.dart';
import 'package:enterprise_app/features/preferences/domain/entities/user_preferences.dart';
import 'package:enterprise_app/features/preferences/domain/repositories/preferences_repository.dart';
import 'package:enterprise_app/features/preferences/presentation/providers/preferences_notifier.dart';
import 'package:enterprise_app/features/preferences/presentation/providers/preferences_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

class FakeSecureStorage extends SecureStorageService {
  @override
  Future<bool> hasSession() async => true;
}

class FakePreferencesRepository implements PreferencesRepository {
  FakePreferencesRepository({required this.current});

  UserPreferences current;
  int fetchCalls = 0;
  Map<String, dynamic>? lastUpdate;
  bool failNextUpdate = false;

  @override
  Future<UserPreferences> fetch() async {
    fetchCalls++;
    return current;
  }

  @override
  Future<UserPreferences> update(Map<String, dynamic> preferences) async {
    lastUpdate = preferences;
    if (failNextUpdate) {
      failNextUpdate = false;
      throw StateError('update failed');
    }
    current = UserPreferences.fromMap(preferences);
    return current;
  }
}

void main() {
  late FakePreferencesRepository repository;
  late ProviderContainer container;

  ProviderContainer buildContainer(FakePreferencesRepository repo) {
    final c = ProviderContainer(
      overrides: [
        secureStorageProvider.overrideWithValue(FakeSecureStorage()),
        preferencesRepositoryProvider.overrideWith((ref) async => repo),
      ],
    );
    addTearDown(c.dispose);
    return c;
  }

  test('carga inicial desde el backend', () async {
    repository = FakePreferencesRepository(
      current: const UserPreferences(
        theme: ThemePreference.dark,
        localeCode: 'en',
      ),
    );
    container = buildContainer(repository);
    final sub = container.listen(preferencesProvider, (_, _) {});
    addTearDown(sub.close);

    final prefs = await container.read(preferencesProvider.future);

    expect(prefs.theme, ThemePreference.dark);
    expect(prefs.localeCode, 'en');
    expect(prefs.themeMode.name, 'dark');
    expect(prefs.locale.languageCode, 'en');
    expect(repository.fetchCalls, 1);
  });

  test('setTheme guarda en backend y actualiza el estado', () async {
    repository = FakePreferencesRepository(
      current: const UserPreferences(theme: ThemePreference.system, localeCode: 'es'),
    );
    container = buildContainer(repository);
    final sub = container.listen(preferencesProvider, (_, _) {});
    addTearDown(sub.close);

    await container.read(preferencesProvider.future);

    final notifier = container.read(preferencesProvider.notifier);
    await notifier.setTheme(ThemePreference.dark);

    expect(repository.lastUpdate?['theme'], 'dark');
    expect(repository.lastUpdate?['locale'], 'es');
    expect(container.read(preferencesProvider).value?.theme, ThemePreference.dark);
  });

  test('setLocale guarda el idioma y conserva el tema', () async {
    repository = FakePreferencesRepository(
      current: const UserPreferences(theme: ThemePreference.light, localeCode: 'es'),
    );
    container = buildContainer(repository);
    final sub = container.listen(preferencesProvider, (_, _) {});
    addTearDown(sub.close);

    await container.read(preferencesProvider.future);
    final notifier = container.read(preferencesProvider.notifier);
    await notifier.setLocale('en');

    expect(repository.lastUpdate?['locale'], 'en');
    expect(repository.lastUpdate?['theme'], 'light');
    expect(container.read(preferencesProvider).value?.localeCode, 'en');
  });

  test('si el PUT falla, revierte el estado', () async {
    repository = FakePreferencesRepository(
      current: const UserPreferences(theme: ThemePreference.system, localeCode: 'es'),
    );
    container = buildContainer(repository);
    final sub = container.listen(preferencesProvider, (_, _) {});
    addTearDown(sub.close);

    await container.read(preferencesProvider.future);
    repository.failNextUpdate = true;

    final notifier = container.read(preferencesProvider.notifier);
    await expectLater(
      notifier.setTheme(ThemePreference.dark),
      throwsA(isA<StateError>()),
    );

    expect(container.read(preferencesProvider).value?.theme, ThemePreference.system);
  });
}
