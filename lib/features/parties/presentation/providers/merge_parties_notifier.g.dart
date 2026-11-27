// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'merge_parties_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Acción de fusión (Golden Record) + refresco de la lista de parties.

@ProviderFor(MergePartiesNotifier)
final mergePartiesProvider = MergePartiesNotifierProvider._();

/// Acción de fusión (Golden Record) + refresco de la lista de parties.
final class MergePartiesNotifierProvider
    extends $AsyncNotifierProvider<MergePartiesNotifier, MergePartiesResult?> {
  /// Acción de fusión (Golden Record) + refresco de la lista de parties.
  MergePartiesNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mergePartiesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$mergePartiesNotifierHash();

  @$internal
  @override
  MergePartiesNotifier create() => MergePartiesNotifier();
}

String _$mergePartiesNotifierHash() =>
    r'73b209e31d59a8a62d25b0abae7769f49d2ff0cd';

/// Acción de fusión (Golden Record) + refresco de la lista de parties.

abstract class _$MergePartiesNotifier
    extends $AsyncNotifier<MergePartiesResult?> {
  FutureOr<MergePartiesResult?> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<MergePartiesResult?>, MergePartiesResult?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<MergePartiesResult?>, MergePartiesResult?>,
              AsyncValue<MergePartiesResult?>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
