import 'package:dio/dio.dart';
import 'package:enterprise_app/features/departments/data/repositories/department_repository_impl.dart';
import 'package:enterprise_app/features/departments/domain/entities/department.dart';
import 'package:enterprise_app/features/departments/domain/repositories/department_repository.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/mock_dio.dart';

void main() {
  late MockAdapter adapter;

  Dio buildDio() =>
      Dio(BaseOptions(baseUrl: 'http://test.local/api/v1'))
        ..httpClientAdapter = adapter;

  group('DepartmentRepositoryImpl.getDepartments', () {
    test('parsea la lista plana y construye el árbol jerárquico', () async {
      adapter = MockAdapter((options, body) async {
        expect(options.path, '/departments');
        return jsonResponse({
          'data': [
            {
              'id': 'd1',
              'name': 'Tecnología',
              'code': 'TECH',
              'unit_type': 'DIVISION',
              'created_at': '2024-03-01T10:00:00Z',
            },
            {
              'id': 'd2',
              'name': 'Frontend',
              'code': 'FE',
              'unit_type': 'DEPARTMENT',
              'parent_department_id': 'd1',
              'manager_party_id': 'p1',
            },
            {
              'id': 'd3',
              'name': 'Ventas',
              'code': 'SALES',
              'unit_type': 'BRANCH',
            },
          ],
        });
      });

      final repository = DepartmentRepositoryImpl(buildDio());
      final departments = await repository.getDepartments();

      expect(departments, hasLength(3));
      expect(departments.first.unitType, DepartmentUnitType.division);
      expect(departments.first.createdAt, '2024-03-01T10:00:00Z');
      expect(departments[1].parentDepartmentId, 'd1');
      expect(departments[1].managerPartyId, 'p1');

      final tree = buildDepartmentTree(departments);
      expect(tree, hasLength(2));
      expect(tree.map((n) => n.department.name), ['Tecnología', 'Ventas']);
      final tech = tree.first;
      expect(tech.children, hasLength(1));
      expect(tech.children.single.department.name, 'Frontend');
    });
  });

  group('DepartmentRepositoryImpl.createDepartment', () {
    test('envía unit_type y omite opcionales nulos', () async {
      adapter = MockAdapter((options, body) async {
        expect(options.path, '/departments');
        return jsonResponse({
          'data': {
            'id': 'd9',
            'name': 'Operaciones',
            'code': 'OPS',
            'unit_type': 'OFFICE',
          },
        }, statusCode: 201);
      });

      final repository = DepartmentRepositoryImpl(buildDio());
      final department = await repository.createDepartment(
        const CreateDepartmentParams(
          name: 'Operaciones',
          code: 'OPS',
          unitType: DepartmentUnitType.office,
        ),
      );

      expect(department.id, 'd9');
      expect(department.unitType, DepartmentUnitType.office);

      final sent = adapter.lastBody!;
      expect(sent, contains('"name":"Operaciones"'));
      expect(sent, contains('"code":"OPS"'));
      expect(sent, contains('"unit_type":"OFFICE"'));
      expect(sent, isNot(contains('"parent_department_id"')));
      expect(sent, isNot(contains('"manager_party_id"')));
    });

    test('incluye parent y manager cuando se envían', () async {
      adapter = MockAdapter((options, body) async {
        return jsonResponse({
          'data': {
            'id': 'd10',
            'name': 'Frontend',
            'code': 'FE',
            'unit_type': 'DEPARTMENT',
            'parent_department_id': 'd1',
            'manager_party_id': 'p1',
          },
        }, statusCode: 201);
      });

      final repository = DepartmentRepositoryImpl(buildDio());
      await repository.createDepartment(
        const CreateDepartmentParams(
          name: 'Frontend',
          code: 'FE',
          unitType: DepartmentUnitType.department,
          parentDepartmentId: 'd1',
          managerPartyId: 'p1',
        ),
      );

      final sent = adapter.lastBody!;
      expect(sent, contains('"parent_department_id":"d1"'));
      expect(sent, contains('"manager_party_id":"p1"'));
    });
  });

  group('Grupos corporativos', () {
    test('GET /corporate-groups mapea los grupos', () async {
      adapter = MockAdapter((options, body) async {
        expect(options.path, '/corporate-groups');
        return jsonResponse({
          'data': [
            {'id': 'g1', 'name': 'Distribución', 'description': 'Operaciones'},
            {'id': 'g2', 'name': 'Corporativo'},
          ],
        });
      });

      final repository = DepartmentRepositoryImpl(buildDio());
      final groups = await repository.getCorporateGroups();

      expect(groups, hasLength(2));
      expect(groups.first.name, 'Distribución');
      expect(groups.first.description, 'Operaciones');
      expect(groups.last.description, isNull);
    });

    test('POST /corporate-groups envía nombre y descripción', () async {
      adapter = MockAdapter((options, body) async {
        expect(options.path, '/corporate-groups');
        return jsonResponse({
          'data': {'id': 'g3', 'name': 'Corporativo'},
        }, statusCode: 201);
      });

      final repository = DepartmentRepositoryImpl(buildDio());
      final group = await repository.createCorporateGroup(
        name: 'Corporativo',
        description: 'Holding',
      );

      expect(group.id, 'g3');
      final sent = adapter.lastBody!;
      expect(sent, contains('"name":"Corporativo"'));
      expect(sent, contains('"description":"Holding"'));
    });

    test('POST /departments/{id}/groups envía corporate_group_id', () async {
      adapter = MockAdapter((options, body) async {
        expect(options.path, '/departments/d1/groups');
        return ResponseBody.fromString('', 204);
      });

      final repository = DepartmentRepositoryImpl(buildDio());
      await repository.assignDepartmentToGroup(
        departmentId: 'd1',
        corporateGroupId: 'g1',
      );

      expect(adapter.lastBody, contains('"corporate_group_id":"g1"'));
    });
  });
}
