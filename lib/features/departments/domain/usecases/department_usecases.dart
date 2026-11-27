import '../entities/corporate_group.dart';
import '../entities/department.dart';
import '../repositories/department_repository.dart';

/// Caso de uso: listar departamentos.
class GetDepartmentsUseCase {
  const GetDepartmentsUseCase(this._repository);

  final DepartmentRepository _repository;

  Future<List<Department>> call() => _repository.getDepartments();
}

/// Caso de uso: crear un departamento.
class CreateDepartmentUseCase {
  const CreateDepartmentUseCase(this._repository);

  final DepartmentRepository _repository;

  Future<Department> call(CreateDepartmentParams params) =>
      _repository.createDepartment(params);
}

/// Caso de uso: listar grupos corporativos.
class GetCorporateGroupsUseCase {
  const GetCorporateGroupsUseCase(this._repository);

  final DepartmentRepository _repository;

  Future<List<CorporateGroup>> call() => _repository.getCorporateGroups();
}

/// Caso de uso: crear un grupo corporativo.
class CreateCorporateGroupUseCase {
  const CreateCorporateGroupUseCase(this._repository);

  final DepartmentRepository _repository;

  Future<CorporateGroup> call({required String name, String? description}) =>
      _repository.createCorporateGroup(name: name, description: description);
}

/// Caso de uso: asignar un departamento a un grupo corporativo.
class AssignDepartmentToGroupUseCase {
  const AssignDepartmentToGroupUseCase(this._repository);

  final DepartmentRepository _repository;

  Future<void> call({
    required String departmentId,
    required String corporateGroupId,
  }) => _repository.assignDepartmentToGroup(
    departmentId: departmentId,
    corporateGroupId: corporateGroupId,
  );
}
