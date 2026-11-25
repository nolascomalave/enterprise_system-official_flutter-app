// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'party_detail_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Detalle de una party por ID (family).

@ProviderFor(PartyDetailNotifier)
final partyDetailProvider = PartyDetailNotifierFamily._();

/// Detalle de una party por ID (family).
final class PartyDetailNotifierProvider
    extends $AsyncNotifierProvider<PartyDetailNotifier, PartyDetail> {
  /// Detalle de una party por ID (family).
  PartyDetailNotifierProvider._({
    required PartyDetailNotifierFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'partyDetailProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$partyDetailNotifierHash();

  @override
  String toString() {
    return r'partyDetailProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  PartyDetailNotifier create() => PartyDetailNotifier();

  @override
  bool operator ==(Object other) {
    return other is PartyDetailNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$partyDetailNotifierHash() =>
    r'46b6e0ccdacca036a2e7e30ffcdeb1be0e064753';

/// Detalle de una party por ID (family).

final class PartyDetailNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          PartyDetailNotifier,
          AsyncValue<PartyDetail>,
          PartyDetail,
          FutureOr<PartyDetail>,
          String
        > {
  PartyDetailNotifierFamily._()
    : super(
        retry: null,
        name: r'partyDetailProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Detalle de una party por ID (family).

  PartyDetailNotifierProvider call(String partyId) =>
      PartyDetailNotifierProvider._(argument: partyId, from: this);

  @override
  String toString() => r'partyDetailProvider';
}

/// Detalle de una party por ID (family).

abstract class _$PartyDetailNotifier extends $AsyncNotifier<PartyDetail> {
  late final _$args = ref.$arg as String;
  String get partyId => _$args;

  FutureOr<PartyDetail> build(String partyId);
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<PartyDetail>, PartyDetail>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<PartyDetail>, PartyDetail>,
              AsyncValue<PartyDetail>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, () => build(_$args));
  }
}
