import 'dart:async';
import 'dart:math';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/entities/notification.dart';
import '../../domain/usecases/notification_usecases.dart';
import '../state/notifications_state.dart';
import 'notifications_providers.dart';

part 'notifications_notifier.g.dart';

/// Carga la primera página, escucha el SSE y reconecta con backoff exponencial.
@riverpod
class NotificationsNotifier extends _$NotificationsNotifier {
  StreamSubscription<List<Notification>>? _subscription;
  Timer? _retryTimer;
  Timer? _stabilityTimer;
  int _retryAttempt = 0;
  bool _disposed = false;
  final Set<String> _locallyRead = {};

  @override
  Future<NotificationsState> build() async {
    ref.onDispose(_dispose);

    final getUseCase = await ref.watch(getNotificationsUseCaseProvider.future);
    final streamUseCase = await ref.watch(
      streamNotificationsUseCaseProvider.future,
    );
    final markReadUseCase = await ref.watch(
      markNotificationReadUseCaseProvider.future,
    );
    // Mantiene la referencia para reconexiones.
    _markReadUseCase = markReadUseCase;

    final page = await getUseCase(limit: 50);
    final initial = _applyLocalRead(page.items);
    _streamUseCase = streamUseCase;
    _subscribe(initial: initial);

    return NotificationsState(items: initial, total: page.total);
  }

  StreamNotificationsUseCase? _streamUseCase;
  MarkNotificationReadUseCase? _markReadUseCase;

  void _subscribe({List<Notification>? initial}) {
    _subscription?.cancel();
    _subscription = _streamUseCase!
        .call(initial: initial)
        .listen(
          (items) {
            _markStreamStable();
            if (_disposed) return;
            state = AsyncData(
              NotificationsState(items: _applyLocalRead(items)),
            );
          },
          onError: (Object error, StackTrace stack) {
            _scheduleReconnect();
          },
          onDone: _scheduleReconnect,
          cancelOnError: true,
        );
  }

  /// Reinicia el backoff solo si la conexión se mantiene estable unos segundos.
  void _markStreamStable() {
    _stabilityTimer?.cancel();
    if (_retryAttempt == 0) return;
    _stabilityTimer = Timer(const Duration(seconds: 10), () {
      _retryAttempt = 0;
    });
  }

  void _scheduleReconnect() {
    if (_disposed) return;
    _stabilityTimer?.cancel();
    final delay = Duration(seconds: min(1 << _retryAttempt.clamp(0, 4), 30));
    if (_retryAttempt < 5) _retryAttempt++;
    _retryTimer?.cancel();
    _retryTimer = Timer(delay, () {
      if (_disposed) return;
      _subscribe();
    });
  }

  List<Notification> _applyLocalRead(List<Notification> items) {
    if (_locallyRead.isEmpty) return items;
    return [
      for (final item in items)
        _locallyRead.contains(item.id) ? item.copyWith(isRead: true) : item,
    ];
  }

  /// Marca como leída de forma optimista y revierte si el PUT falla.
  Future<void> markAsRead(String notificationId) async {
    final current = state.value;
    if (current == null) return;
    final index = current.items.indexWhere((item) => item.id == notificationId);
    if (index == -1 || current.items[index].isRead) return;

    final previous = current.items;
    _locallyRead.add(notificationId);
    final optimistic = List<Notification>.of(previous);
    optimistic[index] = optimistic[index].copyWith(isRead: true);
    state = AsyncData(current.copyWith(items: optimistic));

    try {
      await _markReadUseCase?.call(notificationId);
    } catch (_) {
      _locallyRead.remove(notificationId);
      if (_disposed) rethrow;
      final latest = state.value;
      if (latest != null) {
        state = AsyncData(latest.copyWith(items: previous));
      }
      rethrow;
    }
  }

  void _dispose() {
    _disposed = true;
    _retryTimer?.cancel();
    _stabilityTimer?.cancel();
    _subscription?.cancel();
  }
}
