// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logout_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Cierra la sesión y limpia los datos de usuario en memoria.

@ProviderFor(LogoutNotifier)
final logoutProvider = LogoutNotifierProvider._();

/// Cierra la sesión y limpia los datos de usuario en memoria.
final class LogoutNotifierProvider
    extends $AsyncNotifierProvider<LogoutNotifier, void> {
  /// Cierra la sesión y limpia los datos de usuario en memoria.
  LogoutNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'logoutProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$logoutNotifierHash();

  @$internal
  @override
  LogoutNotifier create() => LogoutNotifier();
}

String _$logoutNotifierHash() => r'3776421aa9d0d3a4bca79ad57bf140d2aa085dc8';

/// Cierra la sesión y limpia los datos de usuario en memoria.

abstract class _$LogoutNotifier extends $AsyncNotifier<void> {
  FutureOr<void> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<void>, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<void>, void>,
              AsyncValue<void>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
