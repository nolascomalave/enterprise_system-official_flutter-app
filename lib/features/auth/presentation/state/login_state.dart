import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/auth_result.dart';

part 'login_state.freezed.dart';

/// Estados del flujo de autenticación.
@freezed
sealed class LoginState with _$LoginState {
  const factory LoginState.initial() = LoginInitial;

  const factory LoginState.loading() = LoginLoading;

  const factory LoginState.success(AuthSession session) = LoginSuccess;

  const factory LoginState.requiresTwoFactor(String tempToken) =
      LoginRequiresTwoFactor;

  const factory LoginState.error(String message) = LoginError;
}
