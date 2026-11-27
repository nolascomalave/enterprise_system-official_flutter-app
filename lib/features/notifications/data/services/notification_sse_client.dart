import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../core/network/api_exception.dart';
import '../../../../core/network/secure_storage_service.dart';

/// Conexión SSE de notificaciones. Cada [connect] abre un cliente HTTP nuevo
/// y lo cierra cuando el consumidor cancela la suscripción.
abstract class NotificationSseClient {
  Stream<String> connect();
}

/// Implementación sobre `package:http`, compatible con nativo y web
/// (`fetch` con streaming). El backend exige `Authorization: Bearer`.
class HttpNotificationSseClient implements NotificationSseClient {
  HttpNotificationSseClient({
    required this.baseUrl,
    required this.storage,
    http.Client Function()? clientFactory,
  }) : _clientFactory = clientFactory ?? http.Client.new;

  final String baseUrl;
  final SecureStorageService storage;
  final http.Client Function() _clientFactory;

  @override
  Stream<String> connect() async* {
    final token = await storage.readAccessToken();
    final client = _clientFactory();
    final uri = Uri.parse(
      '${baseUrl.replaceAll(RegExp(r'/+$'), '')}/notifications/stream',
    );
    final request = http.Request('GET', uri)
      ..headers['Accept'] = 'text/event-stream'
      ..headers['Cache-Control'] = 'no-cache';
    if (token != null && token.isNotEmpty) {
      request.headers['Authorization'] = 'Bearer $token';
    }

    try {
      final response = await client
          .send(request)
          .timeout(const Duration(seconds: 15));
      if (response.statusCode != 200) {
        throw ApiException(
          'No se pudo conectar al stream de notificaciones.',
          statusCode: response.statusCode,
        );
      }

      final lines = response.stream
          .transform(utf8.decoder)
          .transform(const LineSplitter());
      final data = StringBuffer();

      await for (final line in lines) {
        if (line.isEmpty) {
          if (data.isNotEmpty) {
            yield data.toString();
            data.clear();
          }
          continue;
        }
        if (line.startsWith(':')) continue; // heartbeat / comentario
        if (!line.startsWith('data:')) continue;

        if (data.isNotEmpty) data.write('\n');
        data.write(line.substring(5).trimLeft());
      }
    } on TimeoutException {
      throw const ApiException('Tiempo de conexión agotado.');
    } finally {
      client.close();
    }
  }
}
