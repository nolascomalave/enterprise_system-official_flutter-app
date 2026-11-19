import 'package:dio/dio.dart';
import 'package:enterprise_app/core/network/api_exception.dart';
import 'package:enterprise_app/features/parties/data/repositories/party_repository_impl.dart';
import 'package:enterprise_app/features/parties/domain/entities/party.dart';
import 'package:enterprise_app/features/parties/domain/repositories/parties_repository.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/mock_dio.dart';

void main() {
  late MockAdapter adapter;
  late PartyRepositoryImpl repository;

  Dio buildDio() => Dio(BaseOptions(baseUrl: 'http://test.local/api/v1'))
    ..httpClientAdapter = adapter;

  group('PartyRepositoryImpl.getParties', () {
    test('parsea el envelope y mapea personas y organizaciones', () async {
      adapter = MockAdapter((options, body) async {
        expect(options.path, '/parties');
        return jsonResponse({
          'data': [
            {
              'id': 'p1',
              'display_name': 'Juan Pérez',
              'party_type': 'INDIVIDUAL',
              'record_status': 'ACTIVE',
              'tenant_id': 't1',
              'created_at': '2026-11-18T10:00:00Z',
              'person_profile': {
                'id': 'pp1',
                'party_id': 'p1',
                'first_name': 'Juan',
                'last_name': 'Pérez',
              },
            },
            {
              'id': 'p2',
              'display_name': 'Acme Corp',
              'party_type': 'ORGANIZATION',
              'record_status': 'ACTIVE',
              'organization_profile': {
                'id': 'op1',
                'party_id': 'p2',
                'legal_name': 'Acme Corporation S.A.',
                'tax_id': 'B12345678',
              },
            },
          ],
        });
      });
      repository = PartyRepositoryImpl(buildDio());

      final parties = await repository.getParties();

      expect(parties, hasLength(2));
      expect(parties.first.displayName, 'Juan Pérez');
      expect(parties.first.partyType, PartyType.individual);
      expect(parties.first.profileDetail, 'Juan Pérez');
      expect(parties.first.initials, 'JP');
      expect(parties.first.isActive, isTrue);

      expect(parties.last.partyType, PartyType.organization);
      expect(parties.last.taxId, 'B12345678');
      expect(parties.last.profileDetail, 'B12345678');
    });

    test('lanza ApiException ante un error del backend', () async {
      adapter = MockAdapter((options, body) async {
        return jsonResponse({'error': 'No autorizado'}, statusCode: 401);
      });
      repository = PartyRepositoryImpl(buildDio());

      expect(
        () => repository.getParties(),
        throwsA(
          isA<ApiException>()
              .having((e) => e.message, 'message', 'No autorizado')
              .having((e) => e.statusCode, 'statusCode', 401),
        ),
      );
    });
  });

  group('PartyRepositoryImpl.createParty', () {
    test('envía snake_case con perfil de organización y devuelve la party',
        () async {
      adapter = MockAdapter((options, body) async {
        expect(options.path, '/parties');
        return jsonResponse({
          'data': {
            'id': 'p3',
            'display_name': 'Globex',
            'party_type': 'ORGANIZATION',
            'record_status': 'ACTIVE',
            'organization_profile': {
              'id': 'op2',
              'party_id': 'p3',
              'legal_name': 'Globex Industries S.A.',
              'tax_id': 'G87654321',
            },
          },
        }, statusCode: 201);
      });
      repository = PartyRepositoryImpl(buildDio());

      final party = await repository.createParty(
        const CreatePartyParams(
          displayName: 'Globex',
          partyType: PartyType.organization,
          legalName: 'Globex Industries S.A.',
          taxId: 'G87654321',
        ),
      );

      expect(party.id, 'p3');
      expect(party.partyType, PartyType.organization);
      expect(party.taxId, 'G87654321');

      final sent = adapter.lastBody;
      expect(sent, isNotNull);
      expect(sent, contains('"display_name":"Globex"'));
      expect(sent, contains('"party_type":"ORGANIZATION"'));
      expect(sent, contains('"organization_profile"'));
      expect(sent, contains('"legal_name":"Globex Industries S.A."'));
      expect(sent, contains('"tax_id":"G87654321"'));
      expect(sent, isNot(contains('"person_profile"')));
    });

    test('envía person_profile para INDIVIDUAL', () async {
      adapter = MockAdapter((options, body) async {
        return jsonResponse({
          'data': {
            'id': 'p4',
            'display_name': 'María García',
            'party_type': 'INDIVIDUAL',
            'person_profile': {
              'first_name': 'María',
              'last_name': 'García',
            },
          },
        }, statusCode: 201);
      });
      repository = PartyRepositoryImpl(buildDio());

      await repository.createParty(
        const CreatePartyParams(
          displayName: 'María García',
          partyType: PartyType.individual,
          firstName: 'María',
          lastName: 'García',
        ),
      );

      final sent = adapter.lastBody;
      expect(sent, contains('"party_type":"INDIVIDUAL"'));
      expect(sent, contains('"person_profile"'));
      expect(sent, contains('"first_name":"María"'));
      expect(sent, isNot(contains('"organization_profile"')));
    });
  });
}
