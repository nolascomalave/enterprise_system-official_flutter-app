import 'dart:ui';

import 'package:dio/dio.dart';

import 'api_exception.dart';
import 'secure_storage_service.dart';

/// Inyecta el `Authorization: Bearer <token>` y el `Accept-Language`
/// en cada petición saliente.
class AuthInterceptor extends QueuedInterceptor {
  AuthInterceptor(this._storage);

  final SecureStorageService _storage;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await _storage.readAccessToken();
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    options.headers.putIfAbsent(
      'Accept-Language',
      () => PlatformDispatcher.instance.locale.toLanguageTag(),
    );
    handler.next(options);
  }
}

/// Intenta un refresh silencioso ante un 401 y reintenta la petición original.
///
/// El refresh token viaja como cookie HttpOnly, gestionada por `cookie_jar`.
class TokenRefreshInterceptor extends QueuedInterceptor {
  TokenRefreshInterceptor(this._refreshClient, this._storage);

  /// Cliente "limpio" (sin este interceptor) usado para /auth/refresh y reintentos.
  final Dio _refreshClient;
  final SecureStorageService _storage;

  static const String _retriedFlag = 'auth_retried';

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final statusCode = err.response?.statusCode;
    final path = err.requestOptions.path;
    final alreadyRetried = err.requestOptions.extra[_retriedFlag] == true;

    final isRefreshOrLogin = path.contains('/auth/refresh') || path.contains('/auth/login');
    if (statusCode != 401 || alreadyRetried || isRefreshOrLogin) {
      handler.next(err);
      return;
    }

    try {
      final refreshResponse =
          await _refreshClient.post<Map<String, dynamic>>('/auth/refresh');
      final data = refreshResponse.data?['data'];
      final newToken = data is Map ? data['access_token'] as String? : null;

      if (newToken == null || newToken.isEmpty) {
        await _storage.clear();
        handler.next(err);
        return;
      }

      await _storage.saveAccessToken(newToken);

      final retryOptions = err.requestOptions
        ..headers['Authorization'] = 'Bearer $newToken'
        ..extra[_retriedFlag] = true;

      final retryResponse = await _refreshClient.fetch<dynamic>(retryOptions);
      handler.resolve(retryResponse);
    } on DioException {
      await _storage.clear();
      handler.next(err); // Se propaga el 401 original.
    }
  }
}

/// Convierte los errores de Dio en [ApiException].
class ApiErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    handler.reject(
      err.copyWith(error: ApiException.fromDio(err)),
    );
  }
}
