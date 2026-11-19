// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_apps_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Lista de aplicaciones cliente + creación con refresco.

@ProviderFor(ClientAppsNotifier)
final clientAppsProvider = ClientAppsNotifierProvider._();

/// Lista de aplicaciones cliente + creación con refresco.
final class ClientAppsNotifierProvider
    extends
        $AsyncNotifierProvider<ClientAppsNotifier, List<ClientApplication>> {
  /// Lista de aplicaciones cliente + creación con refresco.
  ClientAppsNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'clientAppsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$clientAppsNotifierHash();

  @$internal
  @override
  ClientAppsNotifier create() => ClientAppsNotifier();
}

String _$clientAppsNotifierHash() =>
    r'3bdfad0ab4e7801f7d3f26630d321f0d43de6085';

/// Lista de aplicaciones cliente + creación con refresco.

abstract class _$ClientAppsNotifier
    extends $AsyncNotifier<List<ClientApplication>> {
  FutureOr<List<ClientApplication>> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref
            as $Ref<
              AsyncValue<List<ClientApplication>>,
              List<ClientApplication>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<ClientApplication>>,
                List<ClientApplication>
              >,
              AsyncValue<List<ClientApplication>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
