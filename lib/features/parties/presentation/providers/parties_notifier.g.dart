// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parties_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Lista de parties + creación (refresca al crear).

@ProviderFor(PartiesNotifier)
final partiesProvider = PartiesNotifierProvider._();

/// Lista de parties + creación (refresca al crear).
final class PartiesNotifierProvider
    extends $AsyncNotifierProvider<PartiesNotifier, List<Party>> {
  /// Lista de parties + creación (refresca al crear).
  PartiesNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'partiesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$partiesNotifierHash();

  @$internal
  @override
  PartiesNotifier create() => PartiesNotifier();
}

String _$partiesNotifierHash() => r'96bf731b8d915bbf070f8ec3970985510f503cd0';

/// Lista de parties + creación (refresca al crear).

abstract class _$PartiesNotifier extends $AsyncNotifier<List<Party>> {
  FutureOr<List<Party>> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<Party>>, List<Party>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Party>>, List<Party>>,
              AsyncValue<List<Party>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
