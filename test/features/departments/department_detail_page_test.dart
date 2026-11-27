import 'package:enterprise_app/core/i18n/app_localizations_delegates.dart';
import 'package:enterprise_app/features/departments/domain/entities/corporate_group.dart';
import 'package:enterprise_app/features/departments/domain/entities/department.dart';
import 'package:enterprise_app/features/departments/domain/repositories/department_repository.dart';
import 'package:enterprise_app/features/departments/presentation/pages/department_detail_page.dart';
import 'package:enterprise_app/features/departments/presentation/providers/department_providers.dart';
import 'package:enterprise_app/features/employees/domain/entities/employee.dart'
    hide Department;
import 'package:enterprise_app/features/employees/domain/repositories/employees_repository.dart';
import 'package:enterprise_app/features/employees/presentation/providers/employees_providers.dart';
import 'package:enterprise_app/features/parties/domain/entities/merge_parties_result.dart';
import 'package:enterprise_app/features/parties/domain/entities/party.dart';
import 'package:enterprise_app/features/parties/domain/entities/party_detail.dart';
import 'package:enterprise_app/features/parties/domain/repositories/parties_repository.dart';
import 'package:enterprise_app/features/parties/presentation/providers/parties_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

class FakeDepartmentRepository implements DepartmentRepository {
  @override
  Future<List<Department>> getDepartments() async => const [
    Department(
      id: 'd1',
      name: 'Tecnología',
      code: 'TECH',
      unitType: DepartmentUnitType.division,
      managerPartyId: 'm1',
      createdAt: '2024-03-01T10:00:00Z',
    ),
    Department(
      id: 'd2',
      name: 'Ventas',
      code: 'SALES',
      parentDepartmentId: 'd1',
    ),
  ];

  @override
  Future<Department> getDepartmentById(String departmentId) async =>
      (await getDepartments()).firstWhere(
        (department) => department.id == departmentId,
      );

  @override
  Future<List<CorporateGroup>> getDepartmentGroups(String departmentId) async =>
      const [CorporateGroup(id: 'g1', name: 'Grupo Uno')];

  @override
  Future<Department> createDepartment(CreateDepartmentParams params) =>
      throw UnimplementedError();

  @override
  Future<List<CorporateGroup>> getCorporateGroups() async => const [
    CorporateGroup(id: 'g1', name: 'Grupo Uno'),
  ];

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

class FakeEmployeesRepository implements EmployeesRepository {
  @override
  Future<List<Employee>> getEmployees() async => const [
    Employee(
      partyId: 'e1',
      employeeCode: 'EMP-0001',
      jobId: 'j1',
      departmentId: 'd1',
      hireDate: '2026-01-15',
    ),
  ];

  @override
  Future<Employee> getEmployeeById(String employeeId) =>
      throw UnimplementedError();

  @override
  Future<Employee> createEmployee(CreateEmployeeParams params) =>
      throw UnimplementedError();
}

class FakePartiesRepository implements PartiesRepository {
  @override
  Future<List<Party>> getParties() async => const [
    Party(id: 'm1', displayName: 'Ana Torres', partyType: PartyType.individual),
    Party(id: 'e1', displayName: 'Juan Pérez', partyType: PartyType.individual),
  ];

  @override
  Future<PartyDetail> getPartyById(String partyId) =>
      throw UnimplementedError();

  @override
  Future<Party> createParty(CreatePartyParams params) =>
      throw UnimplementedError();

  @override
  Future<void> updateParty(String partyId, UpdatePartyParams params) =>
      throw UnimplementedError();

  @override
  Future<MergePartiesResult> mergeParties({
    required String sourcePartyId,
    required String targetPartyId,
  }) => throw UnimplementedError();
}

Widget buildApp() {
  final router = GoRouter(
    initialLocation: '/departments/d1',
    routes: [
      GoRoute(
        path: '/departments/:id',
        builder: (context, state) =>
            DepartmentDetailPage(departmentId: state.pathParameters['id']!),
      ),
      GoRoute(
        path: '/employees/:id',
        builder: (context, state) =>
            Scaffold(body: Text('EMPLOYEE:${state.pathParameters['id']}')),
      ),
    ],
  );

  return ProviderScope(
    overrides: [
      departmentRepositoryProvider.overrideWith(
        (ref) async => FakeDepartmentRepository(),
      ),
      employeesRepositoryProvider.overrideWith(
        (ref) async => FakeEmployeesRepository(),
      ),
      partiesRepositoryProvider.overrideWith(
        (ref) async => FakePartiesRepository(),
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
  );
}

void main() {
  testWidgets('renderiza general, grupos y las tres pestañas', (tester) async {
    await tester.pumpWidget(buildApp());
    await tester.pumpAndSettle();

    expect(find.text('Tecnología'), findsOneWidget);
    expect(find.text('TECH'), findsOneWidget);
    expect(find.text('División'), findsOneWidget);
    expect(find.text('Ana Torres'), findsOneWidget);
    expect(find.text('2024-03-01'), findsOneWidget);
    expect(find.text('Grupo Uno'), findsOneWidget);

    expect(find.text('General'), findsOneWidget);
    expect(find.text('Sub-departamentos'), findsOneWidget);
    expect(find.text('Empleados'), findsOneWidget);
  });

  testWidgets('lista los sub-departamentos y navega recursivamente', (
    tester,
  ) async {
    await tester.pumpWidget(buildApp());
    await tester.pumpAndSettle();

    await tester.tap(find.text('Sub-departamentos'));
    await tester.pumpAndSettle();

    expect(find.text('Ventas'), findsOneWidget);
    await tester.tap(find.byKey(const Key('department_child_d2')));
    await tester.pumpAndSettle();

    expect(find.text('Ventas'), findsOneWidget);
    expect(find.text('SALES'), findsOneWidget);
  });

  testWidgets('lista los empleados y navega a su detalle', (tester) async {
    await tester.pumpWidget(buildApp());
    await tester.pumpAndSettle();

    await tester.tap(find.text('Empleados'));
    await tester.pumpAndSettle();

    expect(find.text('Juan Pérez'), findsOneWidget);
    await tester.tap(find.byKey(const Key('department_employee_e1')));
    await tester.pumpAndSettle();

    expect(find.text('EMPLOYEE:e1'), findsOneWidget);
  });
}
