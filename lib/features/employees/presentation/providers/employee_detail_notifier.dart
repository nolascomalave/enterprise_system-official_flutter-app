import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/entities/employee.dart';
import 'employees_providers.dart';

part 'employee_detail_notifier.g.dart';

/// Detalle de un empleado por su party ID.
@riverpod
class EmployeeDetailNotifier extends _$EmployeeDetailNotifier {
  @override
  Future<Employee> build(String employeeId) async {
    final useCase = await ref.watch(getEmployeeByIdUseCaseProvider.future);
    return useCase(employeeId);
  }
}
