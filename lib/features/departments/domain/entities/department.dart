/// Tipo de unidad organizativa.
enum DepartmentUnitType {
  division,
  branch,
  office,
  department;

  static DepartmentUnitType fromApi(String? value) {
    return switch (value?.toUpperCase()) {
      'DIVISION' => division,
      'BRANCH' => branch,
      'OFFICE' => office,
      _ => department,
    };
  }

  String get apiValue => name.toUpperCase();

  String get label => switch (this) {
    DepartmentUnitType.division => 'División',
    DepartmentUnitType.branch => 'Sucursal',
    DepartmentUnitType.office => 'Oficina',
    DepartmentUnitType.department => 'Departamento',
  };
}

/// Departamento (plano, tal como llega del backend).
class Department {
  const Department({
    required this.id,
    required this.name,
    required this.code,
    this.unitType = DepartmentUnitType.department,
    this.parentDepartmentId,
    this.managerPartyId,
    this.createdAt,
  });

  final String id;
  final String name;
  final String code;
  final DepartmentUnitType unitType;
  final String? parentDepartmentId;
  final String? managerPartyId;
  final String? createdAt;
}

/// Nodo del árbol en memoria.
class DepartmentNode {
  const DepartmentNode({required this.department, this.children = const []});

  final Department department;
  final List<DepartmentNode> children;
}

/// Construye el árbol jerárquico a partir de la lista plana.
///
/// Los departamentos cuyo padre no existe se tratan como raíz
/// (p. ej. si el backend devuelve datos parciales).
List<DepartmentNode> buildDepartmentTree(List<Department> departments) {
  final byParent = <String?, List<Department>>{};
  final ids = departments.map((d) => d.id).toSet();

  for (final department in departments) {
    final parent = ids.contains(department.parentDepartmentId)
        ? department.parentDepartmentId
        : null;
    byParent.putIfAbsent(parent, () => []).add(department);
  }

  List<DepartmentNode> build(String? parentId) {
    final children = byParent[parentId] ?? const <Department>[];
    final sorted = [...children]..sort((a, b) => a.name.compareTo(b.name));
    return [
      for (final department in sorted)
        DepartmentNode(department: department, children: build(department.id)),
    ];
  }

  return build(null);
}
