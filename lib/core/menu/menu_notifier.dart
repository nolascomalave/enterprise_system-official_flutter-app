import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'menu_providers.dart';
import 'models/menu_tree.dart';

part 'menu_notifier.g.dart';

/// Carga el árbol de menú RBAC del usuario autenticado.
@riverpod
class MenuNotifier extends _$MenuNotifier {
  @override
  Future<List<MenuNode>> build() async {
    final repository = await ref.watch(menuRepositoryProvider.future);
    final appClientId = ref.watch(appClientIdProvider);
    return repository.fetchMyMenu(appClientId: appClientId);
  }

  /// Recarga el menú (p. ej. tras cambiar de tenant o rol).
  Future<void> reload() async {
    ref.invalidateSelf();
    await future;
  }
}
