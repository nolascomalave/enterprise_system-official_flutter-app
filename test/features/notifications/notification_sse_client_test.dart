import 'dart:async';
import 'dart:convert';

import 'package:enterprise_app/core/network/api_exception.dart';
import 'package:enterprise_app/core/network/secure_storage_service.dart';
import 'package:enterprise_app/features/notifications/data/services/notification_sse_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

class FakeStorage extends SecureStorageService {
  @override
  Future<String?> readAccessToken() async => 'jwt-token';
}

void main() {
  test('parsea eventos SSE, ignora comentarios y envía el Bearer', () async {
    final client = MockClient.streaming((request, bodyStream) async {
      expect(request.url.path, '/api/v1/notifications/stream');
      expect(request.headers['Accept'], 'text/event-stream');
      expect(request.headers['Authorization'], 'Bearer jwt-token');

      final controller = StreamController<List<int>>();
      scheduleMicrotask(() {
        controller.add(utf8.encode(': connected\n\n'));
        controller.add(utf8.encode('data: {"id":"n1"}\n\n'));
        controller.add(utf8.encode(': ping\n\n'));
        controller.add(utf8.encode('data: {"id":"n2"}\n\n'));
        controller.close();
      });
      return http.StreamedResponse(controller.stream, 200);
    });

    final sse = HttpNotificationSseClient(
      baseUrl: 'http://test.local/api/v1/',
      storage: FakeStorage(),
      clientFactory: () => client,
    );

    final events = await sse.connect().toList();
    expect(events, ['{"id":"n1"}', '{"id":"n2"}']);
  });

  test('lanza ApiException si el backend rechaza la conexión', () async {
    final client = MockClient.streaming(
      (request, bodyStream) async =>
          http.StreamedResponse(const Stream.empty(), 401),
    );
    final sse = HttpNotificationSseClient(
      baseUrl: 'http://test.local/api/v1',
      storage: FakeStorage(),
      clientFactory: () => client,
    );

    expect(
      () => sse.connect().toList(),
      throwsA(
        isA<ApiException>().having((e) => e.statusCode, 'statusCode', 401),
      ),
    );
  });
}
