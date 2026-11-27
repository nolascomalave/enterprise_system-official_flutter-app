import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import '../i18n/l10n_ext.dart';

import '../menu/default_menu.dart';
import '../menu/menu_notifier.dart';
import '../router/branch_routes.dart';
import '../../features/preferences/presentation/providers/preferences_notifier.dart';
import 'app_sidebar.dart';
import 'app_top_bar.dart';
import 'layout.dart';

export 'layout.dart';
import 'mobile_nav.dart';

/// Shell principal: Sidebar en desktop, Bottom Nav + Bottom Sheet en móvil.
class AppShell extends ConsumerStatefulWidget {
  const AppShell({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  ConsumerState<AppShell> createState() => _AppShellState();
}

class _AppShellState extends ConsumerState<AppShell> {
  bool _collapsed = false;

  @override
  void initState() {
    super.initState();
    // Tras el login, carga las preferencias guardadas en el servidor.
    Future.microtask(() => ref.invalidate(preferencesProvider));
  }

  void _goToBranch(int index) {
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }

  void _onOptionSelected(String route) {
    final index = BranchRoutes.indexForRoute(route);
    if (index == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(context.l10n.sectionComingSoon(route))),
      );
      return;
    }
    _goToBranch(index);
  }

  @override
  Widget build(BuildContext context) {
    final menuAsync = ref.watch(menuProvider);
    final menu = menuAsync.value ?? buildFallbackMenu();
    final currentPath = GoRouterState.of(context).matchedLocation;
    final width = MediaQuery.sizeOf(context).width;
    final isDesktop = isDesktopLayout(width);

    if (isDesktop) {
      return Scaffold(
        body: Row(
          children: [
            AppSidebar(
              menu: menu,
              currentPath: currentPath,
              collapsed: _collapsed,
              onToggle: () => setState(() => _collapsed = !_collapsed),
              onOptionSelected: _onOptionSelected,
              loading: menuAsync.isLoading,
              hasError: menuAsync.hasError,
              onRetry: () => ref.invalidate(menuProvider),
            ),
            Expanded(
              child: Column(
                children: [
                  const AppTopBar(),
                  Expanded(
                    child: MediaQuery.removePadding(
                      context: context,
                      removeTop: true,
                      child: Stack(
                        children: [
                          Positioned.fill(child: widget.navigationShell),
                          Positioned(
                            right: 24,
                            bottom: 24,
                            child: AskAiButton(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      body: Column(
        children: [
          const AppTopBar(),
          Expanded(
            child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: Stack(
                children: [
                  Positioned.fill(child: widget.navigationShell),
                  Positioned(
                    left: 24,
                    right: 24,
                    bottom: 24,
                    child: MobileBottomNav(
                      currentIndex: widget.navigationShell.currentIndex,
                      onBranchSelected: _goToBranch,
                      onMenuTap: () => showMobileMenuSheet(
                        context,
                        menu: menu,
                        currentPath: currentPath,
                        onOptionSelected: _onOptionSelected,
                      ),
                    ),
                  ),
                  Positioned(right: 20, bottom: 100, child: AskAiButton()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
