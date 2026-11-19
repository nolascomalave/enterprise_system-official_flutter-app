import 'dart:async';

import 'package:enterprise_app/core/ui/skeleton.dart';
import 'package:enterprise_app/features/dashboard/domain/entities/dashboard_summary.dart';
import 'package:enterprise_app/features/dashboard/domain/repositories/dashboard_repository.dart';
import 'package:enterprise_app/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:enterprise_app/features/dashboard/presentation/providers/dashboard_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

class FakeDashboardRepository implements DashboardRepository {
  FakeDashboardRepository({this.completer, this.error});

  Completer<DashboardSummary>? completer;
  Object? error;

  @override
  Future<DashboardSummary> getSummary() {
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
    RecentParty(
      id: 'p2',
      displayName: 'Acme Corp',
      type: RecentPartyType.organization,
      status: 'ACTIVE',
      createdAt: '2026-11-17T10:00:00Z',
    ),
  ],
);

Widget buildPage(FakeDashboardRepository repository) {
  return ProviderScope(
    overrides: [
      dashboardRepositoryProvider.overrideWith((ref) async => repository),
    ],
    child: MaterialApp(
      theme: ThemeData.dark(useMaterial3: true)
          .copyWith(splashFactory: InkRipple.splashFactory),
      home: const Scaffold(body: DashboardPage()),
    ),
  );
}

void main() {
  testWidgets('muestra skeletons al cargar y luego las 3 tarjetas KPI',
      (tester) async {
    final repository = FakeDashboardRepository(
      completer: Completer<DashboardSummary>(),
    );

    await tester.pumpWidget(buildPage(repository));
    await tester.pump();

    // Skeleton (sin spinners genéricos).
    expect(find.byType(SkeletonBox), findsWidgets);
    expect(find.byType(CircularProgressIndicator), findsNothing);

    repository.completer!.complete(summary);
    await tester.pump();
    await tester.pumpAndSettle();

    // 3 tarjetas KPI con valores reales.
    expect(find.text('Total Parties'), findsOneWidget);
    expect(find.text('Empleados'), findsOneWidget);
    expect(find.text('Departamentos'), findsOneWidget);
    expect(find.text('1.248'), findsOneWidget);
    expect(find.text('86'), findsOneWidget);
    expect(find.text('12'), findsOneWidget);

    // Tabla enlazada a recent_parties.
    expect(find.text('Últimos registros'), findsOneWidget);
    expect(find.text('Juan Pérez'), findsOneWidget);
    expect(find.text('Acme Corp'), findsOneWidget);
  });

  testWidgets('muestra error y permite reintentar', (tester) async {
    final repository = FakeDashboardRepository(
      error: Exception('network down'),
    );

    await tester.pumpWidget(buildPage(repository));
    await tester.pumpAndSettle();

    expect(find.text('No se pudo cargar el resumen del dashboard'), findsOneWidget);
    expect(find.text('Reintentar'), findsOneWidget);
  });
}
