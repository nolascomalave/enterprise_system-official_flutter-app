import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/dio_client.dart';
import '../../../parties/domain/entities/party.dart';
import '../../../parties/presentation/providers/parties_providers.dart';
import '../../data/repositories/employee_repository_impl.dart';
import '../../domain/entities/employee.dart';
import '../../domain/repositories/employees_repository.dart';
import '../../domain/usecases/employee_usecases.dart';

final employeesRepositoryProvider = FutureProvider<EmployeesRepository>((
  ref,
) async {
  final dio = await ref.watch(dioProvider.future);
  return EmployeeRepositoryImpl(dio);
});

final orgStructureRepositoryProvider = FutureProvider<OrgStructureRepository>((
  ref,
) async {
  final dio = await ref.watch(dioProvider.future);
  return OrgStructureRepositoryImpl(dio);
});

final getEmployeesUseCaseProvider = FutureProvider<GetEmployeesUseCase>((
  ref,
) async {
  final repository = await ref.watch(employeesRepositoryProvider.future);
  return GetEmployeesUseCase(repository);
});

final getEmployeeByIdUseCaseProvider = FutureProvider<GetEmployeeByIdUseCase>((
  ref,
) async {
  final repository = await ref.watch(employeesRepositoryProvider.future);
  return GetEmployeeByIdUseCase(repository);
});

final createEmployeeUseCaseProvider = FutureProvider<CreateEmployeeUseCase>((
  ref,
) async {
  final repository = await ref.watch(employeesRepositoryProvider.future);
  return CreateEmployeeUseCase(repository);
});

/// Puestos disponibles (dropdown del formulario).
final jobsProvider = FutureProvider<List<Job>>((ref) async {
  final repository = await ref.watch(orgStructureRepositoryProvider.future);
  return GetJobsUseCase(repository)();
});

/// Departamentos disponibles (dropdown del formulario).
final departmentOptionsProvider = FutureProvider<List<Department>>((ref) async {
  final repository = await ref.watch(orgStructureRepositoryProvider.future);
  return GetDepartmentsUseCase(repository)();
});

/// Parties INDIVIDUAL (candidatas a convertirse en empleado).
final individualPartiesProvider = FutureProvider<List<Party>>((ref) async {
  final repository = await ref.watch(partiesRepositoryProvider.future);
  final parties = await repository.getParties();
  return parties
      .where((party) => party.partyType == PartyType.individual)
      .toList();
});
