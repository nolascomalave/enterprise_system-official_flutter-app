import 'package:material_ui/material_ui.dart';

import '../i18n/l10n_ext.dart';
import '../menu/models/menu_tree.dart';
import 'sidebar_menu_item.dart';

/// Sidebar de escritorio V5 Premium (260px expandido / 72px colapsado).
class AppSidebar extends StatefulWidget {
  const AppSidebar({
    super.key,
    required this.menu,
    required this.currentPath,
    required this.collapsed,
    required this.onToggle,
    required this.onOptionSelected,
    this.loading = false,
    this.hasError = false,
    this.onRetry,
  });

  final List<MenuNode> menu;
  final String currentPath;
  final bool collapsed;
  final VoidCallback onToggle;
  final ValueChanged<String> onOptionSelected;
  final bool loading;
  final bool hasError;
  final VoidCallback? onRetry;

  @override
  State<AppSidebar> createState() => _AppSidebarState();
}

class _AppSidebarState extends State<AppSidebar> {
  final _searchController = TextEditingController();
  String _query = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<MenuNode> get _filteredMenu => _filterNodes(widget.menu, _query);

  static List<MenuNode> _filterNodes(List<MenuNode> nodes, String query) {
    final q = query.trim().toLowerCase();
    if (q.isEmpty) return nodes;

    List<MenuNode> filter(List<MenuNode> list) {
      final result = <MenuNode>[];
      for (final node in list) {
        final children = filter(node.children);
        final options = node.options
            .where((option) => option.name.toLowerCase().contains(q))
            .toList();
        final selfMatch = node.name.toLowerCase().contains(q);
        if (selfMatch || children.isNotEmpty || options.isNotEmpty) {
          result.add(
            node.copyWith(
              children: children,
              options: selfMatch ? node.options : options,
            ),
          );
        }
      }
      return result;
    }

    return filter(nodes);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final borderColor = theme.colorScheme.outline;

    final background = isDark ? const Color(0xFF09090B) : Colors.white;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          width: widget.collapsed ? 72 : 260,
          decoration: BoxDecoration(
            color: background,
            border: Border(right: BorderSide(color: borderColor)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _Header(collapsed: widget.collapsed, isDark: isDark),
              if (!widget.collapsed) _buildSearch(isDark, borderColor),
              if (widget.loading) const LinearProgressIndicator(minHeight: 2),
              if (widget.hasError && !widget.collapsed) _buildError(isDark),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 8,
                  ),
                  children: [
                    for (final node in _filteredMenu)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 2),
                        child: SidebarMenuItem(
                          node: node,
                          currentPath: widget.currentPath,
                          onOptionSelected: widget.onOptionSelected,
                          collapsed: widget.collapsed,
                        ),
                      ),
                  ],
                ),
              ),
              _Footer(collapsed: widget.collapsed, isDark: isDark),
            ],
          ),
        ),
        Positioned(
          right: -12,
          top: 32,
          child: _CollapseButton(
            collapsed: widget.collapsed,
            onTap: widget.onToggle,
          ),
        ),
      ],
    );
  }

  Widget _buildSearch(bool isDark, Color borderColor) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 4),
      child: TextField(
        controller: _searchController,
        onChanged: (value) => setState(() => _query = value),
        style: TextStyle(
          fontSize: 13,
          color: isDark ? const Color(0xFFFAFAFA) : const Color(0xFF09090B),
        ),
        decoration: InputDecoration(
          isDense: true,
          hintText: context.l10n.searchMenu,
          hintStyle: const TextStyle(fontSize: 13, color: Color(0xFF71717A)),
          prefixIcon: const Icon(
            Icons.search_rounded,
            size: 17,
            color: Color(0xFF71717A),
          ),
          prefixIconConstraints: const BoxConstraints(minWidth: 36),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 8,
          ),
          fillColor: isDark ? const Color(0xFF18181B) : const Color(0xFFF4F4F5),
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(9),
            borderSide: BorderSide(color: borderColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(9),
            borderSide: BorderSide(color: borderColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(9),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildError(bool isDark) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 0, 12, 8),
      child: Row(
        children: [
          const Icon(
            Icons.wifi_off_rounded,
            size: 14,
            color: Color(0xFFF59E0B),
          ),
          const SizedBox(width: 6),
          Expanded(
            child: Text(
              context.l10n.menuOffline,
              style: TextStyle(
                fontSize: 11,
                color: isDark
                    ? const Color(0xFFA1A1AA)
                    : const Color(0xFF71717A),
              ),
            ),
          ),
          IconButton(
            tooltip: context.l10n.retry,
            onPressed: widget.onRetry,
            icon: const Icon(Icons.refresh_rounded, size: 15),
            visualDensity: VisualDensity.compact,
          ),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({required this.collapsed, required this.isDark});

  final bool collapsed;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 32,
            height: 32,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9),
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF6366F1), Color(0xFF9333EA)],
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF6366F1).withValues(alpha: 0.25),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: const Icon(
              Icons.apartment_rounded,
              color: Colors.white,
              size: 17,
            ),
          ),
          if (!collapsed) ...[
            const SizedBox(width: 10),
            Text(
              'Enterprise App',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                letterSpacing: -0.3,
                color: isDark
                    ? const Color(0xFFFAFAFA)
                    : const Color(0xFF09090B),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _Footer extends StatelessWidget {
  const _Footer({required this.collapsed, required this.isDark});

  final bool collapsed;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Theme.of(context).colorScheme.outline),
        ),
      ),
      child: Row(
        mainAxisAlignment: collapsed
            ? MainAxisAlignment.center
            : MainAxisAlignment.start,
        children: [
          Container(
            width: 32,
            height: 32,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF6366F1), Color(0xFF9333EA)],
              ),
              border: Border.all(
                color: const Color(0xFF6366F1).withValues(alpha: 0.3),
                width: 1.5,
              ),
            ),
            child: const Text(
              'AG',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
          if (!collapsed) ...[
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ana García',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 12.5,
                      fontWeight: FontWeight.w600,
                      color: isDark
                          ? const Color(0xFFFAFAFA)
                          : const Color(0xFF09090B),
                    ),
                  ),
                  const Text(
                    'Acme Corporation',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 10.5, color: Color(0xFF71717A)),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _CollapseButton extends StatelessWidget {
  const _CollapseButton({required this.collapsed, required this.onTap});

  final bool collapsed;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Tooltip(
      message: collapsed ? context.l10n.expandMenu : context.l10n.collapseMenu,
      child: Material(
        color: isDark ? const Color(0xFF18181B) : Colors.white,
        shape: CircleBorder(
          side: BorderSide(color: Theme.of(context).colorScheme.outline),
        ),
        child: InkWell(
          customBorder: const CircleBorder(),
          onTap: onTap,
          child: SizedBox(
            width: 24,
            height: 24,
            child: Icon(
              collapsed
                  ? Icons.chevron_right_rounded
                  : Icons.chevron_left_rounded,
              size: 16,
              color: isDark ? const Color(0xFFA1A1AA) : const Color(0xFF52525B),
            ),
          ),
        ),
      ),
    );
  }
}
