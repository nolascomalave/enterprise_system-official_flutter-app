import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/pages/two_factor_page.dart';
import '../../features/dashboard/presentation/pages/dashboard_page.dart';
import '../../features/corporate_relationships/presentation/pages/corporate_relationships_page.dart';
import '../../features/corporate_relationships/presentation/pages/relationship_detail_page.dart';
import '../../features/departments/presentation/pages/department_detail_page.dart';
import '../../features/departments/presentation/pages/departments_page.dart';
import '../../features/employees/presentation/pages/employee_detail_page.dart';
import '../../features/employees/presentation/pages/employees_list_page.dart';
import '../../features/parties/presentation/pages/parties_list_page.dart';
import '../../features/parties/presentation/pages/party_detail_page.dart';
import '../../features/settings/presentation/pages/settings_page.dart';
import '../network/dio_client.dart';
import '../ui/app_shell.dart';
import 'branch_routes.dart';

/// Rutas nombradas de la app.
abstract final class AppRoutes {
  static const String login = '/login';
  static const String twoFactor = '/login/2fa';
  static const String dashboard = BranchRoutes.dashboard;
}

/// GoRouter con shell persistente (IndexedStack) y protección por sesión.
final routerProvider = Provider<GoRouter>((ref) {
  final storage = ref.watch(secureStorageProvider);

  return GoRouter(
    initialLocation: AppRoutes.dashboard,
    debugLogDiagnostics: true,
    redirect: (context, state) async {
      final hasSession = await storage.hasSession();
      final location = state.matchedLocation;
      final isAuthRoute =
          location == AppRoutes.login || location == AppRoutes.twoFactor;

      if (!hasSession && !isAuthRoute) return AppRoutes.login;
      if (hasSession && isAuthRoute) return AppRoutes.dashboard;
      return null;
    },
    routes: [
      GoRoute(
        path: AppRoutes.login,
        name: 'login',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: AppRoutes.twoFactor,
        name: 'twoFactor',
        builder: (context, state) => const TwoFactorPage(),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            AppShell(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: BranchRoutes.dashboard,
                name: 'dashboard',
                builder: (context, state) => const DashboardPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: BranchRoutes.parties,
                name: 'parties',
                builder: (context, state) => const PartiesListPage(),
                routes: [
                  GoRoute(
                    path: ':id',
                    name: 'partyDetail',
                    builder: (context, state) =>
                        PartyDetailPage(partyId: state.pathParameters['id']!),
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: BranchRoutes.employees,
                name: 'employees',
                builder: (context, state) => const EmployeesListPage(),
                routes: [
                  GoRoute(
                    path: ':id',
                    name: 'employeeDetail',
                    builder: (context, state) => EmployeeDetailPage(
                      employeeId: state.pathParameters['id']!,
                    ),
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: BranchRoutes.departments,
                name: 'departments',
                builder: (context, state) => const DepartmentsPage(),
                routes: [
                  GoRoute(
                    path: ':id',
                    name: 'departmentDetail',
                    builder: (context, state) => DepartmentDetailPage(
                      departmentId: state.pathParameters['id']!,
                    ),
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: BranchRoutes.corporateRelationships,
                name: 'corporateRelationships',
                builder: (context, state) => const CorporateRelationshipsPage(),
                routes: [
                  GoRoute(
                    path: ':id',
                    name: 'relationshipDetail',
                    builder: (context, state) => RelationshipDetailPage(
                      relationshipId: state.pathParameters['id']!,
                    ),
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: BranchRoutes.settings,
                name: 'settings',
                builder: (context, state) => const SettingsPage(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
});
