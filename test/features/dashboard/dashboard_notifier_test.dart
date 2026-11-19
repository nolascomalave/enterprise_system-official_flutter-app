import 'dart:async';

import 'package:enterprise_app/features/dashboard/domain/entities/dashboard_summary.dart';
import 'package:enterprise_app/features/dashboard/domain/repositories/dashboard_repository.dart';
import 'package:enterprise_app/features/dashboard/presentation/providers/dashboard_notifier.dart';
import 'package:enterprise_app/features/dashboard/presentation/providers/dashboard_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

class FakeDashboardRepository implements DashboardRepository {
  FakeDashboardRepository({this.completer});

  Completer<DashboardSummary>? completer;
  int calls = 0;
  Object? error;

  @override
  Future<DashboardSummary> getSummary() {
    calls++;
    if (error != null) return Future.error(error!);
    return (completer ?? Completer<DashboardSummary>()).future;
  }
}

const summary = DashboardSummary(
  totalParties: 1248,
  totalEmployees: 86,
  totalDepartments: 12,
  recentParties: [
    RecentParty(
      id: 'p1',
      displayName: 'Juan Pérez',
      type: RecentPartyType.individual,
      status: 'ACTIVE',
      createdAt: '2026-11-18T10:00:00Z',
    ),
  ],
);

void main() {
  test('transita de loading a data', () async {
    final repository = FakeDashboardRepository(
      completer: Completer<DashboardSummary>(),
    );
    final container = ProviderContainer(
      overrides: [
        dashboardRepositoryProvider.overrideWith((ref) async => repository),
      ],
    );
    addTearDown(container.dispose);
    final sub = container.listen(dashboardProvider, (_, _) {});
    addTearDown(sub.close);

    final future = container.read(dashboardProvider.future);
    expect(container.read(dashboardProvider), isA<AsyncLoading>());

    repository.completer!.complete(summary);
    final data = await future;

    expect(data.totalParties, 1248);
    expect(data.totalEmployees, 86);
    expect(data.totalDepartments, 12);
    expect(data.recentParties.single.displayName, 'Juan Pérez');
    expect(container.read(dashboardProvider), isA<AsyncData<DashboardSummary>>());
    expect(repository.calls, 1);
  });
}
