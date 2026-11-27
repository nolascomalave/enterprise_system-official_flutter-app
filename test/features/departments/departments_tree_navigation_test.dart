import 'package:enterprise_app/core/i18n/app_localizations_delegates.dart';
import 'package:enterprise_app/features/departments/domain/entities/corporate_group.dart';
import 'package:enterprise_app/features/departments/domain/entities/department.dart';
import 'package:enterprise_app/features/departments/domain/repositories/department_repository.dart';
import 'package:enterprise_app/features/departments/presentation/pages/departments_page.dart';
import 'package:enterprise_app/features/departments/presentation/providers/department_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

class FakeDepartmentRepository implements DepartmentRepository {
  @override
  Future<List<Department>> getDepartments() async => const [
    Department(id: 'd1', name: 'Tecnología', code: 'TECH'),
  ];

  @override
  Future<Department> getDepartmentById(String departmentId) =>
      throw UnimplementedError();

  @override
  Future<List<CorporateGroup>> getDepartmentGroups(String departmentId) =>
      throw UnimplementedError();

  @override
  Future<Department> createDepartment(CreateDepartmentParams params) =>
      throw UnimplementedError();

  @override
  Future<List<CorporateGroup>> getCorporateGroups() async => const [];

  @override
  Future<CorporateGroup> createCorporateGroup({
    required String name,
    String? description,
  }) => throw UnimplementedError();

  @override
  Future<void> assignDepartmentToGroup({
    required String departmentId,
    required String corporateGroupId,
  }) => throw UnimplementedError();
}

void main() {
  testWidgets('al pulsar el nombre en el árbol navega al detalle', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(1200, 900);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    final router = GoRouter(
      initialLocation: '/departments',
      routes: [
        GoRoute(
          path: '/departments',
          builder: (context, state) => const Scaffold(body: DepartmentsPage()),
        ),
        GoRoute(
          path: '/departments/:id',
          builder: (context, state) =>
              Scaffold(body: Text('DEPT:${state.pathParameters['id']}')),
        ),
      ],
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          departmentRepositoryProvider.overrideWith(
            (ref) async => FakeDepartmentRepository(),
          ),
        ],
        child: MaterialApp.router(
          locale: const Locale('es'),
          localizationsDelegates: appLocalizationsDelegates,
          supportedLocales: appSupportedLocales,
          theme: ThemeData.dark(useMaterial3: true)
              .copyWith(splashFactory: InkRipple.splashFactory),
          routerConfig: router,
        ),
      ),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.text('Tecnología'));
    await tester.pumpAndSettle();

    expect(find.text('DEPT:d1'), findsOneWidget);
  });
}
