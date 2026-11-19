// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Carga el árbol de menú RBAC del usuario autenticado.

@ProviderFor(MenuNotifier)
final menuProvider = MenuNotifierProvider._();

/// Carga el árbol de menú RBAC del usuario autenticado.
final class MenuNotifierProvider
    extends $AsyncNotifierProvider<MenuNotifier, List<MenuNode>> {
  /// Carga el árbol de menú RBAC del usuario autenticado.
  MenuNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'menuProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$menuNotifierHash();

  @$internal
  @override
  MenuNotifier create() => MenuNotifier();
}

String _$menuNotifierHash() => r'0f39b6bc1c8a1ed3193734acc44209b697f08fc1';

/// Carga el árbol de menú RBAC del usuario autenticado.

abstract class _$MenuNotifier extends $AsyncNotifier<List<MenuNode>> {
  FutureOr<List<MenuNode>> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<MenuNode>>, List<MenuNode>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<MenuNode>>, List<MenuNode>>,
              AsyncValue<List<MenuNode>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
