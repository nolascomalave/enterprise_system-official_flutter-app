import 'package:enterprise_app/core/i18n/app_localizations_delegates.dart';

import 'package:enterprise_app/features/corporate_relationships/presentation/widgets/relationship_dialogs.dart';
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

  testWidgets('el modal de consumo envía el token y se cierra', (tester) async {
    String? submitted;

    await tester.pumpWidget(
      harness(
        (context) => ConsumeTokenDialog(
          onSubmit: (token) async {
            submitted = token;
            return null;
          },
        ),
      ),
    );
    await tester.tap(find.text('open'));
    await tester.pumpAndSettle();

    await tester.enterText(find.byKey(const Key('consume_token')), 'tok-abc');
    await tester.tap(find.text('Consumir'));
    await tester.pumpAndSettle();

    expect(submitted, 'tok-abc');
    expect(find.byType(ConsumeTokenDialog), findsNothing);
  });

  testWidgets('muestra el error inline si el token es inválido', (
    tester,
  ) async {
    await tester.pumpWidget(
      harness(
        (context) =>
            ConsumeTokenDialog(onSubmit: (token) async => 'Token inválido'),
      ),
    );
    await tester.tap(find.text('open'));
    await tester.pumpAndSettle();

    await tester.enterText(find.byKey(const Key('consume_token')), 'bad');
    await tester.tap(find.text('Consumir'));
    await tester.pumpAndSettle();

    expect(find.text('Token inválido'), findsOneWidget);
    expect(find.byType(ConsumeTokenDialog), findsOneWidget);
  });
}
