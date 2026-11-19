// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Orquesta el flujo de login (credenciales → posible 2FA → sesión).

@ProviderFor(LoginNotifier)
final loginProvider = LoginNotifierProvider._();

/// Orquesta el flujo de login (credenciales → posible 2FA → sesión).
final class LoginNotifierProvider
    extends $NotifierProvider<LoginNotifier, LoginState> {
  /// Orquesta el flujo de login (credenciales → posible 2FA → sesión).
  LoginNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'loginProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$loginNotifierHash();

  @$internal
  @override
  LoginNotifier create() => LoginNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LoginState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LoginState>(value),
    );
  }
}

String _$loginNotifierHash() => r'fe1a7975fcee3b2aaaf9bb854bdec0ae2c08ca7e';

/// Orquesta el flujo de login (credenciales → posible 2FA → sesión).

abstract class _$LoginNotifier extends $Notifier<LoginState> {
  LoginState build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<LoginState, LoginState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<LoginState, LoginState>,
              LoginState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
