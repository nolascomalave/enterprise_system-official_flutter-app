import 'package:material_ui/material_ui.dart';

/// Mapea nombres de iconos (lucide/backend) a Material Icons.
IconData menuIconForCode(String code) {
  return switch (code) {
    'home' || 'dashboard' => Icons.space_dashboard_outlined,
    'party' || 'parties' || 'groups' || 'users' => Icons.groups_2_outlined,
    'employees' || 'badge' => Icons.badge_outlined,
    'jobs' || 'work' => Icons.work_outline_rounded,
    'departments' || 'business' || 'building' => Icons.business_outlined,
    'corporate-relations' || 'relations' || 'hub' => Icons.hub_outlined,
    'settings' || 'security' => Icons.settings_outlined,
    'category' || 'catalogs' => Icons.category_outlined,
    'apps' => Icons.apps_outlined,
    'sell' => Icons.sell_outlined,
    _ => Icons.circle_outlined,
  };
}
