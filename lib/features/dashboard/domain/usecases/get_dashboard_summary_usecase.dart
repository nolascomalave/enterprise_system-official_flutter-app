import '../entities/dashboard_summary.dart';
import '../repositories/dashboard_repository.dart';

/// Caso de uso: obtener el resumen del dashboard.
class GetDashboardSummaryUseCase {
  const GetDashboardSummaryUseCase(this._repository);

  final DashboardRepository _repository;

  Future<DashboardSummary> call() => _repository.getSummary();
}
