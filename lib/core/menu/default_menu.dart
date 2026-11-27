import 'models/menu_tree.dart';

/// Menú de respaldo usado si el backend RBAC no responde (modo offline/demo).
List<MenuNode> buildFallbackMenu() {
  MenuOption option({
    required String id,
    required String code,
    required String name,
    required String route,
    int sortOrder = 1,
    String icon = 'circle',
  }) => MenuOption(
    id: id,
    code: code,
    name: name,
    icon: icon,
    route: route,
    sortOrder: sortOrder,
  );

  return [
    MenuNode(
      id: 'home',
      code: 'home',
      name: 'Inicio',
      sortOrder: 1,
      options: [
        option(
          id: 'home.dashboard',
          code: 'dashboard',
          name: 'Dashboard',
          route: '/dashboard',
          icon: 'dashboard',
        ),
      ],
    ),
    MenuNode(
      id: 'party',
      code: 'party',
      name: 'Party',
      sortOrder: 2,
      children: [
        MenuNode(
          id: 'party.list',
          code: 'parties',
          name: 'Listado',
          sortOrder: 1,
          options: [
            option(
              id: 'party.list.all',
              code: 'parties.all',
              name: 'Parties',
              route: '/parties',
              icon: 'groups',
            ),
            option(
              id: 'party.list.types',
              code: 'parties.types',
              name: 'Tipos de Party',
              route: '/party-types',
              icon: 'sell',
            ),
          ],
        ),
      ],
    ),
    MenuNode(
      id: 'employees',
      code: 'employees',
      name: 'Empleados',
      sortOrder: 3,
      options: [
        option(
          id: 'employees.all',
          code: 'employees.all',
          name: 'Empleados',
          route: '/employees',
          icon: 'badge',
        ),
        option(
          id: 'employees.jobs',
          code: 'employees.jobs',
          name: 'Puestos',
          route: '/jobs',
          icon: 'work',
        ),
      ],
    ),
    MenuNode(
      id: 'departments',
      code: 'departments',
      name: 'Departamentos',
      sortOrder: 4,
      options: [
        option(
          id: 'departments.all',
          code: 'departments.all',
          name: 'Departamentos',
          route: '/departments',
          icon: 'business',
        ),
        option(
          id: 'departments.groups',
          code: 'departments.groups',
          name: 'Grupos corporativos',
          route: '/corporate-groups',
          icon: 'hub',
        ),
      ],
    ),
    MenuNode(
      id: 'corporate-relationships',
      code: 'corporate-relationships',
      name: 'Relaciones Corporativas',
      sortOrder: 5,
      options: [
        option(
          id: 'corporate-relationships.all',
          code: 'corporate-relationships.all',
          name: 'Holding-Filial',
          route: '/corporate-relationships',
          icon: 'hub',
        ),
      ],
    ),
    MenuNode(
      id: 'settings',
      code: 'settings',
      name: 'Configuración',
      sortOrder: 6,
      options: [
        option(
          id: 'settings.catalogs',
          code: 'settings.catalogs',
          name: 'Catálogos',
          route: '/settings',
          icon: 'category',
        ),
        option(
          id: 'settings.oauth',
          code: 'settings.oauth',
          name: 'Aplicaciones cliente',
          route: '/client-applications',
          icon: 'apps',
        ),
        option(
          id: 'settings.mfa',
          code: 'settings.mfa',
          name: 'Seguridad y MFA',
          route: '/mfa-preferences',
          icon: 'security',
        ),
      ],
    ),
  ];
}
