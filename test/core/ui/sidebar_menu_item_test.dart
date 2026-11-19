import 'package:enterprise_app/core/menu/models/menu_tree.dart';
import 'package:enterprise_app/core/ui/sidebar_menu_item.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

void main() {
  const node = MenuNode(
    id: 'party',
    code: 'party',
    name: 'Party',
    children: [
      MenuNode(
        id: 'parties',
        code: 'parties',
        name: 'Listado',
        options: [
          MenuOption(
            id: 'parties-all',
            code: 'parties-all',
            name: 'Parties',
            route: '/parties',
          ),
        ],
      ),
    ],
  );

  Widget buildWidget({ValueChanged<String>? onSelected}) {
    return MaterialApp(
      theme: ThemeData.dark(useMaterial3: true).copyWith(splashFactory: InkRipple.splashFactory),
      home: Scaffold(
        body: SidebarMenuItem(
          node: node,
          currentPath: '/dashboard',
          onOptionSelected: onSelected ?? (_) {},
        ),
      ),
    );
  }

  AnimatedCrossFade crossFadeAt(WidgetTester tester, int index) =>
      tester.widget<AnimatedCrossFade>(
        find.byType(AnimatedCrossFade).at(index),
      );

  testWidgets('renderiza el hijo al expandir el nodo', (tester) async {
    await tester.pumpWidget(buildWidget());

    // Nodo "Party" colapsado inicialmente.
    expect(crossFadeAt(tester, 0).crossFadeState, CrossFadeState.showSecond);

    await tester.tap(find.text('Party'));
    await tester.pumpAndSettle();

    expect(crossFadeAt(tester, 0).crossFadeState, CrossFadeState.showFirst);
    expect(find.text('Listado'), findsOneWidget);

    // El segundo nivel también se puede expandir.
    await tester.tap(find.text('Listado'));
    await tester.pumpAndSettle();
    expect(crossFadeAt(tester, 1).crossFadeState, CrossFadeState.showFirst);

    // Al pulsar una opción hoja se emite la ruta.
    await tester.tap(find.text('Parties'));
    await tester.pumpAndSettle();
  });

  testWidgets('emite la ruta de la opción seleccionada', (tester) async {
    String? selectedRoute;
    await tester.pumpWidget(buildWidget(onSelected: (route) => selectedRoute = route));

    await tester.tap(find.text('Party'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Listado'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Parties'));
    await tester.pumpAndSettle();

    expect(selectedRoute, '/parties');
  });
}
