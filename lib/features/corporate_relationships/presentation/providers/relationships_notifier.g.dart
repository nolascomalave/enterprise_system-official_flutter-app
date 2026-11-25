// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'relationships_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Lista de relaciones corporativas + acciones de la máquina de estados.

@ProviderFor(RelationshipsNotifier)
final relationshipsProvider = RelationshipsNotifierProvider._();

/// Lista de relaciones corporativas + acciones de la máquina de estados.
final class RelationshipsNotifierProvider
    extends
        $AsyncNotifierProvider<
          RelationshipsNotifier,
          List<CorporateRelationship>
        > {
  /// Lista de relaciones corporativas + acciones de la máquina de estados.
  RelationshipsNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'relationshipsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$relationshipsNotifierHash();

  @$internal
  @override
  RelationshipsNotifier create() => RelationshipsNotifier();
}

String _$relationshipsNotifierHash() =>
    r'4419539ee915075e469528a18fa57a6ec6219357';

/// Lista de relaciones corporativas + acciones de la máquina de estados.

abstract class _$RelationshipsNotifier
    extends $AsyncNotifier<List<CorporateRelationship>> {
  FutureOr<List<CorporateRelationship>> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref
            as $Ref<
              AsyncValue<List<CorporateRelationship>>,
              List<CorporateRelationship>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<CorporateRelationship>>,
                List<CorporateRelationship>
              >,
              AsyncValue<List<CorporateRelationship>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
