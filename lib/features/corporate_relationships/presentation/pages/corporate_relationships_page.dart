import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../core/network/api_exception.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/ui/skeleton.dart';
import '../../domain/entities/corporate_relationship.dart';
import '../providers/relationships_notifier.dart';
import '../providers/relationships_providers.dart';
import '../widgets/relationship_dialogs.dart';

class CorporateRelationshipsPage extends ConsumerWidget {
  const CorporateRelationshipsPage({super.key});

  Future<void> _emitToken(
    BuildContext context,
    WidgetRef ref,
    CorporateRelationship relationship,
  ) async {
    try {
      final token =
          await ref.read(relationshipsProvider.notifier).emitToken(relationship.id);
      if (!context.mounted) return;
      await showEmitTokenDialog(context, token);
    } catch (error) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            error is ApiException ? error.message : 'No se pudo emitir el token.',
          ),
        ),
      );
    }
  }

  void _onAction(
    BuildContext context,
    WidgetRef ref,
    CorporateRelationship relationship,
    String action,
  ) {
    switch (action) {
      case 'emit':
        _emitToken(context, ref, relationship);
      case 'consume':
        showConsumeTokenDialog(context, ref);
      case 'reject':
        showRejectRelationshipDialog(context, ref, relationship.id);
      case 'revoke':
        showRevokeRelationshipDialog(context, ref, relationship.id);
      case 'cancel':
        showCancelRelationshipDialog(context, ref, relationship.id);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final relationAsync = ref.watch(relationshipsProvider);
    final tenantId = ref.watch(currentTenantIdProvider).value;
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return SafeArea(
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1120),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 24, 24, 120),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _Header(onCreate: () => showNewRelationshipDialog(context, ref)),
                const SizedBox(height: 20),
                Expanded(
                  child: relationAsync.when(
                    loading: () => const _RelationshipsSkeleton(),
                    error: (error, _) => Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text('No se pudieron cargar las relaciones'),
                          const SizedBox(height: 8),
                          TextButton(
                            onPressed: () => ref.invalidate(relationshipsProvider),
                            child: const Text('Reintentar'),
                          ),
                        ],
                      ),
                    ),
                    data: (relationships) {
                      return Container(
                        decoration: BoxDecoration(
                          color: isDark ? AppColors.darkSurface : Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: theme.colorScheme.outline),
                          boxShadow: isDark
                              ? AppShadows.premiumDark
                              : AppShadows.premiumLight,
                        ),
                        child: relationships.isEmpty
                            ? _EmptyState(
                                onCreate: () =>
                                    showNewRelationshipDialog(context, ref),
                              )
                            : LayoutBuilder(
                                builder: (context, constraints) {
                                  if (constraints.maxWidth >= 760) {
                                    return _RelationshipsTable(
                                      relationships: relationships,
                                      tenantId: tenantId,
                                      onAction: (relationship, action) => _onAction(
                                        context,
                                        ref,
                                        relationship,
                                        action,
                                      ),
                                    );
                                  }
                                  return _RelationshipsList(
                                    relationships: relationships,
                                    tenantId: tenantId,
                                    onAction: (relationship, action) => _onAction(
                                      context,
                                      ref,
                                      relationship,
                                      action,
                                    ),
                                  );
                                },
                              ),
                      );
                    },
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

class _Header extends StatelessWidget {
  const _Header({required this.onCreate});

  final VoidCallback onCreate;

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
                'Relaciones Corporativas',
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                  letterSpacing: -0.6,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                'Estructura holding-filial de tus tenants',
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
        const SizedBox(width: 12),
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Material(
            color: Colors.transparent,
            child: Ink(
              height: 42,
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [AppColors.indigo, AppColors.violet]),
              ),
              child: InkWell(
                onTap: onCreate,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(Icons.add_rounded, size: 17, color: Colors.white),
                      SizedBox(width: 6),
                      Text(
                        'Nueva Relación',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

Color _statusColor(RelationshipStatus status) => switch (status) {
      RelationshipStatus.pending => AppColors.warning,
      RelationshipStatus.approved => AppColors.success,
      RelationshipStatus.rejected => AppColors.danger,
      RelationshipStatus.revoked => const Color(0xFF71717A),
      RelationshipStatus.cancelled => const Color(0xFF71717A),
      RelationshipStatus.unknown => const Color(0xFF71717A),
    };

List<PopupMenuEntry<String>> _actionEntries(
  CorporateRelationship relationship,
  RelationshipRole role,
) {
  final entries = <PopupMenuEntry<String>>[];
  if (relationship.status == RelationshipStatus.pending) {
    if (role == RelationshipRole.holding) {
      entries.add(const PopupMenuItem(value: 'emit', child: Text('Emitir token')));
      entries.add(const PopupMenuItem(value: 'cancel', child: Text('Cancelar')));
    } else if (role == RelationshipRole.subsidiary) {
      entries.add(const PopupMenuItem(value: 'consume', child: Text('Consumir token')));
      entries.add(const PopupMenuItem(value: 'reject', child: Text('Rechazar')));
    }
  } else if (relationship.status == RelationshipStatus.approved &&
      role == RelationshipRole.holding) {
    entries.add(const PopupMenuItem(value: 'revoke', child: Text('Revocar')));
  }
  return entries;
}

class _RelationshipsTable extends StatelessWidget {
  const _RelationshipsTable({
    required this.relationships,
    required this.tenantId,
    required this.onAction,
  });

  final List<CorporateRelationship> relationships;
  final String? tenantId;
  final void Function(CorporateRelationship relationship, String action) onAction;

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
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          color: secondary.withValues(alpha: 0.03),
          child: Row(
            children: [
              header('HOLDING', 4),
              header('FILIAL', 4),
              header('ESTADO', 3),
              header('FECHA', 3),
              const SizedBox(width: 40),
            ],
          ),
        ),
        Divider(height: 1, color: theme.colorScheme.outline),
        Expanded(
          child: ListView.separated(
            itemCount: relationships.length,
            separatorBuilder: (context, index) => Divider(
              height: 1,
              color: theme.colorScheme.outline.withValues(alpha: 0.5),
            ),
            itemBuilder: (context, index) {
              final relationship = relationships[index];
              final role = relationship.roleFor(tenantId);
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                child: Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: _PartyLabel(
                        label: relationship.holdingLabel,
                        icon: Icons.apartment_rounded,
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: _PartyLabel(
                        label: relationship.subsidiaryLabel,
                        icon: Icons.business_outlined,
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: _StatusCell(relationship: relationship),
                    ),
                    Expanded(
                      flex: 3,
                      child: Text(
                        relationship.dateLabel,
                        style: TextStyle(fontSize: 12, color: secondary),
                      ),
                    ),
                    SizedBox(
                      width: 40,
                      child: _ActionsMenu(
                        relationship: relationship,
                        role: role,
                        onAction: onAction,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _RelationshipsList extends StatelessWidget {
  const _RelationshipsList({
    required this.relationships,
    required this.tenantId,
    required this.onAction,
  });

  final List<CorporateRelationship> relationships;
  final String? tenantId;
  final void Function(CorporateRelationship relationship, String action) onAction;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final secondary =
        isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary;

    return ListView.separated(
      itemCount: relationships.length,
      separatorBuilder: (context, index) => Divider(
        height: 1,
        color: theme.colorScheme.outline.withValues(alpha: 0.5),
      ),
      itemBuilder: (context, index) {
        final relationship = relationships[index];
        final role = relationship.roleFor(tenantId);
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${relationship.holdingLabel} → ${relationship.subsidiaryLabel}',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        _StatusBadge(status: relationship.status),
                        const SizedBox(width: 8),
                        Text(
                          relationship.dateLabel,
                          style: TextStyle(fontSize: 11, color: secondary),
                        ),
                      ],
                    ),
                    if (relationship.reason != null) ...[
                      const SizedBox(height: 4),
                      Text(
                        relationship.reason!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 11, color: secondary),
                      ),
                    ],
                  ],
                ),
              ),
              _ActionsMenu(
                relationship: relationship,
                role: role,
                onAction: onAction,
              ),
            ],
          ),
        );
      },
    );
  }
}

class _PartyLabel extends StatelessWidget {
  const _PartyLabel({required this.label, required this.icon});

  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 16, color: AppColors.indigo),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }
}

class _StatusCell extends StatelessWidget {
  const _StatusCell({required this.relationship});

  final CorporateRelationship relationship;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final secondary =
        isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _StatusBadge(status: relationship.status),
        if (relationship.reason != null) ...[
          const SizedBox(height: 3),
          Text(
            relationship.reason!,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 10.5, color: secondary),
          ),
        ],
      ],
    );
  }
}

class _StatusBadge extends StatelessWidget {
  const _StatusBadge({required this.status});

  final RelationshipStatus status;

  @override
  Widget build(BuildContext context) {
    final color = _statusColor(status);
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
            status.label,
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

class _ActionsMenu extends StatelessWidget {
  const _ActionsMenu({
    required this.relationship,
    required this.role,
    required this.onAction,
  });

  final CorporateRelationship relationship;
  final RelationshipRole role;
  final void Function(CorporateRelationship relationship, String action) onAction;

  @override
  Widget build(BuildContext context) {
    final entries = _actionEntries(relationship, role);
    if (entries.isEmpty) {
      return Text(
        '—',
        style: TextStyle(
          fontSize: 12,
          color: Theme.of(context).textTheme.bodySmall?.color,
        ),
      );
    }
    return PopupMenuButton<String>(
      tooltip: 'Acciones',
      onSelected: (action) => onAction(relationship, action),
      itemBuilder: (context) => entries,
      icon: const Icon(Icons.more_vert_rounded, size: 18),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState({required this.onCreate});

  final VoidCallback onCreate;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.hub_outlined, size: 36, color: theme.textTheme.bodySmall?.color),
          const SizedBox(height: 10),
          Text('Aún no hay relaciones corporativas', style: theme.textTheme.bodyMedium),
          const SizedBox(height: 4),
          Text('Inicia la primera con "Nueva Relación"', style: theme.textTheme.bodySmall),
        ],
      ),
    );
  }
}

class _RelationshipsSkeleton extends StatelessWidget {
  const _RelationshipsSkeleton();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: theme.colorScheme.outline),
      ),
      child: Column(
        children: [
          for (var i = 0; i < 5; i++) ...[
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Row(
                children: [
                  Expanded(child: SkeletonBox(height: 14)),
                  SizedBox(width: 24),
                  Expanded(child: SkeletonBox(height: 14)),
                  SizedBox(width: 24),
                  SkeletonBox(width: 80, height: 18, borderRadius: 999),
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
    );
  }
}
