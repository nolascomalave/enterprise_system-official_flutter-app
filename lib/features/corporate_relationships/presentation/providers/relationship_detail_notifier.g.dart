// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'relationship_detail_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Detalle de una relación corporativa.
///
/// El backend aún no expone `GET /tenant-relationships/{id}`: se filtra el
/// listado en memoria reutilizando [relationshipsProvider].

@ProviderFor(RelationshipDetailNotifier)
final relationshipDetailProvider = RelationshipDetailNotifierFamily._();

/// Detalle de una relación corporativa.
///
/// El backend aún no expone `GET /tenant-relationships/{id}`: se filtra el
/// listado en memoria reutilizando [relationshipsProvider].
final class RelationshipDetailNotifierProvider
    extends
        $AsyncNotifierProvider<
          RelationshipDetailNotifier,
          CorporateRelationship
        > {
  /// Detalle de una relación corporativa.
  ///
  /// El backend aún no expone `GET /tenant-relationships/{id}`: se filtra el
  /// listado en memoria reutilizando [relationshipsProvider].
  RelationshipDetailNotifierProvider._({
    required RelationshipDetailNotifierFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'relationshipDetailProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$relationshipDetailNotifierHash();

  @override
  String toString() {
    return r'relationshipDetailProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  RelationshipDetailNotifier create() => RelationshipDetailNotifier();

  @override
  bool operator ==(Object other) {
    return other is RelationshipDetailNotifierProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$relationshipDetailNotifierHash() =>
    r'ba8e3d1176e6f356eafdfaf5c64b8758681e16c1';

/// Detalle de una relación corporativa.
///
/// El backend aún no expone `GET /tenant-relationships/{id}`: se filtra el
/// listado en memoria reutilizando [relationshipsProvider].

final class RelationshipDetailNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          RelationshipDetailNotifier,
          AsyncValue<CorporateRelationship>,
          CorporateRelationship,
          FutureOr<CorporateRelationship>,
          String
        > {
  RelationshipDetailNotifierFamily._()
    : super(
        retry: null,
        name: r'relationshipDetailProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Detalle de una relación corporativa.
  ///
  /// El backend aún no expone `GET /tenant-relationships/{id}`: se filtra el
  /// listado en memoria reutilizando [relationshipsProvider].

  RelationshipDetailNotifierProvider call(String relationshipId) =>
      RelationshipDetailNotifierProvider._(
        argument: relationshipId,
        from: this,
      );

  @override
  String toString() => r'relationshipDetailProvider';
}

/// Detalle de una relación corporativa.
///
/// El backend aún no expone `GET /tenant-relationships/{id}`: se filtra el
/// listado en memoria reutilizando [relationshipsProvider].

abstract class _$RelationshipDetailNotifier
    extends $AsyncNotifier<CorporateRelationship> {
  late final _$args = ref.$arg as String;
  String get relationshipId => _$args;

  FutureOr<CorporateRelationship> build(String relationshipId);
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref
            as $Ref<AsyncValue<CorporateRelationship>, CorporateRelationship>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<CorporateRelationship>,
                CorporateRelationship
              >,
              AsyncValue<CorporateRelationship>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, () => build(_$args));
  }
}
