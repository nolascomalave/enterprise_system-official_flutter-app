import 'package:dio/dio.dart';
import 'package:enterprise_app/features/preferences/data/repositories/preferences_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/mock_dio.dart';

void main() {
  late MockAdapter adapter;

  Dio buildDio() => Dio(BaseOptions(baseUrl: 'http://test.local/api/v1'))
    ..httpClientAdapter = adapter;

  test('GET envía X-App-Client-ID y parsea el envelope de preferencias',
      () async {
    adapter = MockAdapter((options, body) async {
      expect(options.path, '/users/me/preferences');
      expect(options.method, 'GET');
      expect(options.headers['X-App-Client-ID'], 'client-123');
      return jsonResponse({
        'data': {
          'preferences': {'theme': 'dark', 'locale': 'en'},
        },
      });
    });

    final repository = PreferencesRepositoryImpl(buildDio(), 'client-123');
    final prefs = await repository.fetch();

    expect(prefs.theme.apiValue, 'dark');
    expect(prefs.localeCode, 'en');
  });

  test('PUT envía {preferences: {...}} con el header y conserva el mapa',
      () async {
    adapter = MockAdapter((options, body) async {
      expect(options.path, '/users/me/preferences');
      expect(options.method, 'PUT');
      expect(options.headers['X-App-Client-ID'], 'client-123');
      return ResponseBody.fromString('', 204);
    });

    final repository = PreferencesRepositoryImpl(buildDio(), 'client-123');
    final prefs = await repository.update({'theme': 'light', 'locale': 'es'});

    expect(adapter.lastBody, contains('"preferences"'));
    expect(adapter.lastBody, contains('"theme":"light"'));
    expect(adapter.lastBody, contains('"locale":"es"'));
    // 204 → se aplica lo enviado.
    expect(prefs.theme.apiValue, 'light');
    expect(prefs.localeCode, 'es');
  });
}
