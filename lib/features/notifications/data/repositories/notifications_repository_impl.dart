import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../../core/network/api_exception.dart';
import '../../domain/entities/notification.dart';
import '../../domain/entities/notification_page.dart';
import '../../domain/repositories/notifications_repository.dart';
import '../dto/notification_dto.dart';
import '../services/notification_sse_client.dart';

/// Implementación contra el backend Go (REST + SSE).
class NotificationsRepositoryImpl implements NotificationsRepository {
  NotificationsRepositoryImpl(this._dio, this._sseClient);

  final Dio _dio;
  final NotificationSseClient _sseClient;

  static const int streamPageSize = 50;

  @override
  Future<NotificationPage> getNotifications({
    int limit = 50,
    int offset = 0,
  }) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/notifications',
        queryParameters: {'limit': limit, 'offset': offset},
      );
      final raw = response.data;
      if (raw == null) {
        throw const ApiException(
          'Respuesta de notificaciones inválida del servidor.',
        );
      }
      final envelope = NotificationListEnvelopeDto.fromJson(raw);
      return NotificationPage(
        items: envelope.data.map((dto) => dto.toEntity()).toList(),
        total: envelope.meta.total,
        limit: envelope.meta.limit,
        offset: envelope.meta.offset,
      );
    } on DioException catch (error) {
      throw _toApiException(error);
    }
  }

  @override
  Future<void> markAsRead(String notificationId) async {
    try {
      await _dio.put<void>('/notifications/$notificationId/read');
    } on DioException catch (error) {
      throw _toApiException(error);
    }
  }

  @override
  Stream<List<Notification>> streamNotifications({
    List<Notification>? initial,
  }) {
    late StreamController<List<Notification>> controller;
    StreamSubscription<String>? sseSubscription;
    var closed = false;

    controller = StreamController<List<Notification>>(
      onListen: () async {
        try {
          final seed =
              initial ?? (await getNotifications(limit: streamPageSize)).items;
          if (closed) return;
          final cache = <String, Notification>{
            for (final notification in seed) notification.id: notification,
          };
          controller.add(_sorted(cache.values));

          sseSubscription = _sseClient.connect().listen(
            (payload) {
              try {
                final decoded = jsonDecode(payload);
                if (decoded is! Map) return;
                final dto = NotificationDto.fromJson(
                  Map<String, dynamic>.from(decoded),
                );
                final notification = dto.toEntity();
                cache[notification.id] = notification;
                if (!closed) controller.add(_sorted(cache.values));
              } catch (_) {
                // Evento malformado: se ignora para no tumbar la conexión.
              }
            },
            onError: (Object error, StackTrace stack) {
              if (!closed) {
                controller.addError(error, stack);
                controller.close();
              }
            },
            onDone: () {
              if (!closed) controller.close();
            },
          );
        } catch (error, stack) {
          if (!closed) {
            controller.addError(error, stack);
            controller.close();
          }
        }
      },
      onCancel: () {
        closed = true;
        sseSubscription?.cancel();
        sseSubscription = null;
      },
    );

    return controller.stream;
  }

  List<Notification> _sorted(Iterable<Notification> items) {
    final result = items.toList()
      ..sort((a, b) {
        final byDate = b.createdAt.compareTo(a.createdAt);
        return byDate != 0 ? byDate : b.id.compareTo(a.id);
      });
    return result;
  }

  ApiException _toApiException(DioException error) {
    final errorBody = error.error;
    if (errorBody is ApiException) return errorBody;
    return ApiException.fromDio(error);
  }
}
