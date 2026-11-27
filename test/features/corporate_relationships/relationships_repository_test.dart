import 'package:dio/dio.dart';
import 'package:enterprise_app/features/corporate_relationships/data/repositories/relationships_repository_impl.dart';
import 'package:enterprise_app/features/corporate_relationships/domain/entities/corporate_relationship.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/mock_dio.dart';

void main() {
  test(
    'GET /tenant-relationships mapea el contrato real del backend',
    () async {
      final adapter = MockAdapter((options, body) async {
        expect(options.method, 'GET');
        expect(options.path, '/tenant-relationships');
        return jsonResponse({
          'data': [
            {
              'id': 'r1',
              'holding_tenant_id': 'h1',
              'holding_name': 'Acme Holding',
              'subsidiary_tenant_id': 's1',
              'subsidiary_name': 'Acme Sub',
              'relationship_type': 'SUBSIDIARY_OF',
              'status': 'REVOKED',
              'requested_at': '2026-01-01T10:00:00Z',
              'approved_at': '2026-01-02T14:30:00Z',
              'revoked_at': '2026-01-03T09:00:00Z',
              'revocation_reason': 'Incumplimiento contractual',
              'issued_at': '2026-01-01T11:00:00Z',
            },
            {
              'id': 'r2',
              'holding_tenant_id': 'h1',
              'subsidiary_tenant_id': 's1',
              'status': 'CANCELED',
              'requested_at': '2026-02-01T10:00:00Z',
              'canceled_at': '2026-02-02T10:00:00Z',
              'cancellation_reason': 'Solicitud de la filial',
              'token_emitted_at': '2026-02-01T11:00:00Z',
            },
          ],
        });
      });
      final dio = Dio(BaseOptions(baseUrl: 'http://test.local/api/v1'))
        ..httpClientAdapter = adapter;
      final repository = RelationshipsRepositoryImpl(dio);

      final relationships = await repository.getRelationships();

      expect(relationships, hasLength(2));
      final revoked = relationships.first;
      expect(revoked.holdingId, 'h1');
      expect(revoked.subsidiaryId, 's1');
      expect(revoked.holdingName, 'Acme Holding');
      expect(revoked.status, RelationshipStatus.revoked);
      expect(revoked.requestedAt, '2026-01-01T10:00:00Z');
      expect(revoked.approvedAt, '2026-01-02T14:30:00Z');
      expect(revoked.revokedAt, '2026-01-03T09:00:00Z');
      expect(revoked.revocationReason, 'Incumplimiento contractual');
      expect(revoked.tokenEmittedAt, '2026-01-01T11:00:00Z');

      final canceled = relationships.last;
      expect(canceled.status, RelationshipStatus.cancelled);
      expect(canceled.canceledAt, '2026-02-02T10:00:00Z');
      expect(canceled.cancellationReason, 'Solicitud de la filial');
      expect(canceled.tokenEmittedAt, '2026-02-01T11:00:00Z');
    },
  );
}
