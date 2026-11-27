import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/entities/department.dart';
import '../../domain/errors/department_not_found_exception.dart';
import 'departments_notifier.dart';

part 'department_detail_notifier.g.dart';

/// Detalle de un departamento.
///
/// El backend aún no expone `GET /departments/{id}`: se filtra el listado
/// en memoria reutilizando la caché de [departmentsProvider].
@riverpod
class DepartmentDetailNotifier extends _$DepartmentDetailNotifier {
  @override
  Future<Department> build(String departmentId) async {
    final departments = await ref.watch(departmentsProvider.future);
    for (final department in departments) {
      if (department.id == departmentId) return department;
    }
    throw DepartmentNotFoundException(departmentId);
  }
}
