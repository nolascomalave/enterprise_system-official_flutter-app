import 'package:dio/dio.dart';

import '../../../../core/network/api_exception.dart';
import '../../domain/entities/corporate_relationship.dart';
import '../../domain/repositories/relationships_repository.dart';
import '../dto/relationship_dto.dart';

/// Implementación contra la API Go (solo endpoints de tenant).
class RelationshipsRepositoryImpl implements RelationshipsRepository {
  RelationshipsRepositoryImpl(this._dio);

  final Dio _dio;

  static const String _base = '/corporate-relationships';

  @override
  Future<List<CorporateRelationship>> getRelationships() async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(_base);
      final data = response.data?['data'] ?? response.data;
      if (data is! List) {
        throw const ApiException(
            'Respuesta de relaciones corporativas inválida del servidor.');
      }
      return data
          .whereType<Map>()
          .map((json) => TenantRelationshipDto.fromJson(
                Map<String, dynamic>.from(json),
              ).toEntity())
          .toList();
    } on DioException catch (error) {
      throw _toApiException(error);
    }
  }

  @override
  Future<void> initiate({required String holdingTenantId}) async {
    try {
      await _dio.post<void>(
        '$_base/initiate',
        data: InitiateRelationshipRequestDto(holdingTenantId: holdingTenantId)
            .toJson(),
      );
    } on DioException catch (error) {
      throw _toApiException(error);
    }
  }

  @override
  Future<InviteToken> emitToken(String relationshipId) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        '$_base/$relationshipId/emit-token',
      );
      final data = response.data?['data'] ?? response.data;
      final dto = data is Map
          ? EmitInviteTokenResponseDto.fromJson(Map<String, dynamic>.from(data))
          : null;
      final token = dto?.token;
      if (token == null || token.isEmpty) {
        throw const ApiException('El servidor no devolvió el token de invitación.');
      }
      return InviteToken(token: token, expiresAt: dto?.expiresAt);
    } on DioException catch (error) {
      throw _toApiException(error);
    }
  }

  @override
  Future<void> consumeToken(String token) async {
    try {
      await _dio.post<void>(
        '$_base/consume-token',
        data: ConsumeInviteTokenRequestDto(token: token).toJson(),
      );
    } on DioException catch (error) {
      throw _toApiException(error);
    }
  }

  @override
  Future<void> reject(String relationshipId, {String? reason}) async {
    await _postAction('$relationshipId/reject', reason: reason);
  }

  @override
  Future<void> revoke(String relationshipId, {String? reason}) async {
    await _postAction('$relationshipId/revoke', reason: reason);
  }

  @override
  Future<void> cancel(String relationshipId) async {
    await _postAction('$relationshipId/cancel');
  }

  Future<void> _postAction(String path, {String? reason}) async {
    try {
      final body = reason == null || reason.isEmpty
          ? null
          : RelationshipReasonRequestDto(reason: reason).toJson();
      await _dio.post<void>('$_base/$path', data: body);
    } on DioException catch (error) {
      throw _toApiException(error);
    }
  }

  ApiException _toApiException(DioException error) {
    final wrapped = error.error;
    if (wrapped is ApiException) return wrapped;
    return ApiException.fromDio(error);
  }
}
