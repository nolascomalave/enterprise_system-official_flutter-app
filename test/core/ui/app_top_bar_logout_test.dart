import 'dart:async';

import 'package:enterprise_app/core/i18n/app_localizations_delegates.dart';
import 'package:enterprise_app/core/ui/app_top_bar.dart';
import 'package:enterprise_app/features/auth/domain/entities/auth_result.dart';
import 'package:enterprise_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:enterprise_app/features/auth/presentation/providers/auth_providers.dart';
import 'package:enterprise_app/features/notifications/domain/entities/notification.dart';
import 'package:enterprise_app/features/notifications/domain/entities/notification_page.dart';
import 'package:enterprise_app/features/notifications/domain/repositories/notifications_repository.dart';
import 'package:enterprise_app/features/notifications/presentation/providers/notifications_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart' hide Notification;

class FakeAuthRepository implements AuthRepository {
  int logoutCalls = 0;

  @override
  Future<void> logout() async => logoutCalls++;

  @override
  Future<AuthResult> login({
    required String email,
    required String password,
    required String tenantId,
  }) => throw UnimplementedError();

  @override
  Future<AuthSession> verifyTwoFactor({
    required String tempToken,
    required String code,
  }) => throw UnimplementedError();
}

class FakeNotificationsRepository implements NotificationsRepository {
  final controller = StreamController<List<Notification>>.broadcast();

  @override
  Future<NotificationPage> getNotifications({
    int limit = 50,
    int offset = 0,
  }) async => const NotificationPage(items: [], total: 0, limit: 50, offset: 0);

  @override
  Future<void> markAsRead(String notificationId) async {}

  @override
  Stream<List<Notification>> streamNotifications({
    List<Notification>? initial,
  }) => controller.stream;
}

Widget buildApp(
  FakeAuthRepository auth,
  FakeNotificationsRepository notifications,
) {
  final router = GoRouter(
    initialLocation: '/dashboard',
    routes: [
      GoRoute(
        path: '/dashboard',
        builder: (context, state) => const Scaffold(body: AppTopBar()),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const Scaffold(body: Text('LOGIN')),
      ),
    ],
  );
  return ProviderScope(
    overrides: [
      authRepositoryProvider.overrideWith((ref) async => auth),
      notificationsRepositoryProvider.overrideWith(
        (ref) async => notifications,
      ),
    ],
    child: MaterialApp.router(
      locale: const Locale('es'),
      localizationsDelegates: appLocalizationsDelegates,
      supportedLocales: appSupportedLocales,
      theme: ThemeData.dark(useMaterial3: true)
          .copyWith(splashFactory: InkRipple.splashFactory),
      routerConfig: router,
    ),
  );
}

void main() {
  testWidgets('logout pide confirmación y navega al login', (tester) async {
    tester.view.physicalSize = const Size(1400, 900);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    final auth = FakeAuthRepository();
    final notifications = FakeNotificationsRepository();
    addTearDown(notifications.controller.close);
    await tester.pumpWidget(buildApp(auth, notifications));
    await tester.pumpAndSettle();
    expect(notifications.controller.hasListener, isTrue);

    await tester.tap(find.byKey(const Key('logout_button')));
    await tester.pumpAndSettle();

    expect(
      find.text('¿Estás seguro de que quieres cerrar sesión?'),
      findsOneWidget,
    );

    await tester.tap(find.byKey(const Key('logout_confirm')));
    await tester.pumpAndSettle();

    expect(auth.logoutCalls, 1);
    expect(find.text('LOGIN'), findsOneWidget);
    expect(notifications.controller.hasListener, isFalse);
  });

  testWidgets('cancelar mantiene la sesión', (tester) async {
    tester.view.physicalSize = const Size(1400, 900);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    final auth = FakeAuthRepository();
    final notifications = FakeNotificationsRepository();
    addTearDown(notifications.controller.close);
    await tester.pumpWidget(buildApp(auth, notifications));
    await tester.pumpAndSettle();
    expect(notifications.controller.hasListener, isTrue);

    await tester.tap(find.byKey(const Key('logout_button')));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Cancelar'));
    await tester.pumpAndSettle();

    expect(auth.logoutCalls, 0);
    expect(find.byType(AppTopBar), findsOneWidget);
  });
}
