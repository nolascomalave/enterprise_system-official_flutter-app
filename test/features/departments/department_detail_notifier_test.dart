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

  @override
  Future<List<Department>> getDepartments() async {
    fetchCalls++;
    return departments;
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
  test('carga el departamento por ID desde el listado', () async {
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

    final department = await container.read(
      departmentDetailProvider('d2').future,
    );

    expect(department.id, 'd2');
    expect(department.name, 'Ventas');
    expect(department.code, 'SALES');
    expect(repository.fetchCalls, 1);
  });
}
