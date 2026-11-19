import 'package:dio/dio.dart';
import 'package:enterprise_app/features/settings/data/repositories/settings_repository_impl.dart';
import 'package:enterprise_app/features/settings/domain/entities/security_settings.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/mock_dio.dart';

void main() {
  late MockAdapter adapter;

  Dio buildDio() => Dio(BaseOptions(baseUrl: 'http://test.local/api/v1'))
    ..httpClientAdapter = adapter;

  group('updateMfaPreferences', () {
    test('desactiva con otp_code y sin method', () async {
      adapter = MockAdapter((options, body) async {
        expect(options.path, '/auth/mfa-preferences');
        expect(options.method, 'PUT');
        return ResponseBody.fromString('', 204);
      });

      final repository = SettingsRepositoryImpl(buildDio());
      await repository.updateMfaPreferences(enabled: false, otpCode: '123456');

      final sent = adapter.lastBody!;
      expect(sent, contains('"enabled":false'));
      expect(sent, contains('"otp_code":"123456"'));
      expect(sent, isNot(contains('"method"')));
    });

    test('activa EMAIL_OTP con method y otp_code', () async {
      adapter = MockAdapter((options, body) async {
        expect(options.path, '/auth/mfa-preferences');
        expect(options.method, 'PUT');
        return ResponseBody.fromString('', 204);
      });

      final repository = SettingsRepositoryImpl(buildDio());
      await repository.updateMfaPreferences(
        enabled: true,
        method: MfaMethod.emailOtp,
        otpCode: '654321',
      );

      final sent = adapter.lastBody!;
      expect(sent, contains('"enabled":true'));
      expect(sent, contains('"method":"EMAIL_OTP"'));
      expect(sent, contains('"otp_code":"654321"'));
    });
  });

  test('setupTotp parsea otpauth_url y secret', () async {
    adapter = MockAdapter((options, body) async {
      expect(options.path, '/auth/totp/setup');
      expect(options.method, 'POST');
      return jsonResponse({
        'data': {
          'otpauth_url': 'otpauth://totp/Enterprise:ana?secret=ABC123',
          'secret': 'ABC123',
        },
      });
    });

    final repository = SettingsRepositoryImpl(buildDio());
    final setup = await repository.setupTotp();

    expect(setup.secret, 'ABC123');
    expect(setup.otpauthUrl, startsWith('otpauth://totp/'));
  });

  test('verifyTotp envía el código y devuelve los backup codes', () async {
    adapter = MockAdapter((options, body) async {
      expect(options.path, '/auth/totp/verify');
      expect(options.method, 'POST');
      return jsonResponse({
        'data': {
          'backup_codes': [
            'AAAA-1111',
            'BBBB-2222',
            'CCCC-3333',
            'DDDD-4444',
            'EEEE-5555',
            'FFFF-6666',
            'GGGG-7777',
            'HHHH-8888',
          ],
        },
      });
    });

    final repository = SettingsRepositoryImpl(buildDio());
    final codes = await repository.verifyTotp(code: '123456');

    expect(codes, hasLength(8));
    expect(codes.first, 'AAAA-1111');
    expect(adapter.lastBody, contains('"code":"123456"'));
  });

  test('requestOtp envía la acción DISABLE_MFA', () async {
    adapter = MockAdapter((options, body) async {
      expect(options.path, '/auth/request-otp');
      expect(options.method, 'POST');
      return ResponseBody.fromString('{}', 202);
    });

    final repository = SettingsRepositoryImpl(buildDio());
    await repository.requestOtp(action: MfaAction.disableMfa);

    expect(adapter.lastBody, contains('"action":"DISABLE_MFA"'));
  });
}
