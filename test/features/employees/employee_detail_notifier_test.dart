import 'package:enterprise_app/core/network/api_exception.dart';
import 'package:enterprise_app/features/employees/domain/entities/employee.dart';
import 'package:enterprise_app/features/employees/domain/repositories/employees_repository.dart';
import 'package:enterprise_app/features/employees/presentation/providers/employee_detail_notifier.dart';
import 'package:enterprise_app/features/employees/presentation/providers/employees_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

class FakeEmployeesRepository implements EmployeesRepository {
  FakeEmployeesRepository(this.employees);

  final List<Employee> employees;
  int detailCalls = 0;

  @override
  Future<List<Employee>> getEmployees() async => employees;

  @override
  Future<Employee> getEmployeeById(String employeeId) async {
    detailCalls++;
    for (final employee in employees) {
      if (employee.id == employeeId) return employee;
    }
    throw const ApiException('Empleado no encontrado.');
  }

  @override
  Future<Employee> createEmployee(CreateEmployeeParams params) =>
      throw UnimplementedError();
}

void main() {
  const employee = Employee(
    partyId: 'p1',
    employeeCode: 'EMP-0001',
    jobId: 'j1',
    departmentId: 'd1',
    hireDate: '2026-01-15',
    managerPartyId: 'p2',
  );

  test('carga el empleado por ID', () async {
    final repository = FakeEmployeesRepository([employee]);
    final container = ProviderContainer(
      overrides: [
        employeesRepositoryProvider.overrideWith((ref) async => repository),
      ],
    );
    addTearDown(container.dispose);
    final sub = container.listen(
      employeeDetailProvider('p1'),
      (previous, next) {},
    );
    addTearDown(sub.close);

    final result = await container.read(employeeDetailProvider('p1').future);

    expect(result.partyId, 'p1');
    expect(result.employeeCode, 'EMP-0001');
    expect(result.hireDate, '2026-01-15');
    expect(result.managerPartyId, 'p2');
    expect(repository.detailCalls, 1);
  });
}
