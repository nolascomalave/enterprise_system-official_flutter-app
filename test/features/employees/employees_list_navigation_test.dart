import 'package:enterprise_app/core/i18n/app_localizations_delegates.dart';
import 'package:enterprise_app/features/employees/domain/entities/employee.dart';
import 'package:enterprise_app/features/employees/domain/repositories/employees_repository.dart';
import 'package:enterprise_app/features/employees/presentation/pages/employees_list_page.dart';
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

class FakeEmployeesRepository implements EmployeesRepository {
  static const employee = Employee(
    partyId: 'p1',
    employeeCode: 'EMP-0001',
    jobId: 'j1',
    departmentId: 'd1',
    hireDate: '2026-01-15',
  );

  @override
  Future<List<Employee>> getEmployees() async => const [employee];

  @override
  Future<Employee> getEmployeeById(String employeeId) async => employee;

  @override
  Future<Employee> createEmployee(CreateEmployeeParams params) =>
      throw UnimplementedError();
}

class FakePartiesRepository implements PartiesRepository {
  @override
  Future<List<Party>> getParties() async => const [
    Party(id: 'p1', displayName: 'Juan Pérez', partyType: PartyType.individual),
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

class FakeOrgStructureRepository implements OrgStructureRepository {
  @override
  Future<List<Job>> getJobs() async => const [
    Job(id: 'j1', title: 'Ingeniero'),
  ];

  @override
  Future<List<Department>> getDepartments() async => const [
    Department(id: 'd1', name: 'Tecnología'),
  ];
}

Widget buildApp() {
  final router = GoRouter(
    initialLocation: '/employees',
    routes: [
      GoRoute(
        path: '/employees',
        builder: (context, state) => const Scaffold(body: EmployeesListPage()),
        routes: [
          GoRoute(
            path: ':id',
            builder: (context, state) =>
                Scaffold(body: Text('DETAIL:${state.pathParameters['id']}')),
          ),
        ],
      ),
    ],
  );

  return ProviderScope(
    overrides: [
      employeesRepositoryProvider.overrideWith(
        (ref) async => FakeEmployeesRepository(),
      ),
      partiesRepositoryProvider.overrideWith(
        (ref) async => FakePartiesRepository(),
      ),
      orgStructureRepositoryProvider.overrideWith(
        (ref) async => FakeOrgStructureRepository(),
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
  testWidgets('al pulsar una fila navega a /employees/:id', (tester) async {
    tester.view.physicalSize = const Size(1200, 900);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(buildApp());
    await tester.pumpAndSettle();

    expect(find.text('Juan Pérez'), findsOneWidget);

    await tester.tap(find.byKey(const Key('employee_row_p1')));
    await tester.pumpAndSettle();

    expect(find.text('DETAIL:p1'), findsOneWidget);
  });
}
