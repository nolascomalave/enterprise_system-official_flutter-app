import 'dart:async';

import 'package:enterprise_app/core/network/api_exception.dart';
import 'package:enterprise_app/features/auth/domain/entities/auth_result.dart';
import 'package:enterprise_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:enterprise_app/features/auth/presentation/providers/auth_providers.dart';
import 'package:enterprise_app/features/auth/presentation/providers/login_notifier.dart';
import 'package:enterprise_app/features/auth/presentation/state/login_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

class FakeAuthRepository implements AuthRepository {
  @override
  Future<void> logout() async {}

  final Completer<AuthResult> loginCompleter = Completer<AuthResult>();
  final Completer<AuthSession> verifyCompleter = Completer<AuthSession>();

  String? lastEmail;
  String? lastTenantId;
  String? lastTempToken;
  String? lastCode;
  bool loginCalled = false;

  @override
  Future<AuthResult> login({
    required String email,
    required String password,
    required String tenantId,
  }) {
    loginCalled = true;
    lastEmail = email;
    lastTenantId = tenantId;
    return loginCompleter.future;
  }

  @override
  Future<AuthSession> verifyTwoFactor({
    required String tempToken,
    required String code,
  }) {
    lastTempToken = tempToken;
    lastCode = code;
    return verifyCompleter.future;
  }
}

void main() {
  const session = AuthSession(accessToken: 'token-123', tenantId: 'tenant-uuid');

  late FakeAuthRepository repository;
  late ProviderContainer container;

  setUp(() {
    repository = FakeAuthRepository();
    container = ProviderContainer(
      overrides: [
        authRepositoryProvider.overrideWith((ref) async => repository),
      ],
    );
    addTearDown(container.dispose);
  });

  /// Mantiene vivo el provider (autoDispose) durante el test.
  ProviderSubscription<LoginState> listen() =>
      container.listen(loginProvider, (previous, next) {});

  /// El notifier resuelve el caso de uso de forma asíncrona antes de llamar
  /// al repositorio; esperamos a que la llamada ocurra.
  Future<void> waitUntil(bool Function() predicate) async {
    for (var i = 0; i < 50 && !predicate(); i++) {
      await Future<void>.delayed(Duration.zero);
    }
    expect(predicate(), isTrue, reason: 'La llamada al repositorio no ocurrió');
  }

  group('LoginNotifier.login', () {
    test('pasa por loading y llega a success', () async {
      final sub = listen();
      addTearDown(sub.close);

      final notifier = container.read(loginProvider.notifier);
      final future = notifier.login(
        email: 'ana@acme.com',
        password: 'secret',
        tenantId: 'tenant-uuid',
      );

      expect(container.read(loginProvider), isA<LoginLoading>());

      await waitUntil(() => repository.loginCalled);
      expect(repository.lastEmail, 'ana@acme.com');
      expect(repository.lastTenantId, 'tenant-uuid');

      repository.loginCompleter.complete(const AuthResult.success(session));
      await future;

      final state = container.read(loginProvider);
      expect(state, isA<LoginSuccess>());
      expect((state as LoginSuccess).session.accessToken, 'token-123');
    });

    test('pasa por loading y llega a requiresTwoFactor', () async {
      final sub = listen();
      addTearDown(sub.close);

      final notifier = container.read(loginProvider.notifier);
      final future = notifier.login(
        email: 'ana@acme.com',
        password: 'secret',
        tenantId: 'tenant-uuid',
      );

      expect(container.read(loginProvider), isA<LoginLoading>());

      await waitUntil(() => repository.loginCalled);
      repository.loginCompleter
          .complete(const AuthResult.requiresTwoFactor('temp-abc'));
      await future;

      final state = container.read(loginProvider);
      expect(state, isA<LoginRequiresTwoFactor>());
      expect((state as LoginRequiresTwoFactor).tempToken, 'temp-abc');
    });

    test('llega a error cuando el repositorio lanza ApiException', () async {
      final sub = listen();
      addTearDown(sub.close);

      final notifier = container.read(loginProvider.notifier);
      final future = notifier.login(
        email: 'ana@acme.com',
        password: 'bad',
        tenantId: 'tenant-uuid',
      );

      expect(container.read(loginProvider), isA<LoginLoading>());

      await waitUntil(() => repository.loginCalled);
      repository.loginCompleter.completeError(
        const ApiException('Credenciales inválidas'),
      );
      await future;

      final state = container.read(loginProvider);
      expect(state, isA<LoginError>());
      expect((state as LoginError).message, 'Credenciales inválidas');
    });
  });

  group('LoginNotifier.verifyTwoFactor', () {
    test('usa el temp_token del estado y llega a success', () async {
      final sub = listen();
      addTearDown(sub.close);

      final notifier = container.read(loginProvider.notifier);

      // Primero: login que requiere 2FA.
      final loginFuture = notifier.login(
        email: 'ana@acme.com',
        password: 'secret',
        tenantId: 'tenant-uuid',
      );
      await waitUntil(() => repository.loginCalled);
      repository.loginCompleter
          .complete(const AuthResult.requiresTwoFactor('temp-abc'));
      await loginFuture;
      expect(container.read(loginProvider), isA<LoginRequiresTwoFactor>());

      // Segundo: verificación del código.
      final verifyFuture = notifier.verifyTwoFactor(code: '123456');
      expect(container.read(loginProvider), isA<LoginLoading>());

      await waitUntil(() => repository.lastCode != null);
      expect(repository.lastTempToken, 'temp-abc');
      expect(repository.lastCode, '123456');

      repository.verifyCompleter.complete(session);
      await verifyFuture;

      final state = container.read(loginProvider);
      expect(state, isA<LoginSuccess>());
      expect((state as LoginSuccess).session.accessToken, 'token-123');
    });
  });
}
