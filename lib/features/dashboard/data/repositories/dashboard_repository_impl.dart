import 'package:dio/dio.dart';

import '../../../../core/network/api_exception.dart';
import '../../domain/entities/dashboard_summary.dart';
import '../../domain/repositories/dashboard_repository.dart';
import '../dto/dashboard_summary_dto.dart';

/// Implementación contra `GET /dashboard/summary`.
///
/// Sin filtros de tenant: el backend aplica RLS con el JWT.
class DashboardRepositoryImpl implements DashboardRepository {
  DashboardRepositoryImpl(this._dio);

  final Dio _dio;

  @override
  Future<DashboardSummary> getSummary() async {
    try {
      final response = await _dio.get<Map<String, dynamic>>('/dashboard/summary');
      final data = response.data?['data'] ?? response.data;
      if (data is! Map) {
        throw const ApiException('Respuesta de dashboard inválida del servidor.');
      }
      return DashboardSummaryDto.fromJson(Map<String, dynamic>.from(data))
          .toEntity();
    } on DioException catch (error) {
      final wrapped = error.error;
      if (wrapped is ApiException) throw wrapped;
      throw ApiException.fromDio(error);
    }
  }
}
