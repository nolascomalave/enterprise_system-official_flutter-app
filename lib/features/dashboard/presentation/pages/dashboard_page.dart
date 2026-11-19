import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/ui/skeleton.dart';
import '../../domain/entities/dashboard_summary.dart';
import '../providers/dashboard_notifier.dart';

class DashboardPage extends ConsumerWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final summaryAsync = ref.watch(dashboardProvider);

    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(24, 24, 24, 120),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1120),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const _DashboardHeader(),
                const SizedBox(height: 24),
                summaryAsync.when(
                  loading: () => const _DashboardSkeleton(),
                  error: (error, _) => _ErrorState(
                    onRetry: () => ref.invalidate(dashboardProvider),
                  ),
                  data: (summary) => Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _KpiGrid(summary: summary),
                      const SizedBox(height: 24),
                      _RecentPartiesCard(parties: summary.recentParties),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Formatea enteros con separador de miles (p. ej. 1248 → 1.248).
String formatCount(int value) {
  final digits = value.abs().toString();
  final buffer = StringBuffer();
  for (var i = 0; i < digits.length; i++) {
    if (i > 0 && (digits.length - i) % 3 == 0) buffer.write('.');
    buffer.write(digits[i]);
  }
  return '${value < 0 ? '-' : ''}$buffer';
}

class _DashboardHeader extends StatelessWidget {
  const _DashboardHeader();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Buenos días, Ana',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                  letterSpacing: -0.6,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                'Resumen general de Acme Corporation',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 13,
                  color: isDark
                      ? AppColors.darkTextSecondary
                      : AppColors.lightTextSecondary,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 16),
        Container(
          width: 40,
          height: 40,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [AppColors.indigo, AppColors.purple],
            ),
            border: Border.all(
              color: AppColors.indigo.withValues(alpha: 0.3),
              width: 2,
            ),
          ),
          child: const Text(
            'AG',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}

class _KpiGrid extends StatelessWidget {
  const _KpiGrid({required this.summary});

  final DashboardSummary summary;

  @override
  Widget build(BuildContext context) {
    final kpis = [
      _KpiData(
        label: 'Total Parties',
        value: summary.totalParties,
        caption: 'en la organización',
        icon: Icons.groups_2_outlined,
        gradient: const [AppColors.indigo, AppColors.purple],
      ),
      _KpiData(
        label: 'Empleados',
        value: summary.totalEmployees,
        caption: 'activos',
        icon: Icons.badge_outlined,
        gradient: const [Color(0xFF10B981), Color(0xFF14B8A6)],
      ),
      _KpiData(
        label: 'Departamentos',
        value: summary.totalDepartments,
        caption: 'unidades organizativas',
        icon: Icons.business_outlined,
        gradient: const [Color(0xFFF59E0B), Color(0xFFF97316)],
      ),
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 840) {
          return Row(
            children: [
              for (var i = 0; i < kpis.length; i++) ...[
                if (i > 0) const SizedBox(width: 20),
                Expanded(child: _KpiCard(data: kpis[i])),
              ],
            ],
          );
        }
        return Column(
          children: [
            for (var i = 0; i < kpis.length; i++) ...[
              if (i > 0) const SizedBox(height: 16),
              _KpiCard(data: kpis[i]),
            ],
          ],
        );
      },
    );
  }
}

class _KpiData {
  const _KpiData({
    required this.label,
    required this.value,
    required this.caption,
    required this.icon,
    required this.gradient,
  });

  final String label;
  final int value;
  final String caption;
  final IconData icon;
  final List<Color> gradient;
}

class _KpiCard extends StatelessWidget {
  const _KpiCard({required this.data});

  final _KpiData data;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final secondary =
        isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary;

    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSurface : AppColors.lightSurface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: theme.colorScheme.outline),
        boxShadow: isDark ? AppShadows.premiumDark : AppShadows.premiumLight,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  data.label,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: secondary,
                  ),
                ),
              ),
              Container(
                width: 36,
                height: 36,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(colors: data.gradient),
                ),
                child: Icon(data.icon, size: 17, color: Colors.white),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            formatCount(data.value),
            style: theme.textTheme.headlineLarge?.copyWith(
              fontSize: 34,
              fontWeight: FontWeight.w600,
              letterSpacing: -1.4,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            data.caption,
            style: TextStyle(fontSize: 11.5, color: secondary),
          ),
        ],
      ),
    );
  }
}

class _RecentPartiesCard extends StatelessWidget {
  const _RecentPartiesCard({required this.parties});

  final List<RecentParty> parties;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSurface : AppColors.lightSurface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: theme.colorScheme.outline),
        boxShadow: isDark ? AppShadows.premiumDark : AppShadows.premiumLight,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 14),
            child: Text(
              'Últimos registros',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
                letterSpacing: -0.3,
              ),
            ),
          ),
          Divider(height: 1, color: theme.colorScheme.outline),
          if (parties.isEmpty)
            Padding(
              padding: const EdgeInsets.all(24),
              child: Center(
                child: Text(
                  'Sin registros recientes',
                  style: TextStyle(
                    fontSize: 13,
                    color: isDark
                        ? AppColors.darkTextSecondary
                        : AppColors.lightTextSecondary,
                  ),
                ),
              ),
            )
          else
            LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth >= 720) {
                  return _RecentPartiesTable(parties: parties);
                }
                return _RecentPartiesList(parties: parties);
              },
            ),
        ],
      ),
    );
  }
}

class _RecentPartiesTable extends StatelessWidget {
  const _RecentPartiesTable({required this.parties});

  final List<RecentParty> parties;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final secondary =
        isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary;

    Widget header(String label, int flex) => Expanded(
          flex: flex,
          child: Text(
            label,
            style: TextStyle(
              fontSize: 10.5,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.2,
              color: secondary,
            ),
          ),
        );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          color: secondary.withValues(alpha: 0.03),
          child: Row(
            children: [
              header('REGISTRO', 5),
              header('TIPO', 3),
              header('ESTADO', 3),
              header('FECHA', 3),
            ],
          ),
        ),
        for (var i = 0; i < parties.length; i++) ...[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Row(
                    children: [
                      _PartyAvatar(party: parties[i]),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          parties[i].displayName,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    parties[i].type.label,
                    style: TextStyle(fontSize: 12.5, color: secondary),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: _StatusBadge(active: parties[i].isActive),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    parties[i].dateLabel,
                    style: TextStyle(fontSize: 12, color: secondary),
                  ),
                ),
              ],
            ),
          ),
          if (i < parties.length - 1)
            Divider(
              height: 1,
              color: theme.colorScheme.outline.withValues(alpha: 0.5),
            ),
        ],
      ],
    );
  }
}

class _RecentPartiesList extends StatelessWidget {
  const _RecentPartiesList({required this.parties});

  final List<RecentParty> parties;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final secondary =
        isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary;

    return Column(
      children: [
        for (var i = 0; i < parties.length; i++) ...[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                _PartyAvatar(party: parties[i], size: 36),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        parties[i].displayName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        '${parties[i].type.label} · ${parties[i].dateLabel}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 11, color: secondary),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                _StatusBadge(active: parties[i].isActive),
              ],
            ),
          ),
          if (i < parties.length - 1)
            Divider(
              height: 1,
              color: theme.colorScheme.outline.withValues(alpha: 0.5),
            ),
        ],
      ],
    );
  }
}

class _PartyAvatar extends StatelessWidget {
  const _PartyAvatar({required this.party, this.size = 32});

  final RecentParty party;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(colors: [AppColors.indigo, AppColors.purple]),
      ),
      child: Text(
        party.initials,
        style: TextStyle(
          fontSize: size * 0.34,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  const _StatusBadge({required this.active});

  final bool active;

  @override
  Widget build(BuildContext context) {
    final color = active ? AppColors.success : AppColors.danger;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: color.withValues(alpha: 0.2)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(shape: BoxShape.circle, color: color),
          ),
          const SizedBox(width: 5),
          Text(
            active ? 'Activo' : 'Inactivo',
            style: TextStyle(
              fontSize: 10.5,
              fontWeight: FontWeight.w500,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}

class _DashboardSkeleton extends StatelessWidget {
  const _DashboardSkeleton();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    Widget cardChild() => Padding(
          padding: const EdgeInsets.all(22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Row(
                children: [
                  SkeletonBox(width: 90, height: 12),
                  Spacer(),
                  SkeletonBox(width: 36, height: 36, borderRadius: 10),
                ],
              ),
              SizedBox(height: 14),
              SkeletonBox(width: 120, height: 30, borderRadius: 8),
              SizedBox(height: 12),
              SkeletonBox(width: 80, height: 10),
            ],
          ),
        );

    Widget card() => Container(
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: theme.colorScheme.outline),
          ),
          child: cardChild(),
        );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth >= 840) {
              return Row(
                children: [
                  for (var i = 0; i < 3; i++) ...[
                    if (i > 0) const SizedBox(width: 20),
                    Expanded(child: card()),
                  ],
                ],
              );
            }
            return Column(
              children: [
                for (var i = 0; i < 3; i++) ...[
                  if (i > 0) const SizedBox(height: 16),
                  card(),
                ],
              ],
            );
          },
        ),
        const SizedBox(height: 24),
        Container(
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: theme.colorScheme.outline),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(20, 16, 20, 14),
                child: SkeletonBox(width: 140, height: 14),
              ),
              Divider(height: 1, color: theme.colorScheme.outline),
              for (var i = 0; i < 5; i++) ...[
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                  child: Row(
                    children: [
                      SkeletonBox(width: 32, height: 32, borderRadius: 999),
                      SizedBox(width: 12),
                      Expanded(child: SkeletonBox(height: 12)),
                      SizedBox(width: 40),
                      SkeletonBox(width: 64, height: 12),
                    ],
                  ),
                ),
                if (i < 4)
                  Divider(
                    height: 1,
                    color: theme.colorScheme.outline.withValues(alpha: 0.5),
                  ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}

class _ErrorState extends StatelessWidget {
  const _ErrorState({required this.onRetry});

  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: theme.colorScheme.outline),
      ),
      child: Column(
        children: [
          Icon(
            Icons.cloud_off_outlined,
            size: 28,
            color: theme.textTheme.bodySmall?.color,
          ),
          const SizedBox(height: 10),
          const Text('No se pudo cargar el resumen del dashboard'),
          const SizedBox(height: 10),
          FilledButton.tonal(onPressed: onRetry, child: const Text('Reintentar')),
        ],
      ),
    );
  }
}
