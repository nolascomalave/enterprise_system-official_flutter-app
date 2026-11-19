import 'package:dio/dio.dart';

import '../../../../core/network/api_exception.dart';
import '../../domain/entities/user_preferences.dart';
import '../../domain/repositories/preferences_repository.dart';
import '../dto/user_preferences_dto.dart';

/// Implementación contra la API Go.
///
/// Ambos endpoints requieren el header `X-App-Client-ID`.
class PreferencesRepositoryImpl implements PreferencesRepository {
  PreferencesRepositoryImpl(this._dio, this._appClientId);

  final Dio _dio;
  final String _appClientId;

  static const String _path = '/users/me/preferences';

  Options get _options => Options(
        headers: {'X-App-Client-ID': _appClientId},
      );

  @override
  Future<UserPreferences> fetch() async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(_path, options: _options);
      return _parse(response.data);
    } on DioException catch (error) {
      throw _toApiException(error);
    }
  }

  @override
  Future<UserPreferences> update(Map<String, dynamic> preferences) async {
    try {
      final response = await _dio.put<Map<String, dynamic>>(
        _path,
        data: UserPreferencesDto(preferences: preferences).toJson(),
        options: _options,
      );
      // Si el backend no devuelve body (204), aplicamos lo enviado.
      if (response.data == null) {
        return UserPreferences.fromMap(preferences);
      }
      return _parse(response.data);
    } on DioException catch (error) {
      throw _toApiException(error);
    }
  }

  UserPreferences _parse(Map<String, dynamic>? body) {
    if (body == null) return UserPreferences.defaults;
    final data = body['data'];
    if (data is Map) {
      final raw = data['preferences'];
      if (raw is Map) {
        return UserPreferences.fromMap(Map<String, dynamic>.from(raw));
      }
      return UserPreferences.fromMap(Map<String, dynamic>.from(data));
    }
    // Algunos backends devuelven el mapa directamente.
    if (body['preferences'] is Map) {
      return UserPreferences.fromMap(
        Map<String, dynamic>.from(body['preferences'] as Map),
      );
    }
    return UserPreferences.fromMap(body);
  }

  ApiException _toApiException(DioException error) {
    final wrapped = error.error;
    if (wrapped is ApiException) return wrapped;
    return ApiException.fromDio(error);
  }
}
