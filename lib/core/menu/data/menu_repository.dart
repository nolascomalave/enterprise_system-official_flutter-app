import 'package:dio/dio.dart';

import '../../network/api_exception.dart';
import '../models/menu_tree.dart';

/// Puerto del menú RBAC.
abstract interface class MenuRepository {
  Future<List<MenuNode>> fetchMyMenu({required String appClientId});
}

/// Implementación contra el backend Go.
class MenuRepositoryImpl implements MenuRepository {
  MenuRepositoryImpl(this._dio);

  final Dio _dio;

  @override
  Future<List<MenuNode>> fetchMyMenu({required String appClientId}) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/rbac/my-menu',
        queryParameters: {'app_client_id': appClientId},
      );

      final data = response.data?['data'];
      if (data is! List) {
        throw const ApiException('Respuesta de menú inválida del servidor.');
      }

      final nodes = data
          .whereType<Map>()
          .map((json) => MenuNode.fromJson(Map<String, dynamic>.from(json)))
          .toList();

      return sortMenuNodes(nodes);
    } on DioException catch (error) {
      final wrapped = error.error;
      if (wrapped is ApiException) throw wrapped;
      throw ApiException.fromDio(error);
    }
  }
}
