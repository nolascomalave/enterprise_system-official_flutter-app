import '../entities/employee.dart';

/// Puerto del repositorio de empleados.
abstract interface class EmployeesRepository {
  Future<List<Employee>> getEmployees();

  /// El backend no expone `GET /employees/{id}`: se filtra el listado.
  Future<Employee> getEmployeeById(String employeeId);

  Future<Employee> createEmployee(CreateEmployeeParams params);
}

/// Puerto de estructura organizativa (jobs/departments).
abstract interface class OrgStructureRepository {
  Future<List<Job>> getJobs();

  Future<List<Department>> getDepartments();
}

/// Datos del formulario de creación de empleado.
class CreateEmployeeParams {
  const CreateEmployeeParams({
    required this.partyId,
    required this.employeeCode,
    required this.hireDate,
    required this.jobId,
    required this.departmentId,
    this.managerPartyId,
    this.status = EmployeeStatus.active,
  });

  final String partyId;
  final String employeeCode;

  /// Formato `YYYY-MM-DD`.
  final String hireDate;
  final String jobId;
  final String departmentId;
  final String? managerPartyId;
  final EmployeeStatus status;
}
