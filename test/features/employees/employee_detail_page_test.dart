import 'package:enterprise_app/core/i18n/app_localizations_delegates.dart';
import 'package:enterprise_app/features/employees/domain/entities/employee.dart';
import 'package:enterprise_app/features/employees/domain/errors/employee_not_found_exception.dart';
import 'package:enterprise_app/features/employees/domain/repositories/employees_repository.dart';
import 'package:enterprise_app/features/employees/presentation/pages/employee_detail_page.dart';
import 'package:enterprise_app/features/employees/presentation/providers/employees_providers.dart';
import 'package:enterprise_app/features/parties/domain/entities/merge_parties_result.dart';
import 'package:enterprise_app/features/parties/domain/entities/party.dart';
import 'package:enterprise_app/features/parties/domain/entities/party_detail.dart';
import 'package:enterprise_app/features/parties/domain/repositories/parties_repository.dart';
import 'package:enterprise_app/features/parties/presentation/providers/parties_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

class FakeEmployeesRepository implements EmployeesRepository {
  @override
  Future<List<Employee>> getEmployees() async => const [
    Employee(
      partyId: 'p1',
      employeeCode: 'EMP-0001',
      jobId: 'j1',
      departmentId: 'd1',
      hireDate: '2026-01-15',
      managerPartyId: 'p2',
    ),
  ];

  @override
  Future<Employee> getEmployeeById(String employeeId) async =>
      (await getEmployees()).firstWhere(
        (employee) => employee.id == employeeId,
      );

  @override
  Future<Employee> createEmployee(CreateEmployeeParams params) =>
      throw UnimplementedError();
}

class NotFoundEmployeesRepository implements EmployeesRepository {
  @override
  Future<List<Employee>> getEmployees() => throw UnimplementedError();

  @override
  Future<Employee> getEmployeeById(String employeeId) =>
      throw EmployeeNotFoundException(employeeId);

  @override
  Future<Employee> createEmployee(CreateEmployeeParams params) =>
      throw UnimplementedError();
}

class FakePartiesRepository implements PartiesRepository {
  @override
  Future<List<Party>> getParties() async => const [
    Party(id: 'p1', displayName: 'Juan Pérez', partyType: PartyType.individual),
    Party(id: 'p2', displayName: 'Ana Torres', partyType: PartyType.individual),
  ];

  @override
  Future<PartyDetail> getPartyById(String partyId) async => PartyDetail(
    id: partyId,
    displayName: 'Juan Pérez',
    partyType: 'INDIVIDUAL',
    recordStatus: 'ACTIVE',
    contacts: const [
      PartyContact(type: 'EMAIL', value: 'juan@acme.com', isPrimary: true),
    ],
  );

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

Widget buildPage({EmployeesRepository? employeesRepository}) {
  return ProviderScope(
    overrides: [
      employeesRepositoryProvider.overrideWith(
        (ref) async => employeesRepository ?? FakeEmployeesRepository(),
      ),
      partiesRepositoryProvider.overrideWith(
        (ref) async => FakePartiesRepository(),
      ),
      orgStructureRepositoryProvider.overrideWith(
        (ref) async => FakeOrgStructureRepository(),
      ),
    ],
    child: MaterialApp(
      locale: const Locale('es'),
      localizationsDelegates: appLocalizationsDelegates,
      supportedLocales: appSupportedLocales,
      theme: ThemeData.dark(useMaterial3: true)
          .copyWith(splashFactory: InkRipple.splashFactory),
      home: const EmployeeDetailPage(employeeId: 'p1'),
    ),
  );
}

void main() {
  testWidgets('renderiza la información del empleado y sus catálogos', (
    tester,
  ) async {
    await tester.pumpWidget(buildPage());
    await tester.pumpAndSettle();

    expect(find.text('Juan Pérez'), findsOneWidget);
    expect(find.text('EMP-0001'), findsOneWidget);
    expect(find.text('Activo'), findsOneWidget);
    expect(find.text('Ingeniero'), findsOneWidget);
    expect(find.text('Tecnología'), findsOneWidget);
    expect(find.text('2026-01-15'), findsOneWidget);
    expect(find.text('Ana Torres'), findsOneWidget);
  });

  testWidgets('muestra un mensaje específico si el empleado no existe', (
    tester,
  ) async {
    await tester.pumpWidget(
      buildPage(employeesRepository: NotFoundEmployeesRepository()),
    );
    await tester.pumpAndSettle();

    expect(find.text('Empleado no encontrado'), findsOneWidget);
  });

  testWidgets('muestra contactos de la Party e historial no disponible', (
    tester,
  ) async {
    await tester.pumpWidget(buildPage());
    await tester.pumpAndSettle();

    await tester.tap(find.text('Contactos'));
    await tester.pumpAndSettle();
    expect(find.text('juan@acme.com'), findsOneWidget);

    await tester.tap(find.text('Historial de asignaciones'));
    await tester.pumpAndSettle();
    expect(
      find.text('El backend aún no expone el historial de asignaciones.'),
      findsOneWidget,
    );
  });
}
