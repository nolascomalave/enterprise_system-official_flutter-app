import 'package:enterprise_app/core/i18n/app_localizations_delegates.dart';

import 'package:enterprise_app/features/parties/domain/entities/party.dart';
import 'package:enterprise_app/features/parties/domain/entities/party_detail.dart';
import 'package:enterprise_app/features/parties/domain/repositories/parties_repository.dart';
import 'package:enterprise_app/features/parties/presentation/widgets/edit_party_dialog.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

void main() {
  Widget harness(WidgetBuilder builder) {
    return MaterialApp(
      locale: const Locale('es'),
      localizationsDelegates: appLocalizationsDelegates,
      supportedLocales: appSupportedLocales,
      theme: ThemeData.dark(useMaterial3: true)
          .copyWith(splashFactory: InkRipple.splashFactory),
      home: Scaffold(
        body: Builder(
          builder: (context) => Center(
            child: ElevatedButton(
              onPressed: () =>
                  showDialog<void>(context: context, builder: builder),
              child: const Text('open'),
            ),
          ),
        ),
      ),
    );
  }

  testWidgets('pre-puebla y envía el payload de organización', (tester) async {
    UpdatePartyParams? sent;

    await tester.pumpWidget(
      harness(
        (context) => EditPartyDialog(
          detail: const PartyDetail(
            id: 'p1',
            displayName: 'Acme Corp',
            partyType: 'ORGANIZATION',
            recordStatus: 'ACTIVE',
            organization: OrganizationInfo(
              legalName: 'Acme S.A.',
              tradeName: 'Acme',
              taxId: 'B123',
            ),
          ),
          onSubmit: (data) async {
            sent = data;
            return null;
          },
        ),
      ),
    );
    await tester.tap(find.text('open'));
    await tester.pumpAndSettle();

    // Pre-poblado.
    expect(
      tester
          .widget<TextFormField>(find.byKey(const Key('edit_display_name')))
          .controller
          ?.text,
      'Acme Corp',
    );
    expect(
      tester
          .widget<TextFormField>(find.byKey(const Key('edit_legal_name')))
          .controller
          ?.text,
      'Acme S.A.',
    );
    expect(
      tester
          .widget<TextFormField>(find.byKey(const Key('edit_tax_id')))
          .controller
          ?.text,
      'B123',
    );
    expect(find.text('Organización'), findsOneWidget);

    // Edición + guardar.
    await tester.enterText(
      find.byKey(const Key('edit_display_name')),
      'Acme Corporation',
    );
    await tester.enterText(find.byKey(const Key('edit_tax_id')), 'B999');
    await tester.tap(find.text('Guardar'));
    await tester.pumpAndSettle();

    expect(sent, isNotNull);
    expect(sent!.displayName, 'Acme Corporation');
    expect(sent!.partyType, PartyType.organization);
    expect(sent!.legalName, 'Acme S.A.');
    expect(sent!.taxId, 'B999');
    expect(sent!.firstName, isNull);
    expect(find.byType(EditPartyDialog), findsNothing);
  });

  testWidgets('pre-puebla los campos de persona para INDIVIDUAL', (
    tester,
  ) async {
    await tester.pumpWidget(
      harness(
        (context) => EditPartyDialog(
          detail: const PartyDetail(
            id: 'p2',
            displayName: 'Juan Pérez',
            partyType: 'INDIVIDUAL',
            recordStatus: 'ACTIVE',
            person: PersonInfo(
              firstName: 'Juan',
              lastName: 'Pérez',
              birthDate: '1990-05-12',
            ),
          ),
          onSubmit: (data) async => null,
        ),
      ),
    );
    await tester.tap(find.text('open'));
    await tester.pumpAndSettle();

    expect(
      tester
          .widget<TextFormField>(find.byKey(const Key('edit_first_name')))
          .controller
          ?.text,
      'Juan',
    );
    expect(
      tester
          .widget<TextFormField>(find.byKey(const Key('edit_last_name')))
          .controller
          ?.text,
      'Pérez',
    );
    expect(
      tester
          .widget<TextFormField>(find.byKey(const Key('edit_birth_date')))
          .controller
          ?.text,
      '1990-05-12',
    );
    expect(find.text('Persona'), findsOneWidget);
    expect(find.byKey(const Key('edit_legal_name')), findsNothing);
  });
}
