import '../entities/corporate_group.dart';
import '../entities/department.dart';

/// Puerto del repositorio de departamentos y grupos corporativos.
abstract interface class DepartmentRepository {
  Future<List<Department>> getDepartments();

  Future<Department> createDepartment(CreateDepartmentParams params);

  Future<List<CorporateGroup>> getCorporateGroups();

  Future<CorporateGroup> createCorporateGroup({
    required String name,
    String? description,
  });

  /// `POST /departments/{id}/groups`
  Future<void> assignDepartmentToGroup({
    required String departmentId,
    required String corporateGroupId,
  });
}

/// Datos del formulario de creación de departamento.
class CreateDepartmentParams {
  const CreateDepartmentParams({
    required this.name,
    required this.code,
    required this.unitType,
    this.parentDepartmentId,
    this.managerPartyId,
  });

  final String name;
  final String code;
  final DepartmentUnitType unitType;
  final String? parentDepartmentId;
  final String? managerPartyId;
}
