import 'package:enterprise_app/features/client_apps/domain/entities/client_application.dart';
import 'package:enterprise_app/features/client_apps/presentation/widgets/create_client_app_dialog.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

void main() {
  testWidgets('muestra el client_secret una única vez al crear', (tester) async {
    List<String>? sentScopes;

    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData.dark(useMaterial3: true)
            .copyWith(splashFactory: InkRipple.splashFactory),
        home: Scaffold(
          body: Builder(
            builder: (context) => Center(
              child: ElevatedButton(
                onPressed: () => showDialog<void>(
                  context: context,
                  builder: (dialogContext) => CreateClientAppDialog(
                    onCreate: (name, scopes) async {
                      sentScopes = scopes;
                      return ClientApplication(
                        id: 'app-1',
                        name: name,
                        clientId: 'cid-abc',
                        scopes: scopes,
                        isActive: true,
                        clientSecret: 'super-secret-xyz',
                      );
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

    await tester.enterText(find.byKey(const Key('app_name')), 'Portal');
    await tester.enterText(
      find.byKey(const Key('app_scopes')),
      'parties:read, parties:write',
    );
    await tester.tap(find.text('Crear'));
    await tester.pumpAndSettle();

    // Scopes parseados por comas.
    expect(sentScopes, ['parties:read', 'parties:write']);

    // Aviso + secreto visible una única vez.
    expect(find.text('Solo se mostrará una vez'), findsOneWidget);
    expect(find.text('super-secret-xyz'), findsOneWidget);
    expect(find.textContaining('Copia el client secret'), findsOneWidget);

    // Cerrar el modal.
    await tester.tap(find.byKey(const Key('app_close')));
    await tester.pumpAndSettle();
    expect(find.byType(CreateClientAppDialog), findsNothing);
  });
}
