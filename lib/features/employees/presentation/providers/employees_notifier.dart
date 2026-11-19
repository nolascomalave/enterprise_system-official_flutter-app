import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/entities/employee.dart';
import '../../domain/repositories/employees_repository.dart';
import 'employees_providers.dart';

part 'employees_notifier.g.dart';

/// Lista de empleados + creación (refresca al crear).
@riverpod
class EmployeesNotifier extends _$EmployeesNotifier {
  @override
  Future<List<Employee>> build() async {
    final useCase = await ref.watch(getEmployeesUseCaseProvider.future);
    return useCase();
  }

  Future<Employee> createEmployee(CreateEmployeeParams params) async {
    final useCase = await ref.read(createEmployeeUseCaseProvider.future);
    final employee = await useCase(params);
    ref.invalidateSelf();
    await future;
    return employee;
  }

  Future<void> refresh() async {
    ref.invalidateSelf();
    await future;
  }
}
