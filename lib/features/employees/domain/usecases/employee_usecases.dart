import '../entities/employee.dart';
import '../repositories/employees_repository.dart';

/// Caso de uso: listar empleados.
class GetEmployeesUseCase {
  const GetEmployeesUseCase(this._repository);

  final EmployeesRepository _repository;

  Future<List<Employee>> call() => _repository.getEmployees();
}

/// Caso de uso: crear un empleado.
class CreateEmployeeUseCase {
  const CreateEmployeeUseCase(this._repository);

  final EmployeesRepository _repository;

  Future<Employee> call(CreateEmployeeParams params) =>
      _repository.createEmployee(params);
}

/// Caso de uso: listar puestos.
class GetJobsUseCase {
  const GetJobsUseCase(this._repository);

  final OrgStructureRepository _repository;

  Future<List<Job>> call() => _repository.getJobs();
}

/// Caso de uso: listar departamentos.
class GetDepartmentsUseCase {
  const GetDepartmentsUseCase(this._repository);

  final OrgStructureRepository _repository;

  Future<List<Department>> call() => _repository.getDepartments();
}
