import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/entities/dashboard_summary.dart';
import 'dashboard_providers.dart';

part 'dashboard_notifier.g.dart';

/// Resumen real del dashboard (KPIs + parties recientes).
@riverpod
class DashboardNotifier extends _$DashboardNotifier {
  @override
  Future<DashboardSummary> build() async {
    final useCase = await ref.watch(getDashboardSummaryUseCaseProvider.future);
    return useCase();
  }

  Future<void> refresh() async {
    ref.invalidateSelf();
    await future;
  }
}
