import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/dio_client.dart';
import '../../data/repositories/department_repository_impl.dart';
import '../../domain/repositories/department_repository.dart';
import '../../domain/usecases/department_usecases.dart';

final departmentRepositoryProvider = FutureProvider<DepartmentRepository>((
  ref,
) async {
  final dio = await ref.watch(dioProvider.future);
  return DepartmentRepositoryImpl(dio);
});

final getDepartmentsUseCaseProvider = FutureProvider<GetDepartmentsUseCase>((
  ref,
) async {
  final repository = await ref.watch(departmentRepositoryProvider.future);
  return GetDepartmentsUseCase(repository);
});

final getDepartmentByIdUseCaseProvider =
    FutureProvider<GetDepartmentByIdUseCase>((ref) async {
      final repository = await ref.watch(departmentRepositoryProvider.future);
      return GetDepartmentByIdUseCase(repository);
    });

final getDepartmentGroupsUseCaseProvider =
    FutureProvider<GetDepartmentGroupsUseCase>((ref) async {
      final repository = await ref.watch(departmentRepositoryProvider.future);
      return GetDepartmentGroupsUseCase(repository);
    });

final createDepartmentUseCaseProvider = FutureProvider<CreateDepartmentUseCase>(
  (ref) async {
    final repository = await ref.watch(departmentRepositoryProvider.future);
    return CreateDepartmentUseCase(repository);
  },
);

final getCorporateGroupsUseCaseProvider =
    FutureProvider<GetCorporateGroupsUseCase>((ref) async {
      final repository = await ref.watch(departmentRepositoryProvider.future);
      return GetCorporateGroupsUseCase(repository);
    });

final createCorporateGroupUseCaseProvider =
    FutureProvider<CreateCorporateGroupUseCase>((ref) async {
      final repository = await ref.watch(departmentRepositoryProvider.future);
      return CreateCorporateGroupUseCase(repository);
    });

final assignDepartmentToGroupUseCaseProvider =
    FutureProvider<AssignDepartmentToGroupUseCase>((ref) async {
      final repository = await ref.watch(departmentRepositoryProvider.future);
      return AssignDepartmentToGroupUseCase(repository);
    });
