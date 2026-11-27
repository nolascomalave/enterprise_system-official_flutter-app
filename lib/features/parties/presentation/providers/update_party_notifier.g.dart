// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_party_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Acción de actualización de Party; refresca detalle y lista.

@ProviderFor(UpdatePartyNotifier)
final updatePartyProvider = UpdatePartyNotifierProvider._();

/// Acción de actualización de Party; refresca detalle y lista.
final class UpdatePartyNotifierProvider
    extends $AsyncNotifierProvider<UpdatePartyNotifier, void> {
  /// Acción de actualización de Party; refresca detalle y lista.
  UpdatePartyNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'updatePartyProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$updatePartyNotifierHash();

  @$internal
  @override
  UpdatePartyNotifier create() => UpdatePartyNotifier();
}

String _$updatePartyNotifierHash() =>
    r'30e431584dfe409ffe5bea1e78d764d2640849e0';

/// Acción de actualización de Party; refresca detalle y lista.

abstract class _$UpdatePartyNotifier extends $AsyncNotifier<void> {
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
