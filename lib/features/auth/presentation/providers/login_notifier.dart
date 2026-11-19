import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/network/api_exception.dart';
import '../../domain/entities/auth_result.dart';
import '../state/login_state.dart';
import 'auth_providers.dart';

part 'login_notifier.g.dart';

/// Orquesta el flujo de login (credenciales → posible 2FA → sesión).
@riverpod
class LoginNotifier extends _$LoginNotifier {
  @override
  LoginState build() => const LoginState.initial();

  Future<void> login({
    required String email,
    required String password,
    required String tenantId,
  }) async {
    if (state is LoginLoading) return;
    state = const LoginState.loading();

    try {
      final useCase = await ref.read(loginUseCaseProvider.future);
      final result = await useCase(
        email: email,
        password: password,
        tenantId: tenantId,
      );

      state = switch (result) {
        AuthSuccess(:final session) => LoginState.success(session),
        AuthRequiresTwoFactor(:final tempToken) =>
          LoginState.requiresTwoFactor(tempToken),
      };
    } on ApiException catch (error) {
      state = LoginState.error(error.message);
    } catch (_) {
      state = const LoginState.error(
        'No se pudo iniciar sesión. Inténtalo de nuevo.',
      );
    }
  }

  /// Completa el segundo factor con el `temp_token` guardado en el estado.
  Future<void> verifyTwoFactor({required String code}) async {
    final tempToken = switch (state) {
      LoginRequiresTwoFactor(:final tempToken) => tempToken,
      _ => null,
    };

    if (tempToken == null || tempToken.isEmpty) {
      state = const LoginState.error(
        'La verificación expiró. Vuelve a iniciar sesión.',
      );
      return;
    }

    state = const LoginState.loading();

    try {
      final useCase = await ref.read(verifyTwoFactorUseCaseProvider.future);
      final session = await useCase(tempToken: tempToken, code: code);
      state = LoginState.success(session);
    } on ApiException catch (error) {
      state = LoginState.error(error.message);
    } catch (_) {
      state = const LoginState.error(
        'No se pudo verificar el código. Inténtalo de nuevo.',
      );
    }
  }

  void reset() => state = const LoginState.initial();
}
