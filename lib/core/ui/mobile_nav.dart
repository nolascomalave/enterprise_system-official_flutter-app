import 'dart:ui';

import 'package:material_ui/material_ui.dart';

import '../menu/models/menu_tree.dart';
import '../theme/app_colors.dart';
import 'sidebar_menu_item.dart';

/// Bottom nav flotante (píldora) para móvil.
class MobileBottomNav extends StatelessWidget {
  const MobileBottomNav({
    super.key,
    required this.currentIndex,
    required this.onBranchSelected,
    required this.onMenuTap,
  });

  final int currentIndex;
  final ValueChanged<int> onBranchSelected;
  final VoidCallback onMenuTap;

  static const _items = [
    (icon: Icons.space_dashboard_outlined, label: 'Inicio'),
    (icon: Icons.groups_2_outlined, label: 'Party'),
    (icon: Icons.badge_outlined, label: 'Equipo'),
    (icon: Icons.business_outlined, label: 'Áreas'),
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primary = Theme.of(context).colorScheme.primary;

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 420),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(999),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
            child: Container(
              height: 64,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: isDark
                    ? const Color(0xFF121212).withValues(alpha: 0.9)
                    : Colors.white.withValues(alpha: 0.92),
                borderRadius: BorderRadius.circular(999),
                border: Border.all(
                  color: isDark
                      ? Colors.white.withValues(alpha: 0.1)
                      : Colors.black.withValues(alpha: 0.06),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: isDark ? 0.55 : 0.12),
                    blurRadius: 30,
                    offset: const Offset(0, 12),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  for (var i = 0; i < _items.length; i++)
                    _NavItem(
                      icon: _items[i].icon,
                      label: _items[i].label,
                      active: currentIndex == i,
                      onTap: () => onBranchSelected(i),
                      isDark: isDark,
                      primary: primary,
                    ),
                  _NavItem(
                    icon: Icons.menu_rounded,
                    label: 'Menú',
                    active: false,
                    onTap: onMenuTap,
                    isDark: isDark,
                    primary: primary,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.icon,
    required this.label,
    required this.active,
    required this.onTap,
    required this.isDark,
    required this.primary,
  });

  final IconData icon;
  final String label;
  final bool active;
  final VoidCallback onTap;
  final bool isDark;
  final Color primary;

  @override
  Widget build(BuildContext context) {
    final idle = isDark ? const Color(0xFFA1A1AA) : const Color(0xFF71717A);
    return InkWell(
      borderRadius: BorderRadius.circular(999),
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(horizontal: active ? 14 : 10, vertical: 8),
        decoration: BoxDecoration(
          color: active ? primary.withValues(alpha: 0.10) : Colors.transparent,
          borderRadius: BorderRadius.circular(999),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 20, color: active ? primary : idle),
            const SizedBox(height: 2),
            Text(
              label,
              style: TextStyle(
                fontSize: 9.5,
                fontWeight: FontWeight.w500,
                color: active ? primary : idle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Bottom sheet con el árbol de menú completo (móvil).
Future<void> showMobileMenuSheet(
  BuildContext context, {
  required List<MenuNode> menu,
  required String currentPath,
  required ValueChanged<String> onOptionSelected,
}) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      final isDark = Theme.of(context).brightness == Brightness.dark;
      return Container(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.sizeOf(context).height * 0.78,
        ),
        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF121212) : Colors.white,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
          border: Border(
            top: BorderSide(
              color: isDark
                  ? Colors.white.withValues(alpha: 0.1)
                  : Colors.black.withValues(alpha: 0.06),
            ),
          ),
        ),
        child: SafeArea(
          top: false,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 12),
              Container(
                width: 48,
                height: 4,
                decoration: BoxDecoration(
                  color: isDark ? const Color(0xFF3F3F46) : const Color(0xFFD4D4D8),
                  borderRadius: BorderRadius.circular(999),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 16, 12, 8),
                child: Row(
                  children: [
                    Text(
                      'Menú',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        letterSpacing: -0.3,
                        color: isDark ? const Color(0xFFFAFAFA) : const Color(0xFF09090B),
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      tooltip: 'Cerrar',
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.close_rounded, size: 20),
                    ),
                  ],
                ),
              ),
              Flexible(
                child: ListView(
                  padding: const EdgeInsets.fromLTRB(8, 0, 8, 24),
                  children: [
                    for (final node in menu)
                      SidebarMenuItem(
                        node: node,
                        currentPath: currentPath,
                        onOptionSelected: (route) {
                          Navigator.of(context).pop();
                          onOptionSelected(route);
                        },
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

/// FAB "Ask AI" con gradiente y resplandor.
class AskAiButton extends StatelessWidget {
  const AskAiButton({super.key, this.onTap});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(999),
        onTap: onTap ??
            () => ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Ask AI — próximamente')),
                ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(999),
            gradient: const LinearGradient(
              colors: [AppColors.indigo, AppColors.violet],
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.indigo.withValues(alpha: 0.4),
                blurRadius: 20,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(Icons.auto_awesome_rounded, size: 18, color: Colors.white),
              SizedBox(width: 8),
              Text(
                'Ask AI',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
