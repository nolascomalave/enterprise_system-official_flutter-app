import '../../../../core/router/branch_routes.dart';
import '../../domain/entities/notification.dart';

/// Ruta de destino según `resource_type` / `resource_id`.
String? notificationRoute(Notification notification) {
  final resourceId = notification.resourceId;
  return switch (notification.resourceType) {
    'tenant_relationship' ||
    'tenant_relationship_invite' ||
    'corporate_relationship' => BranchRoutes.corporateRelationships,
    'party' when resourceId != null && resourceId.isNotEmpty =>
      '${BranchRoutes.parties}/$resourceId',
    'employee' => BranchRoutes.employees,
    'department' => BranchRoutes.departments,
    _ => null,
  };
}
