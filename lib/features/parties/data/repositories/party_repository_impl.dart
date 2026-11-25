import 'package:dio/dio.dart';

import '../../../../core/network/api_exception.dart';
import '../../domain/entities/party.dart';
import '../../domain/entities/party_detail.dart';
import '../../domain/repositories/parties_repository.dart';
import '../dto/party_detail_dto.dart';
import '../dto/party_dto.dart';

/// Implementación contra la API Go.
///
/// - `GET /parties` → envelope `{ data: PartyResponse[] }`
/// - `GET /parties/{id}` → `{ data: PartyResponse }` (con colecciones ricas)
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
  Future<PartyDetail> getPartyById(String partyId) async {
    try {
      final response =
          await _dio.get<Map<String, dynamic>>('/parties/$partyId');
      final data = response.data?['data'] ?? response.data;
      if (data is! Map) {
        throw const ApiException('Respuesta de detalle inválida del servidor.');
      }
      return _mapDetail(Map<String, dynamic>.from(data));
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

  // ── Parseo tolerante del detalle ──────────────────────────────────────────

  PartyDetail _mapDetail(Map<String, dynamic> json) {
    final dto = PartyDetailDto.fromJson(json);
    final person = dto.personProfile;
    final org = dto.organizationProfile;

    return PartyDetail(
      id: dto.id ?? '',
      displayName: dto.displayName ?? '—',
      partyType: dto.partyType ?? 'INDIVIDUAL',
      recordStatus: dto.recordStatus ?? 'ACTIVE',
      createdAt: dto.createdAt,
      person: person == null
          ? null
          : PersonInfo(
              firstName: person.firstName,
              middleName: person.middleName,
              lastName: person.lastName,
              secondLastName: person.secondLastName,
              birthDate: person.birthDate,
            ),
      organization: org == null
          ? null
          : OrganizationInfo(
              legalName: org.legalName,
              tradeName: org.tradeName,
              taxId: org.taxId,
            ),
      contacts: _parseContacts(json),
      addresses: _parseAddresses(json),
      names: _parseNames(json),
      nationalities: _parseNationalities(json),
      documents: _parseDocuments(json),
    );
  }

  List<PartyContact> _parseContacts(Map<String, dynamic> json) {
    final entries = <PartyContact>[];

    void addAll(dynamic raw, String fallbackType) {
      for (final item in _asList(raw)) {
        if (item is String && item.isNotEmpty) {
          entries.add(PartyContact(type: fallbackType, value: item));
        } else if (item is Map) {
          final map = Map<String, dynamic>.from(item);
          final value = _firstString(map, ['value', 'email', 'phone', 'number', 'contact']);
          if (value == null) continue;
          entries.add(
            PartyContact(
              type: _firstString(
                    map,
                    ['contact_type', 'type', 'kind', 'method'],
                  ) ??
                  fallbackType,
              value: value,
              isPrimary: _firstBool(map, ['is_primary', 'primary']),
            ),
          );
        }
      }
    }

    addAll(_pick(json, ['contacts', 'party_contacts', 'contact_methods']), 'Contacto');
    addAll(_pick(json, ['emails', 'email_addresses']), 'EMAIL');
    addAll(_pick(json, ['phones', 'phone_numbers']), 'PHONE');
    return entries;
  }

  List<PartyAddress> _parseAddresses(Map<String, dynamic> json) {
    final entries = <PartyAddress>[];
    for (final item in _asList(_pick(json, ['addresses', 'party_addresses']))) {
      if (item is! Map) continue;
      final map = Map<String, dynamic>.from(item);
      final type = _firstString(map, ['address_type', 'type', 'kind']) ?? 'ADDRESS';
      final formatted = _firstString(map, ['formatted', 'full_address']);
      final text = formatted ??
          [
            _firstString(map, ['line1', 'street', 'address']),
            _firstString(map, ['line2']),
            _firstString(map, ['city']),
            _firstString(map, ['state', 'province']),
            _firstString(map, ['postal_code', 'zip']),
            _firstString(map, ['country']),
          ].whereType<String>().where((part) => part.isNotEmpty).join(', ');
      if (text.isEmpty) continue;
      entries.add(PartyAddress(type: type, text: text));
    }
    return entries;
  }

  List<PartyNameEntry> _parseNames(Map<String, dynamic> json) {
    final entries = <PartyNameEntry>[];
    for (final item in _asList(_pick(json, ['names', 'party_names', 'name_history']))) {
      if (item is! Map) continue;
      final map = Map<String, dynamic>.from(item);
      final name = _firstString(map, ['name', 'display_name', 'full_name', 'value']);
      if (name == null) continue;
      entries.add(
        PartyNameEntry(
          name: name,
          validFrom: _firstString(map, ['valid_from', 'start_date', 'from']),
          validTo: _firstString(map, ['valid_to', 'end_date', 'to']),
        ),
      );
    }
    return entries;
  }

  List<String> _parseNationalities(Map<String, dynamic> json) {
    final values = <String>[];
    for (final item in _asList(_pick(json, ['nationalities', 'party_nationalities']))) {
      if (item is String && item.isNotEmpty) {
        values.add(item);
      } else if (item is Map) {
        final map = Map<String, dynamic>.from(item);
        final label = _firstString(map, ['name', 'country', 'nationality', 'code', 'country_code']);
        if (label != null) values.add(label);
      }
    }
    return values;
  }

  List<PartyDocument> _parseDocuments(Map<String, dynamic> json) {
    final entries = <PartyDocument>[];
    for (final item in _asList(_pick(json, ['documents', 'party_documents']))) {
      if (item is! Map) continue;
      final map = Map<String, dynamic>.from(item);
      final value = _firstString(
        map,
        ['document_number', 'number', 'value', 'identifier', 'document_id'],
      );
      if (value == null) continue;
      entries.add(
        PartyDocument(
          type: _firstString(map, ['document_type', 'type', 'kind']) ?? 'DOCUMENTO',
          value: value,
        ),
      );
    }
    return entries;
  }

  dynamic _pick(Map<String, dynamic> json, List<String> keys) {
    for (final key in keys) {
      final value = json[key];
      if (value != null) return value;
    }
    return null;
  }

  List<dynamic> _asList(dynamic raw) => raw is List ? raw : const [];

  String? _firstString(Map<String, dynamic> map, List<String> keys) {
    for (final key in keys) {
      final value = map[key];
      if (value is String && value.trim().isNotEmpty) return value.trim();
    }
    return null;
  }

  bool _firstBool(Map<String, dynamic> map, List<String> keys) {
    for (final key in keys) {
      final value = map[key];
      if (value is bool) return value;
      if (value is String) {
        if (value.toLowerCase() == 'true' || value == '1') return true;
        if (value.toLowerCase() == 'false' || value == '0') return false;
      }
    }
    return false;
  }

  ApiException _toApiException(DioException error) {
    final wrapped = error.error;
    if (wrapped is ApiException) return wrapped;
    return ApiException.fromDio(error);
  }
}
