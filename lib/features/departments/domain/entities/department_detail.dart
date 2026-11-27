import 'corporate_group.dart';
import 'department.dart';

/// Detalle agregado de un departamento y sus grupos corporativos.
class DepartmentDetail {
  const DepartmentDetail({required this.department, required this.groups});

  final Department department;
  final List<CorporateGroup> groups;
}
