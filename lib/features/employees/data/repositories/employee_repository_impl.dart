import 'package:dio/dio.dart';

import '../../../../core/network/api_exception.dart';
import '../../domain/entities/employee.dart';
import '../../domain/repositories/employees_repository.dart';
import '../dto/department_dto.dart';
import '../dto/employee_dto.dart';
import '../dto/job_dto.dart';

/// Implementación de empleados contra la API Go.
class EmployeeRepositoryImpl implements EmployeesRepository {
  EmployeeRepositoryImpl(this._dio);

  final Dio _dio;

  @override
  Future<List<Employee>> getEmployees() async {
    try {
      final response = await _dio.get<Map<String, dynamic>>('/employees');
      final data = response.data?['data'];
      if (data is! List) {
        throw const ApiException('Respuesta de empleados inválida del servidor.');
      }
      return data
          .whereType<Map>()
          .map((json) =>
              EmployeeDto.fromJson(Map<String, dynamic>.from(json)).toEntity())
          .toList();
    } on DioException catch (error) {
      throw _toApiException(error);
    }
  }

  @override
  Future<Employee> createEmployee(CreateEmployeeParams params) async {
    final request = CreateEmployeeRequestDto(
      partyId: params.partyId,
      employeeCode: params.employeeCode,
      hireDate: params.hireDate,
      jobId: params.jobId,
      departmentId: params.departmentId,
      managerPartyId: params.managerPartyId,
      status: params.status.apiValue,
    );

    try {
      final response = await _dio.post<Map<String, dynamic>>(
        '/employees',
        data: request.toJson(),
      );
      final data = response.data?['data'];
      if (data is! Map) {
        throw const ApiException('Respuesta de creación inválida del servidor.');
      }
      return EmployeeDto.fromJson(Map<String, dynamic>.from(data)).toEntity();
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

/// Implementación de la estructura organizativa (jobs/departments).
class OrgStructureRepositoryImpl implements OrgStructureRepository {
  OrgStructureRepositoryImpl(this._dio);

  final Dio _dio;

  @override
  Future<List<Job>> getJobs() async {
    try {
      final response = await _dio.get<Map<String, dynamic>>('/jobs');
      final data = response.data?['data'];
      if (data is! List) {
        throw const ApiException('Respuesta de puestos inválida del servidor.');
      }
      return data
          .whereType<Map>()
          .map((json) => JobDto.fromJson(Map<String, dynamic>.from(json)).toEntity())
          .toList();
    } on DioException catch (error) {
      throw _toApiException(error);
    }
  }

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

  ApiException _toApiException(DioException error) {
    final wrapped = error.error;
    if (wrapped is ApiException) return wrapped;
    return ApiException.fromDio(error);
  }
}
