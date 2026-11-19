import 'package:dio/dio.dart';

import '../../../../core/network/api_exception.dart';
import '../../domain/entities/corporate_group.dart';
import '../../domain/entities/department.dart';
import '../../domain/repositories/department_repository.dart';
import '../dto/corporate_group_dto.dart';
import '../dto/department_dto.dart';

/// Implementación contra la API Go.
class DepartmentRepositoryImpl implements DepartmentRepository {
  DepartmentRepositoryImpl(this._dio);

  final Dio _dio;

  @override
  Future<List<Department>> getDepartments() async {
    try {
      final response = await _dio.get<Map<String, dynamic>>('/departments');
      final data = response.data?['data'];
      if (data is! List) {
        throw const ApiException(
            'Respuesta de departamentos inválida del servidor.');
      }
      return data
          .whereType<Map>()
          .map((json) =>
              DepartmentDto.fromJson(Map<String, dynamic>.from(json)).toEntity())
          .toList();
    } on DioException catch (error) {
      throw _toApiException(error);
    }
  }

  @override
  Future<Department> createDepartment(CreateDepartmentParams params) async {
    final request = CreateDepartmentRequestDto(
      name: params.name,
      code: params.code,
      unitType: params.unitType.apiValue,
      parentDepartmentId: params.parentDepartmentId,
      managerPartyId: params.managerPartyId,
    );

    try {
      final response = await _dio.post<Map<String, dynamic>>(
        '/departments',
        data: request.toJson(),
      );
      final data = response.data?['data'];
      if (data is! Map) {
        throw const ApiException('Respuesta de creación inválida del servidor.');
      }
      return DepartmentDto.fromJson(Map<String, dynamic>.from(data)).toEntity();
    } on DioException catch (error) {
      throw _toApiException(error);
    }
  }

  @override
  Future<List<CorporateGroup>> getCorporateGroups() async {
    try {
      final response = await _dio.get<Map<String, dynamic>>('/corporate-groups');
      final data = response.data?['data'];
      if (data is! List) {
        throw const ApiException(
            'Respuesta de grupos corporativos inválida del servidor.');
      }
      return data
          .whereType<Map>()
          .map((json) =>
              CorporateGroupDto.fromJson(Map<String, dynamic>.from(json)).toEntity())
          .toList();
    } on DioException catch (error) {
      throw _toApiException(error);
    }
  }

  @override
  Future<CorporateGroup> createCorporateGroup({
    required String name,
    String? description,
  }) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        '/corporate-groups',
        data: CreateCorporateGroupRequestDto(
          name: name,
          description: description,
        ).toJson(),
      );
      final data = response.data?['data'];
      if (data is! Map) {
        throw const ApiException('Respuesta de creación inválida del servidor.');
      }
      return CorporateGroupDto.fromJson(Map<String, dynamic>.from(data)).toEntity();
    } on DioException catch (error) {
      throw _toApiException(error);
    }
  }

  @override
  Future<void> assignDepartmentToGroup({
    required String departmentId,
    required String corporateGroupId,
  }) async {
    try {
      await _dio.post<void>(
        '/departments/$departmentId/groups',
        data: AssignDepartmentToGroupRequestDto(
          corporateGroupId: corporateGroupId,
        ).toJson(),
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
