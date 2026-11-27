import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:enterprise_app/core/network/api_exception.dart';
import 'package:enterprise_app/core/network/secure_storage_service.dart';
import 'package:enterprise_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:enterprise_app/features/auth/domain/entities/auth_result.dart';
import 'package:flutter_test/flutter_test.dart';

/// Adapter falso para interceptar las peticiones de Dio sin red.
class MockAdapter implements HttpClientAdapter {
  MockAdapter(this.handler);

  final Future<ResponseBody> Function(RequestOptions options, String? body)
      handler;

  RequestOptions? lastOptions;
  String? lastBody;

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    lastOptions = options;
    if (requestStream != null) {
      final chunks = await requestStream.toList();
      final bytes = chunks.expand((chunk) => chunk).toList();
      lastBody = utf8.decode(bytes);
    }
    return handler(options, lastBody);
  }

  @override
  void close({bool force = false}) {}
}

ResponseBody jsonResponse(Map<String, dynamic> data, {int statusCode = 200}) {
  return ResponseBody.fromString(
    jsonEncode(data),
    statusCode,
    headers: {
      Headers.contentTypeHeader: [Headers.jsonContentType],
    },
  );
}

class FakeSecureStorage extends SecureStorageService {
  String? token;
  String? tenantId;

  @override
  Future<String?> readAccessToken() async => token;

  @override
  Future<void> saveAccessToken(String token) async => this.token = token;

  @override
  Future<String?> readTenantId() async => tenantId;

  @override
  Future<void> saveTenantId(String tenantId) async => this.tenantId = tenantId;

  @override
  Future<void> clear() async {
    token = null;
    tenantId = null;
  }
}

void main() {
  late MockAdapter adapter;
  late FakeSecureStorage storage;
  late AuthRepositoryImpl repository;

  Dio buildDio() => Dio(BaseOptions(baseUrl: 'http://test.local/api/v1'))
    ..httpClientAdapter = adapter;

  setUp(() {
    storage = FakeSecureStorage();
  });

  group('AuthRepositoryImpl.login', () {
    test('guarda el access_token y devuelve AuthSuccess', () async {
      adapter = MockAdapter((options, body) async {
        return jsonResponse({
          'data': {
            'access_token': 'token-123',
            'expires_in': 3600,
            'requires_2fa': false,
            'token_type': 'Bearer',
          },
        });
      });
      repository = AuthRepositoryImpl(buildDio(), storage);

      final result = await repository.login(
        email: 'ana@acme.com',
        password: 'secret',
        tenantId: 'tenant-uuid',
      );

      expect(result, isA<AuthSuccess>());
      expect((result as AuthSuccess).session.accessToken, 'token-123');
      expect(storage.token, 'token-123');
      expect(storage.tenantId, 'tenant-uuid');

      // Verifica el contrato HTTP.
      expect(adapter.lastOptions?.path, '/auth/login');
      final sent = jsonDecode(adapter.lastBody!) as Map<String, dynamic>;
      expect(sent['email'], 'ana@acme.com');
      expect(sent['tenant_id'], 'tenant-uuid');
    });

    test('devuelve AuthRequiresTwoFactor y NO guarda token', () async {
      adapter = MockAdapter((options, body) async {
        return jsonResponse({
          'data': {
            'requires_2fa': true,
            'temp_token': 'temp-abc',
          },
        });
      });
      repository = AuthRepositoryImpl(buildDio(), storage);

      final result = await repository.login(
        email: 'ana@acme.com',
        password: 'secret',
        tenantId: 'tenant-uuid',
      );

      expect(result, isA<AuthRequiresTwoFactor>());
      expect((result as AuthRequiresTwoFactor).tempToken, 'temp-abc');
      expect(storage.token, isNull);
    });

    test('lanza ApiException con el mensaje del backend ante un 401', () async {
      adapter = MockAdapter((options, body) async {
        return jsonResponse(
          {'error': 'Credenciales inválidas'},
          statusCode: 401,
        );
      });
      repository = AuthRepositoryImpl(buildDio(), storage);

      expect(
        () => repository.login(
          email: 'ana@acme.com',
          password: 'bad',
          tenantId: 'tenant-uuid',
        ),
        throwsA(
          isA<ApiException>()
              .having((e) => e.message, 'message', 'Credenciales inválidas')
              .having((e) => e.statusCode, 'statusCode', 401),
        ),
      );
    });
  });

  group('AuthRepositoryImpl.verifyTwoFactor', () {
    test('envía temp_token + code y persiste la sesión', () async {
      adapter = MockAdapter((options, body) async {
        return jsonResponse({
          'data': {
            'access_token': 'token-2fa',
            'expires_in': 3600,
            'requires_2fa': false,
            'token_type': 'Bearer',
          },
        });
      });
      repository = AuthRepositoryImpl(buildDio(), storage);

      final session = await repository.verifyTwoFactor(
        tempToken: 'temp-abc',
        code: '123456',
      );

      expect(session.accessToken, 'token-2fa');
      expect(storage.token, 'token-2fa');
      expect(adapter.lastOptions?.path, '/auth/2fa/verify');
      final sent = jsonDecode(adapter.lastBody!) as Map<String, dynamic>;
      expect(sent['temp_token'], 'temp-abc');
      expect(sent['code'], '123456');
    });
  });

  group('AuthRepositoryImpl.logout', () {
    test('llama POST /auth/logout y limpia token y tenant', () async {
      storage.token = 'token-123';
      storage.tenantId = 'tenant-1';
      adapter = MockAdapter((options, body) async {
        expect(options.method, 'POST');
        expect(options.path, '/auth/logout');
        return ResponseBody.fromString('', 204);
      });
      repository = AuthRepositoryImpl(buildDio(), storage);

      await repository.logout();

      expect(storage.token, isNull);
      expect(storage.tenantId, isNull);
    });

    test('limpia el storage aunque el backend falle', () async {
      storage.token = 'token-123';
      storage.tenantId = 'tenant-1';
      adapter = MockAdapter((options, body) async {
        return jsonResponse({'error': 'boom'}, statusCode: 500);
      });
      repository = AuthRepositoryImpl(buildDio(), storage);

      await repository.logout();

      expect(storage.token, isNull);
      expect(storage.tenantId, isNull);
    });
  });
}
