import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu_tree.freezed.dart';
part 'menu_tree.g.dart';

/// Nodo del árbol de menú RBAC (`GET /rbac/my-menu`).
@freezed
abstract class MenuNode with _$MenuNode {
  const factory MenuNode({
    required String id,
    required String code,
    required String name,
    @JsonKey(name: 'sort_order') @Default(0) int sortOrder,
    @Default(<MenuNode>[]) List<MenuNode> children,
    @Default(<MenuOption>[]) List<MenuOption> options,
  }) = _MenuNode;

  factory MenuNode.fromJson(Map<String, dynamic> json) =>
      _$MenuNodeFromJson(json);
}

/// Opción hoja del menú RBAC (ruta navegable).
@freezed
abstract class MenuOption with _$MenuOption {
  const factory MenuOption({
    required String id,
    required String code,
    required String name,
    @Default('') String icon,
    @Default('') String route,
    @JsonKey(name: 'sort_order') @Default(0) int sortOrder,
  }) = _MenuOption;

  factory MenuOption.fromJson(Map<String, dynamic> json) =>
      _$MenuOptionFromJson(json);
}

/// Ordena recursivamente nodos y opciones por `sort_order`.
List<MenuNode> sortMenuNodes(List<MenuNode> nodes) {
  final sorted = [...nodes]..sort((a, b) => a.sortOrder.compareTo(b.sortOrder));
  return [
    for (final node in sorted)
      node.copyWith(
        children: sortMenuNodes(node.children),
        options: [...node.options]
          ..sort((a, b) => a.sortOrder.compareTo(b.sortOrder)),
      ),
  ];
}

/// ¿La ruta [path] corresponde a alguna opción del subárbol?
bool nodeContainsPath(MenuNode node, String path) {
  if (path.isEmpty) return false;
  if (node.options.any((option) => option.route == path)) return true;
  return node.children.any((child) => nodeContainsPath(child, path));
}

/// Todas las opciones hoja del subárbol (para el popover colapsado).
List<MenuOption> flattenOptions(MenuNode node) {
  return [
    ...node.options,
    for (final child in node.children) ...flattenOptions(child),
  ];
}
