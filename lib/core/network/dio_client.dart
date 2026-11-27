import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';

import 'interceptors.dart';
import 'secure_storage_service.dart';

/// URL base del backend. Sobrescribible en build/run:
/// `flutter run --dart-define=API_BASE_URL=http://192.168.1.10:8080/api/v1`
const String apiBaseUrl = String.fromEnvironment(
  'API_BASE_URL',
  defaultValue: 'http://localhost:8080/api/v1',
);

/// Cliente HTTP configurado (interceptores + cookies persistentes).
final secureStorageProvider = Provider<SecureStorageService>(
  (ref) => SecureStorageService(),
);

/// `FutureProvider` porque el cookie jar persistente necesita el directorio
/// de la app (operación asíncrona). En web se usa un jar en memoria.
final dioProvider = FutureProvider<Dio>((ref) async {
  final storage = ref.watch(secureStorageProvider);
  final cookieJar = await _createCookieJar();

  final options = BaseOptions(
    baseUrl: apiBaseUrl,
    connectTimeout: const Duration(seconds: 15),
    receiveTimeout: const Duration(seconds: 20),
    sendTimeout: const Duration(seconds: 20),
    headers: const {'Accept': 'application/json'},
  );

  final dio = Dio(options);
  if (cookieJar != null) {
    dio.interceptors.add(CookieManager(cookieJar));
  }
  dio.interceptors.add(AuthInterceptor(storage));

  // Cliente auxiliar para refresh/reintento (sin el interceptor de refresh).
  final refreshClient = Dio(options);
  if (cookieJar != null) {
    refreshClient.interceptors.add(CookieManager(cookieJar));
  }

  dio.interceptors.add(TokenRefreshInterceptor(refreshClient, storage));
  dio.interceptors.add(ApiErrorInterceptor());

  return dio;
});

Future<CookieJar?> _createCookieJar() async {
  if (kIsWeb) return null; // Sin disco en web: el navegador gestiona cookies.
  final directory = await getApplicationSupportDirectory();
  return PersistCookieJar(
    storage: FileStorage('${directory.path}/cookies'),
    ignoreExpires: false,
  );
}
