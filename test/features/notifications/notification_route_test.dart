import 'package:enterprise_app/features/notifications/domain/entities/notification.dart';
import 'package:enterprise_app/features/notifications/presentation/widgets/notification_route.dart';
import 'package:flutter_test/flutter_test.dart';

Notification notification({String resourceType = '', String? resourceId}) {
  return Notification(
    id: 'n1',
    type: 'test',
    title: 'Test',
    resourceType: resourceType,
    resourceId: resourceId,
    createdAt: DateTime.utc(2026, 11, 26),
  );
}

void main() {
  test('las relaciones corporativas navegan a su branch', () {
    expect(
      notificationRoute(
        notification(resourceType: 'tenant_relationship', resourceId: 'r1'),
      ),
      '/corporate-relationships',
    );
    expect(
      notificationRoute(
        notification(
          resourceType: 'tenant_relationship_invite',
          resourceId: 'i1',
        ),
      ),
      '/corporate-relationships',
    );
  });

  test(
    'una party navega a su detalle y los recursos desconocidos no navegan',
    () {
      expect(
        notificationRoute(
          notification(resourceType: 'party', resourceId: 'p1'),
        ),
        '/parties/p1',
      );
      expect(
        notificationRoute(
          notification(resourceType: 'unknown', resourceId: 'x'),
        ),
        isNull,
      );
      expect(notificationRoute(notification()), isNull);
    },
  );
}
