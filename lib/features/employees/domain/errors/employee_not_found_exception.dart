/// El empleado solicitado no existe (HTTP 404 del backend).
class EmployeeNotFoundException implements Exception {
  const EmployeeNotFoundException(this.employeeId);

  final String employeeId;

  @override
  String toString() => 'EmployeeNotFoundException($employeeId)';
}
