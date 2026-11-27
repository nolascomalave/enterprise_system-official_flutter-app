import 'package:dio/dio.dart';
import 'package:enterprise_app/features/employees/data/repositories/employee_repository_impl.dart';
import 'package:enterprise_app/features/employees/domain/entities/employee.dart';
import 'package:enterprise_app/features/employees/domain/errors/employee_not_found_exception.dart';
import 'package:enterprise_app/features/employees/domain/repositories/employees_repository.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/mock_dio.dart';

void main() {
  late MockAdapter adapter;

  Dio buildDio() =>
      Dio(BaseOptions(baseUrl: 'http://test.local/api/v1'))
        ..httpClientAdapter = adapter;

  group('EmployeeRepositoryImpl.getEmployees', () {
    test('parsea el envelope y mapea estados', () async {
      adapter = MockAdapter((options, body) async {
        expect(options.path, '/employees');
        return jsonResponse({
          'data': [
            {
              'party_id': 'p1',
              'employee_code': 'EMP-0001',
              'job_id': 'j1',
              'department_id': 'd1',
              'hire_date': '2026-01-15',
              'status': 'ACTIVE',
            },
            {
              'party_id': 'p2',
              'employee_code': 'EMP-0002',
              'job_id': 'j2',
              'department_id': 'd2',
              'hire_date': '2025-06-01',
              'status': 'ON_LEAVE',
            },
          ],
        });
      });

      final repository = EmployeeRepositoryImpl(buildDio());
      final employees = await repository.getEmployees();

      expect(employees, hasLength(2));
      expect(employees.first.partyId, 'p1');
      expect(employees.first.employeeCode, 'EMP-0001');
      expect(employees.first.hireDate, '2026-01-15');
      expect(employees.first.status, EmployeeStatus.active);
      expect(employees.last.status, EmployeeStatus.onLeave);
    });
  });

  group('EmployeeRepositoryImpl.getEmployeeById', () {
    test('llama a GET /employees/{id} y mapea el envelope', () async {
      adapter = MockAdapter((options, body) async {
        expect(options.method, 'GET');
        expect(options.path, '/employees/p2');
        return jsonResponse({
          'data': {
            'party_id': 'p2',
            'employee_code': 'EMP-0002',
            'job_id': 'j2',
            'department_id': 'd2',
            'hire_date': '2025-06-01',
            'status': 'ON_LEAVE',
          },
        });
      });

      final repository = EmployeeRepositoryImpl(buildDio());
      final employee = await repository.getEmployeeById('p2');

      expect(employee.partyId, 'p2');
      expect(employee.employeeCode, 'EMP-0002');
      expect(employee.status, EmployeeStatus.onLeave);
      // No debe consultar el listado.
      expect(adapter.lastOptions?.path, '/employees/p2');
    });

    test('mapea un 404 a EmployeeNotFoundException', () async {
      adapter = MockAdapter(
        (options, body) async =>
            jsonResponse({'error': 'employee_not_found'}, statusCode: 404),
      );
      final repository = EmployeeRepositoryImpl(buildDio());

      expect(
        () => repository.getEmployeeById('missing'),
        throwsA(
          isA<EmployeeNotFoundException>().having(
            (error) => error.employeeId,
            'employeeId',
            'missing',
          ),
        ),
      );
    });
  });

  group('EmployeeRepositoryImpl.createEmployee', () {
    test(
      'envía el payload snake_case requerido y devuelve el empleado',
      () async {
        adapter = MockAdapter((options, body) async {
          expect(options.path, '/employees');
          return jsonResponse({
            'data': {
              'party_id': 'p1',
              'employee_code': 'EMP-0100',
              'job_id': 'j1',
              'department_id': 'd1',
              'hire_date': '2026-11-19',
              'status': 'ACTIVE',
            },
          }, statusCode: 201);
        });

        final repository = EmployeeRepositoryImpl(buildDio());
        final employee = await repository.createEmployee(
          const CreateEmployeeParams(
            partyId: 'p1',
            employeeCode: 'EMP-0100',
            hireDate: '2026-11-19',
            jobId: 'j1',
            departmentId: 'd1',
          ),
        );

        expect(employee.employeeCode, 'EMP-0100');
        expect(employee.status, EmployeeStatus.active);

        final sent = adapter.lastBody!;
        expect(sent, contains('"party_id":"p1"'));
        expect(sent, contains('"employee_code":"EMP-0100"'));
        expect(sent, contains('"hire_date":"2026-11-19"'));
        expect(sent, contains('"job_id":"j1"'));
        expect(sent, contains('"department_id":"d1"'));
        expect(sent, contains('"status":"ACTIVE"'));
        expect(sent, isNot(contains('"manager_party_id"')));
      },
    );
  });

  group('OrgStructureRepositoryImpl', () {
    test('GET /jobs mapea puestos', () async {
      adapter = MockAdapter((options, body) async {
        expect(options.path, '/jobs');
        return jsonResponse({
          'data': [
            {'id': 'j1', 'title': 'Ingeniero', 'code': 'ENG'},
            {'id': 'j2', 'title': 'Analista', 'code': 'ANL'},
          ],
        });
      });

      final repository = OrgStructureRepositoryImpl(buildDio());
      final jobs = await repository.getJobs();

      expect(jobs, hasLength(2));
      expect(jobs.first.title, 'Ingeniero');
      expect(jobs.last.code, 'ANL');
    });

    test('GET /departments mapea departamentos', () async {
      adapter = MockAdapter((options, body) async {
        expect(options.path, '/departments');
        return jsonResponse({
          'data': [
            {'id': 'd1', 'name': 'Tecnología', 'code': 'TECH'},
            {'id': 'd2', 'name': 'Ventas', 'code': 'SALES'},
          ],
        });
      });

      final repository = OrgStructureRepositoryImpl(buildDio());
      final departments = await repository.getDepartments();

      expect(departments, hasLength(2));
      expect(departments.first.name, 'Tecnología');
      expect(departments.last.id, 'd2');
    });
  });
}
