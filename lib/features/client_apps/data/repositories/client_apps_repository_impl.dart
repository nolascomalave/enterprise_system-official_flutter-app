import 'package:dio/dio.dart';

import '../../../../core/network/api_exception.dart';
import '../../domain/entities/client_application.dart';
import '../../domain/repositories/client_apps_repository.dart';
import '../dto/client_application_dto.dart';

/// Implementación contra la API Go.
///
/// Solo endpoints de tenant (`/client-applications`); nunca `/platform/*`.
class ClientAppsRepositoryImpl implements ClientAppsRepository {
  ClientAppsRepositoryImpl(this._dio);

  final Dio _dio;

  @override
  Future<List<ClientApplication>> getClientApplications() async {
    try {
      final response = await _dio.get<Map<String, dynamic>>('/client-applications');
      final data = response.data?['data'] ?? response.data;
      if (data is! List) {
        throw const ApiException(
            'Respuesta de aplicaciones cliente inválida del servidor.');
      }
      return data
          .whereType<Map>()
          .map((json) =>
              ClientApplicationDto.fromJson(Map<String, dynamic>.from(json)).toEntity())
          .toList();
    } on DioException catch (error) {
      throw _toApiException(error);
    }
  }

  @override
  Future<ClientApplication> createClientApplication({
    required String name,
    required List<String> scopes,
  }) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        '/client-applications',
        data: CreateClientApplicationRequestDto(
          name: name,
          scopes: scopes,
        ).toJson(),
      );
      final data = response.data?['data'] ?? response.data;
      if (data is! Map) {
        throw const ApiException('Respuesta de creación inválida del servidor.');
      }
      return ClientApplicationDto.fromJson(Map<String, dynamic>.from(data))
          .toEntity();
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
