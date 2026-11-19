import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/dio_client.dart';
import '../../data/repositories/dashboard_repository_impl.dart';
import '../../domain/repositories/dashboard_repository.dart';
import '../../domain/usecases/get_dashboard_summary_usecase.dart';

final dashboardRepositoryProvider =
    FutureProvider<DashboardRepository>((ref) async {
  final dio = await ref.watch(dioProvider.future);
  return DashboardRepositoryImpl(dio);
});

final getDashboardSummaryUseCaseProvider =
    FutureProvider<GetDashboardSummaryUseCase>((ref) async {
  final repository = await ref.watch(dashboardRepositoryProvider.future);
  return GetDashboardSummaryUseCase(repository);
});
