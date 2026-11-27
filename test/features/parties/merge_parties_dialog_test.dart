import 'package:enterprise_app/core/i18n/app_localizations_delegates.dart';

import 'package:enterprise_app/features/parties/domain/entities/party.dart';
import 'package:enterprise_app/features/parties/presentation/widgets/merge_parties_dialog.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

void main() {
  const parties = [
    Party(
      id: 'p1',
      displayName: 'Acme Corp',
      partyType: PartyType.organization,
    ),
    Party(id: 'p2', displayName: 'Juan Pérez', partyType: PartyType.individual),
    Party(
      id: 'p3',
      displayName: 'MergedCo',
      partyType: PartyType.organization,
      recordStatus: 'MERGED',
      canonicalPartyId: 'p1',
    ),
  ];

  testWidgets('envía los IDs correctos al confirmar la fusión', (tester) async {
    String? sentSource;
    String? sentTarget;

    await tester.pumpWidget(
      MaterialApp(
        locale: const Locale('es'),
        localizationsDelegates: appLocalizationsDelegates,
        supportedLocales: appSupportedLocales,
        theme: ThemeData.dark(useMaterial3: true)
            .copyWith(splashFactory: InkRipple.splashFactory),
        home: Scaffold(
          body: Builder(
            builder: (context) => Center(
              child: ElevatedButton(
                onPressed: () => showDialog<void>(
                  context: context,
                  builder: (dialogContext) => MergePartiesDialog(
                    parties: parties,
                    onSubmit: (sourceId, targetId) async {
                      sentSource = sourceId;
                      sentTarget = targetId;
                      return null;
                    },
                  ),
                ),
                child: const Text('open'),
              ),
            ),
          ),
        ),
      ),
    );

    await tester.tap(find.text('open'));
    await tester.pumpAndSettle();

    // Aviso de irreversibilidad.
    expect(find.textContaining('irreversible'), findsOneWidget);

    // Target: Acme Corp.
    await tester.tap(find.byKey(const Key('merge_target')));
    await tester.pumpAndSettle();
    // Las parties fusionadas no se ofrecen.
    expect(find.text('MergedCo'), findsNothing);
    await tester.tap(find.text('Acme Corp').last);
    await tester.pumpAndSettle();

    // Source: Juan Pérez.
    await tester.tap(find.byKey(const Key('merge_source')));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Juan Pérez').last);
    await tester.pumpAndSettle();

    await tester.tap(find.text('Fusionar'));
    await tester.pumpAndSettle();

    expect(sentSource, 'p2');
    expect(sentTarget, 'p1');
    expect(find.byType(MergePartiesDialog), findsNothing);
  });
}
