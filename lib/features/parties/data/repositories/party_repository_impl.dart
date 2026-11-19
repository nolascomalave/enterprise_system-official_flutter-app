import 'package:dio/dio.dart';

import '../../../../core/network/api_exception.dart';
import '../../domain/entities/party.dart';
import '../../domain/repositories/parties_repository.dart';
import '../dto/party_dto.dart';

/// Implementación contra la API Go.
///
/// - `GET /parties` → envelope `{ data: PartyResponse[] }`
/// - `POST /parties` → `{ data: PartyResponse }`
class PartyRepositoryImpl implements PartiesRepository {
  PartyRepositoryImpl(this._dio);

  final Dio _dio;

  @override
  Future<List<Party>> getParties() async {
    try {
      final response = await _dio.get<Map<String, dynamic>>('/parties');
      final data = response.data?['data'];
      if (data is! List) {
        throw const ApiException('Respuesta de parties inválida del servidor.');
      }
      return data
          .whereType<Map>()
          .map((json) => PartyDto.fromJson(Map<String, dynamic>.from(json)).toEntity())
          .toList();
    } on DioException catch (error) {
      throw _toApiException(error);
    }
  }

  @override
  Future<Party> createParty(CreatePartyParams params) async {
    final request = CreatePartyRequestDto(
      displayName: params.displayName,
      partyType: params.partyType.apiValue,
      personProfile: params.partyType == PartyType.individual
          ? CreatePersonProfileDto(
              firstName: params.firstName,
              lastName: params.lastName,
              secondLastName: params.secondLastName,
            )
          : null,
      organizationProfile: params.partyType == PartyType.organization
          ? CreateOrganizationProfileDto(
              legalName: params.legalName,
              taxId: params.taxId,
              tradeName: params.tradeName,
            )
          : null,
    );

    try {
      final response = await _dio.post<Map<String, dynamic>>(
        '/parties',
        data: request.toJson(),
      );
      final data = response.data?['data'];
      if (data is! Map) {
        throw const ApiException('Respuesta de creación inválida del servidor.');
      }
      return PartyDto.fromJson(Map<String, dynamic>.from(data)).toEntity();
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
