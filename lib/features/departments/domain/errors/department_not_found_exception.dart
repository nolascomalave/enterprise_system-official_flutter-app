/// El departamento solicitado no existe en el listado del tenant.
class DepartmentNotFoundException implements Exception {
  const DepartmentNotFoundException(this.departmentId);

  final String departmentId;

  @override
  String toString() => 'DepartmentNotFoundException($departmentId)';
}
