import 'dart:async';

import 'package:enterprise_app/features/departments/domain/entities/corporate_group.dart';
import 'package:enterprise_app/features/departments/domain/entities/department.dart';
import 'package:enterprise_app/features/departments/domain/repositories/department_repository.dart';
import 'package:enterprise_app/features/departments/presentation/providers/department_detail_notifier.dart';
import 'package:enterprise_app/features/departments/presentation/providers/department_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

class FakeDepartmentRepository implements DepartmentRepository {
  FakeDepartmentRepository(this.departments);

  final List<Department> departments;
  int fetchCalls = 0;
  int detailCalls = 0;
  int groupsCalls = 0;
  Completer<Department>? detailCompleter;
  Completer<List<CorporateGroup>>? groupsCompleter;

  @override
  Future<List<Department>> getDepartments() async {
    fetchCalls++;
    return departments;
  }

  @override
  Future<Department> getDepartmentById(String departmentId) {
    detailCalls++;
    if (detailCompleter != null) return detailCompleter!.future;
    return Future.value(
      departments.firstWhere((department) => department.id == departmentId),
    );
  }

  @override
  Future<List<CorporateGroup>> getDepartmentGroups(String departmentId) {
    groupsCalls++;
    if (groupsCompleter != null) return groupsCompleter!.future;
    return Future.value(const [CorporateGroup(id: 'g1', name: 'Grupo Uno')]);
  }

  @override
  Future<Department> createDepartment(CreateDepartmentParams params) =>
      throw UnimplementedError();

  @override
  Future<List<CorporateGroup>> getCorporateGroups() async => const [];

  @override
  Future<CorporateGroup> createCorporateGroup({
    required String name,
    String? description,
  }) => throw UnimplementedError();

  @override
  Future<void> assignDepartmentToGroup({
    required String departmentId,
    required String corporateGroupId,
  }) => throw UnimplementedError();
}

void main() {
  test('carga el departamento y sus grupos por ID', () async {
    final repository = FakeDepartmentRepository(const [
      Department(id: 'd1', name: 'Tecnología', code: 'TECH'),
      Department(id: 'd2', name: 'Ventas', code: 'SALES'),
    ]);
    final container = ProviderContainer(
      overrides: [
        departmentRepositoryProvider.overrideWith((ref) async => repository),
      ],
    );
    addTearDown(container.dispose);
    final sub = container.listen(
      departmentDetailProvider('d2'),
      (previous, next) {},
    );
    addTearDown(sub.close);

    final detail = await container.read(departmentDetailProvider('d2').future);

    expect(detail.department.id, 'd2');
    expect(detail.department.name, 'Ventas');
    expect(detail.department.code, 'SALES');
    expect(detail.groups.single.name, 'Grupo Uno');
    expect(repository.fetchCalls, 0);
  });

  test('lanza ambas peticiones en paralelo', () async {
    final repository = FakeDepartmentRepository(const [
      Department(id: 'd1', name: 'Tecnología', code: 'TECH'),
    ]);
    repository.detailCompleter = Completer<Department>();
    repository.groupsCompleter = Completer<List<CorporateGroup>>();
    final container = ProviderContainer(
      overrides: [
        departmentRepositoryProvider.overrideWith((ref) async => repository),
      ],
    );
    addTearDown(container.dispose);
    final sub = container.listen(
      departmentDetailProvider('d1'),
      (previous, next) {},
    );
    addTearDown(sub.close);

    final future = container.read(departmentDetailProvider('d1').future);
    await Future<void>.delayed(const Duration(milliseconds: 10));

    // Ambas peticiones se iniciaron antes de completar ninguna.
    expect(repository.detailCalls, 1);
    expect(repository.groupsCalls, 1);

    repository.detailCompleter!.complete(
      const Department(id: 'd1', name: 'Tecnología', code: 'TECH'),
    );
    repository.groupsCompleter!.complete(const [
      CorporateGroup(id: 'g1', name: 'Grupo Uno'),
    ]);
    await expectLater(future, completes);
  });
}
