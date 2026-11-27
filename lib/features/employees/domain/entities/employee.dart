/// Estado del empleado según el backend.
enum EmployeeStatus {
  active,
  onLeave,
  terminated;

  static EmployeeStatus fromApi(String? value) {
    return switch (value?.toUpperCase()) {
      'ON_LEAVE' => onLeave,
      'TERMINATED' => terminated,
      _ => active,
    };
  }

  String get apiValue => switch (this) {
    EmployeeStatus.active => 'ACTIVE',
    EmployeeStatus.onLeave => 'ON_LEAVE',
    EmployeeStatus.terminated => 'TERMINATED',
  };

  String get label => switch (this) {
    EmployeeStatus.active => 'Activo',
    EmployeeStatus.onLeave => 'Permiso',
    EmployeeStatus.terminated => 'Terminado',
  };
}

/// Empleado (party INDIVIDUAL convertida en empleado).
class Employee {
  const Employee({
    required this.partyId,
    required this.employeeCode,
    required this.jobId,
    required this.departmentId,
    required this.hireDate,
    this.managerPartyId,
    this.status = EmployeeStatus.active,
  });

  final String partyId;
  final String employeeCode;
  final String jobId;
  final String departmentId;
  final String hireDate;
  final String? managerPartyId;
  final EmployeeStatus status;

  /// El backend no expone `id` en EmployeeResponse; la party es la identidad.
  String get id => partyId;
}

/// Puesto de trabajo.
class Job {
  const Job({required this.id, required this.title, this.code = ''});

  final String id;
  final String title;
  final String code;
}

/// Departamento.
class Department {
  const Department({required this.id, required this.name, this.code = ''});

  final String id;
  final String name;
  final String code;
}
