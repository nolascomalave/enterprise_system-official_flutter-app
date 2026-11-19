import 'package:enterprise_app/features/departments/domain/entities/department.dart';
import 'package:enterprise_app/features/departments/presentation/widgets/department_tree_node.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

void main() {
  const tree = DepartmentNode(
    department: Department(
      id: 'd1',
      name: 'Tecnología',
      code: 'TECH',
      unitType: DepartmentUnitType.division,
    ),
    children: [
      DepartmentNode(
        department: Department(
          id: 'd2',
          name: 'Frontend',
          code: 'FE',
          unitType: DepartmentUnitType.department,
          parentDepartmentId: 'd1',
        ),
        children: [
          DepartmentNode(
            department: Department(
              id: 'd3',
              name: 'UI Platform',
              code: 'UI',
              unitType: DepartmentUnitType.office,
              parentDepartmentId: 'd2',
            ),
          ),
        ],
      ),
    ],
  );

  Widget buildWidget({ValueChanged<Department>? onCreateChild}) {
    return MaterialApp(
      theme: ThemeData.dark(useMaterial3: true)
          .copyWith(splashFactory: InkRipple.splashFactory),
      home: Scaffold(
        body: ListView(
          children: [
            DepartmentTreeNode(
              node: tree,
              onCreateChild: onCreateChild ?? (_) {},
            ),
          ],
        ),
      ),
    );
  }

  testWidgets('ExpansionTile renderiza correctamente los hijos anidados',
      (tester) async {
    await tester.pumpWidget(buildWidget());

    // Nivel 1 (colapsado): los hijos aún no se construyen.
    expect(find.text('Tecnología'), findsOneWidget);
    expect(find.text('Frontend'), findsNothing);

    // Expande Tecnología → aparece Frontend.
    await tester.tap(find.text('Tecnología'));
    await tester.pumpAndSettle();
    expect(find.text('Frontend'), findsOneWidget);
    expect(find.text('UI Platform'), findsNothing);

    // Expande Frontend → aparece el nieto.
    await tester.tap(find.text('Frontend'));
    await tester.pumpAndSettle();
    expect(find.text('UI Platform'), findsOneWidget);

    // Badges de tipo de unidad.
    expect(find.text('División'), findsOneWidget);
    expect(find.text('Oficina'), findsOneWidget);
  });

  testWidgets('el botón + crea un sub-departamento del nodo correcto',
      (tester) async {
    Department? parent;
    await tester.pumpWidget(
      buildWidget(onCreateChild: (department) => parent = department),
    );

    await tester.tap(find.byKey(const ValueKey('add-child-d1')));
    await tester.pumpAndSettle();

    expect(parent?.id, 'd1');
  });
}
