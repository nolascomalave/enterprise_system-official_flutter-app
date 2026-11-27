import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/entities/department.dart';
import '../../domain/repositories/department_repository.dart';
import 'department_providers.dart';

part 'departments_notifier.g.dart';

/// Árbol de departamentos derivado de la lista plana.
final departmentTreeProvider = Provider<AsyncValue<List<DepartmentNode>>>((
  ref,
) {
  return ref.watch(departmentsProvider).whenData(buildDepartmentTree);
});

/// Lista plana de departamentos (el árbol se deriva con buildDepartmentTree).
@riverpod
class DepartmentsNotifier extends _$DepartmentsNotifier {
  @override
  Future<List<Department>> build() async {
    final useCase = await ref.watch(getDepartmentsUseCaseProvider.future);
    return useCase();
  }

  Future<Department> createDepartment(CreateDepartmentParams params) async {
    final useCase = await ref.read(createDepartmentUseCaseProvider.future);
    final department = await useCase(params);
    ref.invalidateSelf();
    await future;
    return department;
  }

  Future<void> refresh() async {
    ref.invalidateSelf();
    await future;
  }
}
