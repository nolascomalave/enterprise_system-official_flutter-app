import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/entities/corporate_group.dart';
import '../../domain/entities/department.dart';
import '../../domain/entities/department_detail.dart';
import 'department_providers.dart';

part 'department_detail_notifier.g.dart';

/// Detalle del departamento y sus grupos corporativos reales.
///
/// Ambos endpoints se lanzan en paralelo.
@riverpod
class DepartmentDetailNotifier extends _$DepartmentDetailNotifier {
  @override
  Future<DepartmentDetail> build(String departmentId) async {
    final detailUseCase = await ref.watch(
      getDepartmentByIdUseCaseProvider.future,
    );
    final groupsUseCase = await ref.watch(
      getDepartmentGroupsUseCaseProvider.future,
    );

    final results = await Future.wait<Object>([
      detailUseCase(departmentId),
      groupsUseCase(departmentId),
    ]);
    return DepartmentDetail(
      department: results[0] as Department,
      groups: results[1] as List<CorporateGroup>,
    );
  }
}
