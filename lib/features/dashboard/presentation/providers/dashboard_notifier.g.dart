// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Resumen real del dashboard (KPIs + parties recientes).

@ProviderFor(DashboardNotifier)
final dashboardProvider = DashboardNotifierProvider._();

/// Resumen real del dashboard (KPIs + parties recientes).
final class DashboardNotifierProvider
    extends $AsyncNotifierProvider<DashboardNotifier, DashboardSummary> {
  /// Resumen real del dashboard (KPIs + parties recientes).
  DashboardNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dashboardProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dashboardNotifierHash();

  @$internal
  @override
  DashboardNotifier create() => DashboardNotifier();
}

String _$dashboardNotifierHash() => r'4a4a2e97ff3c1369ffed7c8331e2b412003daf9c';

/// Resumen real del dashboard (KPIs + parties recientes).

abstract class _$DashboardNotifier extends $AsyncNotifier<DashboardSummary> {
  FutureOr<DashboardSummary> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<DashboardSummary>, DashboardSummary>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<DashboardSummary>, DashboardSummary>,
              AsyncValue<DashboardSummary>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
