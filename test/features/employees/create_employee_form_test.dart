import 'package:enterprise_app/features/employees/domain/entities/employee.dart';
import 'package:enterprise_app/features/employees/domain/repositories/employees_repository.dart';
import 'package:enterprise_app/features/employees/presentation/widgets/create_employee_form.dart';
import 'package:enterprise_app/features/parties/domain/entities/party.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

void main() {
  const parties = [
    Party(
      id: 'p1',
      displayName: 'Juan Pérez',
      partyType: PartyType.individual,
      firstName: 'Juan',
      lastName: 'Pérez',
    ),
    Party(
      id: 'p2',
      displayName: 'María García',
      partyType: PartyType.individual,
    ),
  ];
  const jobs = [
    Job(id: 'j1', title: 'Ingeniero'),
    Job(id: 'j2', title: 'Analista'),
  ];
  const departments = [
    Department(id: 'd1', name: 'Tecnología'),
    Department(id: 'd2', name: 'Ventas'),
  ];

  Widget buildForm({ValueChanged<CreateEmployeeParams>? captured}) {
    return MaterialApp(
      theme: ThemeData.dark(useMaterial3: true)
          .copyWith(splashFactory: InkRipple.splashFactory),
      home: Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: CreateEmployeeForm(
            parties: parties,
            jobs: jobs,
            departments: departments,
            onSubmit: (params) async {
              captured?.call(params);
              return null;
            },
          ),
        ),
      ),
    );
  }

  testWidgets('los dropdowns muestran las opciones cargadas', (tester) async {
    await tester.pumpWidget(buildForm());

    // Party
    await tester.tap(find.byKey(const Key('employee_party')));
    await tester.pumpAndSettle();
    expect(find.text('Juan Pérez'), findsWidgets);
    expect(find.text('María García'), findsWidgets);
    await tester.tap(find.text('Juan Pérez').last);
    await tester.pumpAndSettle();

    // Puesto
    await tester.tap(find.byKey(const Key('employee_job')));
    await tester.pumpAndSettle();
    expect(find.text('Ingeniero'), findsWidgets);
    await tester.tap(find.text('Ingeniero').last);
    await tester.pumpAndSettle();

    // Departamento
    await tester.tap(find.byKey(const Key('employee_department')));
    await tester.pumpAndSettle();
    expect(find.text('Tecnología'), findsWidgets);
    await tester.tap(find.text('Tecnología').last);
    await tester.pumpAndSettle();

    // Campos de fecha y código visibles.
    expect(find.byKey(const Key('hire_date')), findsOneWidget);
    expect(find.byKey(const Key('employee_code')), findsOneWidget);
    expect(find.byKey(const Key('employee_status')), findsOneWidget);
  });

  testWidgets('el guardar envía los datos correctos', (tester) async {
    CreateEmployeeParams? captured;
    await tester.pumpWidget(buildForm(captured: (params) => captured = params));

    await tester.tap(find.byKey(const Key('employee_party')));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Juan Pérez').last);
    await tester.pumpAndSettle();

    await tester.enterText(find.byKey(const Key('employee_code')), 'EMP-0100');

    await tester.tap(find.byKey(const Key('employee_job')));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Ingeniero').last);
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key('employee_department')));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Tecnología').last);
    await tester.pumpAndSettle();

    // Date picker nativo.
    await tester.tap(find.byKey(const Key('hire_date')));
    await tester.pumpAndSettle();
    await tester.tap(find.text('15').first);
    await tester.pumpAndSettle();
    await tester.tap(find.text('OK'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Guardar'));
    await tester.pumpAndSettle();

    expect(captured, isNotNull);
    expect(captured!.partyId, 'p1');
    expect(captured!.employeeCode, 'EMP-0100');
    expect(captured!.jobId, 'j1');
    expect(captured!.departmentId, 'd1');
    expect(captured!.status, EmployeeStatus.active);
    expect(
      RegExp(r'^\d{4}-\d{2}-\d{2}$').hasMatch(captured!.hireDate),
      isTrue,
      reason: 'hire_date debe tener formato YYYY-MM-DD (${captured!.hireDate})',
    );
    expect(captured!.hireDate.endsWith('-15'), isTrue);
  });
}
