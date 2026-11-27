import 'package:enterprise_app/core/i18n/app_localizations_delegates.dart';

import 'package:enterprise_app/features/settings/domain/entities/security_settings.dart';
import 'package:enterprise_app/features/settings/presentation/widgets/security_dialogs.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:qr_flutter/qr_flutter.dart';

void main() {
  Widget harness(WidgetBuilder dialogBuilder) {
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
                  showDialog<void>(context: context, builder: dialogBuilder),
              child: const Text('open'),
            ),
          ),
        ),
      ),
    );
  }

  testWidgets('el modal TOTP renderiza el QR y muestra backup codes', (
    tester,
  ) async {
    const setup = TotpSetup(
      otpauthUrl: 'otpauth://totp/Enterprise:ana?secret=ABC123',
      secret: 'ABC123',
    );
    const backupCodes = [
      'AAAA-1111',
      'BBBB-2222',
      'CCCC-3333',
      'DDDD-4444',
      'EEEE-5555',
      'FFFF-6666',
      'GGGG-7777',
      'HHHH-8888',
    ];

    await tester.pumpWidget(
      harness(
        (context) => TotpSetupDialog(
          setup: setup,
          onVerify: (code) async {
            expect(code, '123456');
            return backupCodes;
          },
        ),
      ),
    );
    await tester.tap(find.text('open'));
    await tester.pumpAndSettle();

    // QR + secret manual.
    expect(find.byType(QrImageView), findsOneWidget);
    expect(find.text('ABC123'), findsOneWidget);

    // Verificación → backup codes.
    await tester.ensureVisible(find.byKey(const Key('totp_code')));
    await tester.enterText(find.byKey(const Key('totp_code')), '123456');
    await tester.ensureVisible(find.text('Verificar'));
    await tester.tap(find.text('Verificar'));
    await tester.pumpAndSettle();

    expect(find.text('2FA activado'), findsOneWidget);
    for (final code in backupCodes) {
      expect(find.text(code), findsOneWidget);
    }

    // Cerrar requiere confirmación.
    final closeButton = tester.widget<FilledButton>(
      find.byKey(const Key('totp_close')),
    );
    expect(closeButton.onPressed, isNull);

    await tester.ensureVisible(find.byKey(const Key('backup_ack')));
    await tester.tap(find.byKey(const Key('backup_ack')));
    await tester.pumpAndSettle();
    await tester.ensureVisible(find.byKey(const Key('totp_close')));
    await tester.tap(find.byKey(const Key('totp_close')));
    await tester.pumpAndSettle();
    expect(find.byType(TotpSetupDialog), findsNothing);
  });

  testWidgets('el flujo de desactivación pide OTP y lo envía', (tester) async {
    var requested = false;
    String? submittedCode;

    await tester.pumpWidget(
      harness(
        (context) => OtpStepUpDialog(
          title: 'Desactivar 2FA',
          description: 'Introduce el código enviado a tu contacto.',
          requestOtp: () async => requested = true,
          onConfirm: (code) async => submittedCode = code,
        ),
      ),
    );
    await tester.tap(find.text('open'));
    await tester.pumpAndSettle();

    expect(requested, isTrue);
    expect(find.text('Desactivar 2FA'), findsOneWidget);

    await tester.enterText(find.byKey(const Key('otp_code')), '987654');
    await tester.tap(find.byKey(const Key('otp_confirm')));
    await tester.pumpAndSettle();

    expect(submittedCode, '987654');
    expect(find.byType(OtpStepUpDialog), findsNothing);
  });
}
