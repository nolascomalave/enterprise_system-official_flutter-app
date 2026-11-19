// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preferences_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Carga las preferencias al iniciar sesión y las persiste en el backend.

@ProviderFor(PreferencesNotifier)
final preferencesProvider = PreferencesNotifierProvider._();

/// Carga las preferencias al iniciar sesión y las persiste en el backend.
final class PreferencesNotifierProvider
    extends $AsyncNotifierProvider<PreferencesNotifier, UserPreferences> {
  /// Carga las preferencias al iniciar sesión y las persiste en el backend.
  PreferencesNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'preferencesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$preferencesNotifierHash();

  @$internal
  @override
  PreferencesNotifier create() => PreferencesNotifier();
}

String _$preferencesNotifierHash() =>
    r'2fcf7e2b90ef4e533b0c62c626ea1ceecfd2aaa9';

/// Carga las preferencias al iniciar sesión y las persiste en el backend.

abstract class _$PreferencesNotifier extends $AsyncNotifier<UserPreferences> {
  FutureOr<UserPreferences> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<UserPreferences>, UserPreferences>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<UserPreferences>, UserPreferences>,
              AsyncValue<UserPreferences>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
