import 'package:dio/dio.dart';

import '../../../../core/network/api_exception.dart';
import '../../domain/entities/security_settings.dart';
import '../../domain/repositories/settings_repository.dart';
import '../dto/settings_dto.dart';

/// Implementación de seguridad contra la API Go.
class SettingsRepositoryImpl implements SettingsRepository {
  SettingsRepositoryImpl(this._dio);

  final Dio _dio;

  @override
  Future<void> updateMfaPreferences({
    required bool enabled,
    MfaMethod? method,
    String? otpCode,
  }) async {
    try {
      await _dio.put<void>(
        '/auth/mfa-preferences',
        data: UpdateMfaPreferencesRequestDto(
          enabled: enabled,
          method: method?.apiValue,
          otpCode: otpCode,
        ).toJson(),
      );
    } on DioException catch (error) {
      throw _toApiException(error);
    }
  }

  @override
  Future<TotpSetup> setupTotp() async {
    try {
      final response = await _dio.post<Map<String, dynamic>>('/auth/totp/setup');
      final data = response.data?['data'];
      if (data is! Map) {
        throw const ApiException('Respuesta de setup TOTP inválida.');
      }
      final dto = TotpSetupResponseDto.fromJson(Map<String, dynamic>.from(data));
      final url = dto.otpauthUrl;
      final secret = dto.secret;
      if (url == null || url.isEmpty || secret == null || secret.isEmpty) {
        throw const ApiException('El servidor no devolvió el secreto TOTP.');
      }
      return TotpSetup(otpauthUrl: url, secret: secret);
    } on DioException catch (error) {
      throw _toApiException(error);
    }
  }

  @override
  Future<List<String>> verifyTotp({required String code}) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        '/auth/totp/verify',
        data: VerifyTotpRequestDto(code: code).toJson(),
      );
      final data = response.data?['data'];
      if (data is! Map) {
        throw const ApiException('Respuesta de verificación inválida.');
      }
      return TotpVerifyResponseDto.fromJson(Map<String, dynamic>.from(data))
          .backupCodes;
    } on DioException catch (error) {
      throw _toApiException(error);
    }
  }

  @override
  Future<void> requestOtp({required MfaAction action}) async {
    try {
      await _dio.post<void>(
        '/auth/request-otp',
        data: RequestSecurityCodeRequestDto(action: action.apiValue).toJson(),
      );
    } on DioException catch (error) {
      throw _toApiException(error);
    }
  }

  ApiException _toApiException(DioException error) {
    final wrapped = error.error;
    if (wrapped is ApiException) return wrapped;
    return ApiException.fromDio(error);
  }
}
