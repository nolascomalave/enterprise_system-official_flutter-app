import 'package:material_ui/material_ui.dart';

import '../menu/models/menu_tree.dart';
import 'menu_icons.dart';

/// Ítem recursivo del menú RBAC (V5 Premium).
///
/// - Nodo con hijos: expandible (AnimatedCrossFade + chevron animado).
/// - Colapsado: solo icono; si tiene hijos abre un `PopupMenuButton` flotante.
/// - Activo: fondo indigo translúcido + indicador vertical izquierdo.
class SidebarMenuItem extends StatefulWidget {
  const SidebarMenuItem({
    super.key,
    required this.node,
    required this.currentPath,
    required this.onOptionSelected,
    this.collapsed = false,
    this.level = 0,
  });

  final MenuNode node;
  final String currentPath;
  final ValueChanged<String> onOptionSelected;
  final bool collapsed;
  final int level;

  @override
  State<SidebarMenuItem> createState() => _SidebarMenuItemState();
}

class _SidebarMenuItemState extends State<SidebarMenuItem> {
  late bool _expanded;

  bool get _hasContent =>
      widget.node.children.isNotEmpty || widget.node.options.isNotEmpty;

  bool get _isActive => nodeContainsPath(widget.node, widget.currentPath);

  @override
  void initState() {
    super.initState();
    _expanded = _isActive;
  }

  @override
  void didUpdateWidget(covariant SidebarMenuItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (_isActive && !_expanded) {
      _expanded = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final primary = theme.colorScheme.primary;

    if (widget.collapsed) {
      return _buildCollapsed(theme, isDark, primary);
    }
    return _buildExpanded(theme, isDark, primary);
  }

  Widget _buildCollapsed(ThemeData theme, bool isDark, Color primary) {
    final icon = menuIconForCode(widget.node.code);
    final active = _isActive;

    final iconWidget = Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: active ? primary.withValues(alpha: 0.10) : Colors.transparent,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Icon(
        icon,
        size: 20,
        color: active
            ? primary
            : (isDark ? const Color(0xFFA1A1AA) : const Color(0xFF52525B)),
      ),
    );

    if (!_hasContent) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 2),
        child: Center(
          child: Tooltip(message: widget.node.name, child: iconWidget),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Center(
        child: PopupMenuButton<String>(
          tooltip: widget.node.name,
          offset: const Offset(52, 0),
          onSelected: widget.onOptionSelected,
          itemBuilder: (context) {
            final options = flattenOptions(widget.node);
            return [
              PopupMenuItem<String>(
                enabled: false,
                child: Text(
                  widget.node.name.toUpperCase(),
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.4,
                    color: Color(0xFF71717A),
                  ),
                ),
              ),
              for (final option in options)
                PopupMenuItem<String>(
                  value: option.route,
                  child: Text(
                    option.name,
                    style: const TextStyle(fontSize: 13),
                  ),
                ),
            ];
          },
          child: iconWidget,
        ),
      ),
    );
  }

  Widget _buildExpanded(ThemeData theme, bool isDark, Color primary) {
    final indent = 12.0 + widget.level * 12.0;
    final activeText = isDark
        ? const Color(0xFFFAFAFA)
        : const Color(0xFF09090B);
    final idleText = isDark ? const Color(0xFFA1A1AA) : const Color(0xFF52525B);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: indent - 8,
            right: 4,
            top: 1,
            bottom: 1,
          ),
          child: Material(
            color: _isActive
                ? primary.withValues(alpha: 0.10)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
            child: InkWell(
              borderRadius: BorderRadius.circular(8),
              onTap: _hasContent
                  ? () => setState(() => _expanded = !_expanded)
                  : null,
              hoverColor: isDark
                  ? Colors.white.withValues(alpha: 0.04)
                  : Colors.black.withValues(alpha: 0.04),
              child: Stack(
                children: [
                  if (_isActive)
                    Positioned(
                      left: 0,
                      top: 8,
                      bottom: 8,
                      child: Container(
                        width: 3,
                        decoration: BoxDecoration(
                          color: primary,
                          borderRadius: const BorderRadius.horizontal(
                            right: Radius.circular(8),
                          ),
                        ),
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 8,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          menuIconForCode(widget.node.code),
                          size: widget.level == 0 ? 18 : 16,
                          color: _isActive ? primary : idleText,
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            widget.node.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 13.5,
                              fontWeight: _isActive
                                  ? FontWeight.w600
                                  : FontWeight.w500,
                              color: _isActive ? activeText : idleText,
                              letterSpacing: -0.1,
                            ),
                          ),
                        ),
                        if (_hasContent)
                          AnimatedRotation(
                            turns: _expanded ? 0.25 : 0,
                            duration: const Duration(milliseconds: 200),
                            child: Icon(
                              Icons.chevron_right_rounded,
                              size: 16,
                              color: idleText.withValues(alpha: 0.8),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        AnimatedCrossFade(
          duration: const Duration(milliseconds: 200),
          crossFadeState: _expanded
              ? CrossFadeState.showFirst
              : CrossFadeState.showSecond,
          firstChild: _buildChildren(primary),
          secondChild: const SizedBox(width: double.infinity),
        ),
      ],
    );
  }

  Widget _buildChildren(Color primary) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (final option in widget.node.options)
          _OptionTile(
            option: option,
            currentPath: widget.currentPath,
            onSelected: widget.onOptionSelected,
            level: widget.level + 1,
          ),
        for (final child in widget.node.children)
          SidebarMenuItem(
            node: child,
            currentPath: widget.currentPath,
            onOptionSelected: widget.onOptionSelected,
            level: widget.level + 1,
          ),
      ],
    );
  }
}

class _OptionTile extends StatelessWidget {
  const _OptionTile({
    required this.option,
    required this.currentPath,
    required this.onSelected,
    required this.level,
  });

  final MenuOption option;
  final String currentPath;
  final ValueChanged<String> onSelected;
  final int level;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final primary = theme.colorScheme.primary;
    final isActive = option.route == currentPath;
    final indent = 12.0 + level * 12.0;
    final idleText = isDark ? const Color(0xFFA1A1AA) : const Color(0xFF52525B);
    final activeText = isDark
        ? const Color(0xFFFAFAFA)
        : const Color(0xFF09090B);

    return Padding(
      padding: EdgeInsets.only(left: indent - 8, right: 4, top: 1, bottom: 1),
      child: Material(
        color: isActive ? primary.withValues(alpha: 0.10) : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: () => onSelected(option.route),
          hoverColor: isDark
              ? Colors.white.withValues(alpha: 0.04)
              : Colors.black.withValues(alpha: 0.04),
          child: Stack(
            children: [
              if (isActive)
                Positioned(
                  left: 0,
                  top: 8,
                  bottom: 8,
                  child: Container(
                    width: 3,
                    decoration: BoxDecoration(
                      color: primary,
                      borderRadius: const BorderRadius.horizontal(
                        right: Radius.circular(8),
                      ),
                    ),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 7,
                ),
                child: Row(
                  children: [
                    Icon(
                      menuIconForCode(
                        option.icon.isNotEmpty ? option.icon : option.code,
                      ),
                      size: 15,
                      color: isActive
                          ? primary
                          : idleText.withValues(alpha: 0.9),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        option.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: isActive
                              ? FontWeight.w600
                              : FontWeight.w400,
                          color: isActive ? activeText : idleText,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
