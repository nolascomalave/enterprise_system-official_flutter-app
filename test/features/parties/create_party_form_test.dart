import 'package:enterprise_app/features/parties/domain/entities/party.dart';
import 'package:enterprise_app/features/parties/domain/repositories/parties_repository.dart';
import 'package:enterprise_app/features/parties/presentation/widgets/create_party_form.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

void main() {
  Widget buildForm({ValueChanged<CreatePartyParams>? captured}) {
    return MaterialApp(
      theme: ThemeData.dark(useMaterial3: true)
          .copyWith(splashFactory: InkRipple.splashFactory),
      home: Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: CreatePartyForm(
            onSubmit: (params) async {
              captured?.call(params);
              return null;
            },
          ),
        ),
      ),
    );
  }

  testWidgets('muestra campos de persona para INDIVIDUAL', (tester) async {
    await tester.pumpWidget(buildForm());

    expect(find.byKey(const Key('first_name')), findsOneWidget);
    expect(find.byKey(const Key('last_name')), findsOneWidget);
    expect(find.byKey(const Key('legal_name')), findsNothing);
    expect(find.byKey(const Key('tax_id')), findsNothing);
  });

  testWidgets('cambia a campos de organización al seleccionar ORGANIZATION',
      (tester) async {
    await tester.pumpWidget(buildForm());

    await tester.tap(find.byKey(const Key('party-type-organization')));
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('legal_name')), findsOneWidget);
    expect(find.byKey(const Key('tax_id')), findsOneWidget);
    expect(find.byKey(const Key('first_name')), findsNothing);
    expect(find.byKey(const Key('last_name')), findsNothing);

    // Volver a INDIVIDUAL restaura los campos de persona.
    await tester.tap(find.byKey(const Key('party-type-individual')));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('first_name')), findsOneWidget);
    expect(find.byKey(const Key('legal_name')), findsNothing);
  });

  testWidgets('envía los datos correctos según el tipo seleccionado',
      (tester) async {
    CreatePartyParams? captured;
    await tester.pumpWidget(buildForm(captured: (params) => captured = params));

    await tester.tap(find.byKey(const Key('party-type-organization')));
    await tester.pumpAndSettle();

    await tester.enterText(find.byKey(const Key('display_name')), 'Globex');
    await tester.enterText(find.byKey(const Key('legal_name')), 'Globex Industries S.A.');
    await tester.enterText(find.byKey(const Key('tax_id')), 'G87654321');

    await tester.tap(find.text('Guardar'));
    await tester.pumpAndSettle();

    expect(captured, isNotNull);
    expect(captured!.displayName, 'Globex');
    expect(captured!.partyType, PartyType.organization);
    expect(captured!.legalName, 'Globex Industries S.A.');
    expect(captured!.taxId, 'G87654321');
    expect(captured!.firstName, isNull);
  });
}
