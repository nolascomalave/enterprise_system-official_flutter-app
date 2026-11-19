// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'corporate_groups_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CorporateGroupsNotifier)
final corporateGroupsProvider = CorporateGroupsNotifierProvider._();

final class CorporateGroupsNotifierProvider
    extends
        $AsyncNotifierProvider<CorporateGroupsNotifier, List<CorporateGroup>> {
  CorporateGroupsNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'corporateGroupsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$corporateGroupsNotifierHash();

  @$internal
  @override
  CorporateGroupsNotifier create() => CorporateGroupsNotifier();
}

String _$corporateGroupsNotifierHash() =>
    r'f4d3b23d08f7f0dc7cb46672e3224d9c33026cba';

abstract class _$CorporateGroupsNotifier
    extends $AsyncNotifier<List<CorporateGroup>> {
  FutureOr<List<CorporateGroup>> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref
            as $Ref<AsyncValue<List<CorporateGroup>>, List<CorporateGroup>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<CorporateGroup>>,
                List<CorporateGroup>
              >,
              AsyncValue<List<CorporateGroup>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
