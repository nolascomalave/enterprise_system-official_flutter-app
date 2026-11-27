import 'package:dio/dio.dart';

import '../../../../core/network/api_exception.dart';
import '../../../../core/network/secure_storage_service.dart';
import '../../domain/entities/auth_result.dart';
import '../../domain/repositories/auth_repository.dart';
import '../dto/auth_dto.dart';
import '../dto/login_request_dto.dart';
import '../dto/verify_two_factor_request_dto.dart';

/// Implementación del puerto de autenticación contra la API Go.
///
/// - `POST /auth/login` — credenciales (email, password, tenant_id)
/// - `POST /auth/2fa/verify` — temp_token + código
///
/// Persiste el `access_token` en secure storage cuando la sesión queda completa.
class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this._dio, this._storage);

  final Dio _dio;
  final SecureStorageService _storage;

  @override
  Future<AuthResult> login({
    required String email,
    required String password,
    required String tenantId,
  }) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        '/auth/login',
        data: LoginRequestDto(
          email: email,
          password: password,
          tenantId: tenantId,
        ).toJson(),
      );

      final dto = _parsePayload(response.data);
      return await _resolveAuthResult(dto, tenantId: tenantId);
    } on DioException catch (error) {
      throw _toApiException(error);
    }
  }

  @override
  Future<AuthSession> verifyTwoFactor({
    required String tempToken,
    required String code,
  }) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        '/auth/2fa/verify',
        data: VerifyTwoFactorRequestDto(
          tempToken: tempToken,
          code: code,
        ).toJson(),
      );

      final dto = _parsePayload(response.data);
      final session = await _persistSession(dto, tenantId: null);
      return session;
    } on DioException catch (error) {
      throw _toApiException(error);
    }
  }

  @override
  Future<void> logout() async {
    try {
      await _dio.post<void>('/auth/logout');
    } on DioException {
      // La sesión local se invalida aunque el backend no esté disponible.
    } finally {
      await _storage.clear();
    }
  }

  AuthDto _parsePayload(Map<String, dynamic>? body) {
    final data = body?['data'];
    if (data is! Map) {
      throw const ApiException('Respuesta inválida del servidor.');
    }
    return AuthDto.fromJson(Map<String, dynamic>.from(data));
  }

  Future<AuthResult> _resolveAuthResult(AuthDto dto, {String? tenantId}) async {
    if (dto.requires2Fa) {
      final tempToken = dto.tempToken;
      if (tempToken == null || tempToken.isEmpty) {
        throw const ApiException(
          'El servidor requiere 2FA pero no envió el token temporal.',
        );
      }
      return AuthResult.requiresTwoFactor(tempToken);
    }

    final session = await _persistSession(dto, tenantId: tenantId);
    return AuthResult.success(session);
  }

  Future<AuthSession> _persistSession(AuthDto dto, {String? tenantId}) async {
    final token = dto.accessToken;
    if (token == null || token.isEmpty) {
      throw const ApiException('El servidor no devolvió un token de acceso.');
    }

    await _storage.saveAccessToken(token);
    if (tenantId != null && tenantId.isNotEmpty) {
      await _storage.saveTenantId(tenantId);
    }

    return AuthSession(
      accessToken: token,
      tokenType: dto.tokenType ?? 'Bearer',
      expiresIn: dto.expiresIn,
      tenantId: tenantId,
    );
  }

  ApiException _toApiException(DioException error) {
    final wrapped = error.error;
    if (wrapped is ApiException) return wrapped;
    return ApiException.fromDio(error);
  }
}
