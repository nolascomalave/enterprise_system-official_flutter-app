import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:enterprise_app/core/network/api_exception.dart';
import 'package:enterprise_app/features/notifications/data/repositories/notifications_repository_impl.dart';
import 'package:enterprise_app/features/notifications/data/services/notification_sse_client.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/mock_dio.dart';

class FakeSseClient implements NotificationSseClient {
  final controller = StreamController<String>.broadcast();
  int connects = 0;

  @override
  Stream<String> connect() {
    connects++;
    return controller.stream;
  }
}

String ssePayload({
  required String id,
  required String title,
  String createdAt = '2026-11-26T10:05:00Z',
  String? resourceId = 'rel-1',
}) {
  return jsonEncode({
    'id': id,
    'tenant_id': 't1',
    'user_id': 'u1',
    'type': 'relationship.approved',
    'title': title,
    'body': 'Detalle de la notificación',
    'resource_type': resourceId == null ? '' : 'tenant_relationship',
    'resource_id': resourceId,
    'created_at': createdAt,
  });
}

void main() {
  late MockAdapter adapter;
  late FakeSseClient sseClient;
  late NotificationsRepositoryImpl repository;

  Dio buildDio() =>
      Dio(BaseOptions(baseUrl: 'http://test.local/api/v1'))
        ..httpClientAdapter = adapter;

  setUp(() {
    sseClient = FakeSseClient();
  });

  tearDown(() {
    if (!sseClient.controller.isClosed) sseClient.controller.close();
  });

  group('NotificationsRepositoryImpl.getNotifications', () {
    test('parsea el envelope paginado y mapea los campos', () async {
      adapter = MockAdapter((options, body) async {
        expect(options.method, 'GET');
        expect(options.path, '/notifications');
        expect(options.queryParameters['limit'], 20);
        expect(options.queryParameters['offset'], 5);
        return jsonResponse({
          'data': [
            {
              'id': 'n1',
              'type': 'relationship.approved',
              'title': 'Relación aprobada',
              'body': 'La filial aprobó la relación',
              'resource_type': 'tenant_relationship',
              'resource_id': 'rel-1',
              'created_at': '2026-11-26T10:00:00Z',
              'is_read': false,
            },
            {
              'id': 'n2',
              'type': 'relationship.rejected',
              'title': 'Relación rechazada',
              'created_at': '2026-11-26T09:00:00Z',
              'is_read': true,
            },
          ],
          'meta': {'limit': 20, 'offset': 5, 'total': 42},
        });
      });
      repository = NotificationsRepositoryImpl(buildDio(), sseClient);

      final page = await repository.getNotifications(limit: 20, offset: 5);

      expect(page.items, hasLength(2));
      expect(page.total, 42);
      expect(page.limit, 20);
      expect(page.offset, 5);
      expect(page.items.first.id, 'n1');
      expect(page.items.first.title, 'Relación aprobada');
      expect(page.items.first.resourceType, 'tenant_relationship');
      expect(page.items.first.resourceId, 'rel-1');
      expect(page.items.first.isRead, isFalse);
      expect(page.items.last.isRead, isTrue);
      expect(page.items.last.body, isEmpty);
    });

    test('lanza ApiException ante error del backend', () async {
      adapter = MockAdapter((options, body) async {
        return jsonResponse({'error': 'No autorizado'}, statusCode: 401);
      });
      repository = NotificationsRepositoryImpl(buildDio(), sseClient);

      expect(
        () => repository.getNotifications(),
        throwsA(
          isA<ApiException>()
              .having((e) => e.message, 'message', 'No autorizado')
              .having((e) => e.statusCode, 'statusCode', 401),
        ),
      );
    });
  });

  group('NotificationsRepositoryImpl.markAsRead', () {
    test('envía PUT /notifications/{id}/read', () async {
      adapter = MockAdapter((options, body) async {
        expect(options.method, 'PUT');
        expect(options.path, '/notifications/n1/read');
        return ResponseBody.fromString('', 204);
      });
      repository = NotificationsRepositoryImpl(buildDio(), sseClient);

      await repository.markAsRead('n1');
    });
  });

  group('NotificationsRepositoryImpl.streamNotifications', () {
    test('emite la lista inicial y la actualiza con los eventos SSE', () async {
      adapter = MockAdapter((options, body) async {
        expect(options.path, '/notifications');
        return jsonResponse({
          'data': [
            {
              'id': 'n1',
              'type': 'relationship.approved',
              'title': 'Relación aprobada',
              'created_at': '2026-11-26T10:00:00Z',
              'is_read': true,
            },
          ],
          'meta': {'limit': 50, 'offset': 0, 'total': 1},
        });
      });
      repository = NotificationsRepositoryImpl(buildDio(), sseClient);

      final events = <List<dynamic>>[];
      final subscription = repository.streamNotifications().listen(events.add);

      await Future<void>.delayed(const Duration(milliseconds: 20));
      expect(sseClient.connects, 1);
      expect(events, hasLength(1));
      expect(events.first, hasLength(1));
      expect(events.first.single.id, 'n1');

      sseClient.controller.add(ssePayload(id: 'n2', title: 'Nueva relación'));
      await Future<void>.delayed(const Duration(milliseconds: 20));

      expect(events, hasLength(2));
      expect(events.last, hasLength(2));
      expect(events.last.first.id, 'n2');
      expect(events.last.first.title, 'Nueva relación');
      expect(events.last.first.isRead, isFalse);

      // Un evento repetido no duplica la notificación.
      sseClient.controller.add(ssePayload(id: 'n2', title: 'Nueva relación'));
      await Future<void>.delayed(const Duration(milliseconds: 20));
      expect(events.last, hasLength(2));

      await subscription.cancel();
    });
  });
}
