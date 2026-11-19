import '../entities/dashboard_summary.dart';

/// Puerto del dashboard.
abstract interface class DashboardRepository {
  Future<DashboardSummary> getSummary();
}
