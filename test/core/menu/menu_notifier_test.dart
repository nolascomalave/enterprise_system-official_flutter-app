import 'package:dio/dio.dart';
import 'package:enterprise_app/core/menu/menu_notifier.dart';
import 'package:enterprise_app/core/network/dio_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/mock_dio.dart';

void main() {
  test('MenuNotifier parsea el árbol JSON, ordena y expone hijos/opciones',
      () async {
    final adapter = MockAdapter((options, body) async {
      expect(options.path, '/rbac/my-menu');
      expect(options.queryParameters['app_client_id'], 'first-party-app');

      return jsonResponse({
        'data': [
          {
            'id': '2',
            'code': 'party',
            'name': 'Party',
            'sort_order': 2,
            'children': [
              {
                'id': '2.1',
                'code': 'parties',
                'name': 'Listado',
                'sort_order': 1,
                'options': [
                  {
                    'id': '2.1.2',
                    'code': 'party-types',
                    'name': 'Tipos de Party',
                    'route': '/party-types',
                    'sort_order': 2,
                  },
                  {
                    'id': '2.1.1',
                    'code': 'parties-all',
                    'name': 'Parties',
                    'route': '/parties',
                    'sort_order': 1,
                  },
                ],
              },
            ],
          },
          {
            'id': '1',
            'code': 'home',
            'name': 'Inicio',
            'sort_order': 1,
            'options': [
              {
                'id': '1.1',
                'code': 'dashboard',
                'name': 'Dashboard',
                'route': '/dashboard',
                'sort_order': 1,
                'icon': 'dashboard',
              },
            ],
          },
        ],
      });
    });

    final dio = Dio(BaseOptions(baseUrl: 'http://test.local/api/v1'))
      ..httpClientAdapter = adapter;

    final container = ProviderContainer(
      overrides: [
        dioProvider.overrideWith((ref) async => dio),
      ],
    );
    addTearDown(container.dispose);

    final menu = await container.read(menuProvider.future);

    // Orden por sort_order (party=2, home=1).
    expect(menu.length, 2);
    expect(menu.first.code, 'home');
    expect(menu.last.code, 'party');

    // Opción hoja parseada.
    expect(menu.first.options.single.name, 'Dashboard');
    expect(menu.first.options.single.route, '/dashboard');

    // Hijos recursivos.
    final party = menu.last;
    expect(party.children, hasLength(1));
    final listado = party.children.single;
    expect(listado.name, 'Listado');

    // Opciones del hijo ordenadas por sort_order.
    expect(listado.options.map((option) => option.route), [
      '/parties',
      '/party-types',
    ]);
  });
}
