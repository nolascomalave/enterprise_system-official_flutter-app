/// Rutas de las ramas del [StatefulShellRoute].
abstract final class BranchRoutes {
  static const String dashboard = '/dashboard';
  static const String parties = '/parties';
  static const String employees = '/employees';
  static const String departments = '/departments';
  static const String settings = '/settings';

  static const List<String> all = [
    dashboard,
    parties,
    employees,
    departments,
    settings,
  ];

  /// Índice de rama para una ruta del menú RBAC (o null si no está implementada).
  static int? indexForRoute(String route) {
    if (route.isEmpty) return null;
    final index = all.indexWhere(
      (branch) => route == branch || route.startsWith('$branch/'),
    );
    return index == -1 ? null : index;
  }
}
