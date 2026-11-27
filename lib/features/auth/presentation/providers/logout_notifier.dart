import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/menu/menu_notifier.dart';
import '../../../client_apps/presentation/providers/client_apps_notifier.dart';
import '../../../corporate_relationships/presentation/providers/relationship_detail_notifier.dart';
import '../../../corporate_relationships/presentation/providers/relationships_notifier.dart';
import '../../../corporate_relationships/presentation/providers/relationships_providers.dart';
import '../../../dashboard/presentation/providers/dashboard_notifier.dart';
import '../../../departments/presentation/providers/corporate_groups_notifier.dart';
import '../../../departments/presentation/providers/department_detail_notifier.dart';
import '../../../departments/presentation/providers/departments_notifier.dart';
import '../../../employees/presentation/providers/employee_detail_notifier.dart';
import '../../../employees/presentation/providers/employees_notifier.dart';
import '../../../employees/presentation/providers/employees_providers.dart';
import '../../../notifications/presentation/providers/notifications_notifier.dart';
import '../../../parties/presentation/providers/merge_parties_notifier.dart';
import '../../../parties/presentation/providers/parties_notifier.dart';
import '../../../parties/presentation/providers/party_detail_notifier.dart';
import '../../../parties/presentation/providers/update_party_notifier.dart';
import '../../../preferences/presentation/providers/preferences_notifier.dart';
import '../../../settings/presentation/providers/security_settings_notifier.dart';
import 'auth_providers.dart';
import 'login_notifier.dart';

part 'logout_notifier.g.dart';

/// Cierra la sesión y limpia los datos de usuario en memoria.
@Riverpod(keepAlive: true)
class LogoutNotifier extends _$LogoutNotifier {
  @override
  Future<void> build() async {}

  Future<void> logout() async {
    state = const AsyncLoading();
    try {
      final useCase = await ref.read(logoutUseCaseProvider.future);
      await useCase();
      _clearSessionCaches();
      state = const AsyncData(null);
    } catch (error, stack) {
      state = AsyncError(error, stack);
      rethrow;
    }
  }

  /// Invalida los estados que podrían contener datos de la sesión anterior.
  void _clearSessionCaches() {
    ref.invalidate(notificationsProvider);
    ref.invalidate(preferencesProvider);
    ref.invalidate(partiesProvider);
    ref.invalidate(partyDetailProvider);
    ref.invalidate(mergePartiesProvider);
    ref.invalidate(updatePartyProvider);
    ref.invalidate(menuProvider);
    ref.invalidate(dashboardProvider);
    ref.invalidate(employeesProvider);
    ref.invalidate(employeeDetailProvider);
    ref.invalidate(jobsProvider);
    ref.invalidate(departmentOptionsProvider);
    ref.invalidate(individualPartiesProvider);
    ref.invalidate(departmentsProvider);
    ref.invalidate(departmentDetailProvider);
    ref.invalidate(corporateGroupsProvider);
    ref.invalidate(localCorporateGroupsProvider);
    ref.invalidate(groupAssignmentsProvider);
    ref.invalidate(relationshipsProvider);
    ref.invalidate(relationshipDetailProvider);
    ref.invalidate(currentTenantIdProvider);
    ref.invalidate(clientAppsProvider);
    ref.invalidate(securitySettingsProvider);
    ref.invalidate(loginProvider);
  }
}
