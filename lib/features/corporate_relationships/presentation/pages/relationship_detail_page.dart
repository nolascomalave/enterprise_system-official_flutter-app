import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../core/i18n/l10n_ext.dart';
import '../../../../core/network/api_exception.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/ui/skeleton.dart';
import '../../domain/entities/corporate_relationship.dart';
import '../../domain/errors/relationship_not_found_exception.dart';
import '../providers/relationship_detail_notifier.dart';
import '../providers/relationships_notifier.dart';
import '../providers/relationships_providers.dart';
import '../widgets/relationship_dialogs.dart';

/// Detalle de una relación corporativa con timeline y acciones.
class RelationshipDetailPage extends ConsumerWidget {
  const RelationshipDetailPage({super.key, required this.relationshipId});

  final String relationshipId;

  Future<void> _emitToken(
    BuildContext context,
    WidgetRef ref,
    CorporateRelationship relationship,
  ) async {
    try {
      final token = await ref
          .read(relationshipsProvider.notifier)
          .emitToken(relationship.id);
      if (!context.mounted) return;
      await showEmitTokenDialog(context, token);
    } catch (error) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            error is ApiException
                ? error.message
                : context.l10n.couldNotIssueToken,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final relationshipAsync = ref.watch(
      relationshipDetailProvider(relationshipId),
    );
    final tenantId = ref.watch(currentTenantIdProvider).value;
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          tooltip: context.l10n.back,
          onPressed: () {
            if (context.canPop()) {
              context.pop();
            } else {
              context.go('/corporate-relationships');
            }
          },
          icon: const Icon(Icons.arrow_back_rounded, size: 20),
        ),
        title: Text(context.l10n.relationshipDetailTitle),
      ),
      body: relationshipAsync.when(
        loading: () => const _RelationshipDetailSkeleton(),
        error: (error, _) => Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                error is RelationshipNotFoundException
                    ? context.l10n.relationshipNotFound
                    : context.l10n.relationshipDetailError,
                style: theme.textTheme.bodyMedium,
              ),
              const SizedBox(height: 8),
              TextButton(
                onPressed: () {
                  ref.invalidate(relationshipsProvider);
                  ref.invalidate(relationshipDetailProvider(relationshipId));
                },
                child: Text(context.l10n.retry),
              ),
            ],
          ),
        ),
        data: (relationship) {
          final role = relationship.roleFor(tenantId);
          return _RelationshipDetailBody(
            relationship: relationship,
            role: role,
            onEmitToken: () => _emitToken(context, ref, relationship),
            onConsumeToken: () => showConsumeTokenDialog(context, ref),
            onRevoke: () =>
                showRevokeRelationshipDialog(context, ref, relationship.id),
          );
        },
      ),
    );
  }
}

class _RelationshipDetailBody extends StatelessWidget {
  const _RelationshipDetailBody({
    required this.relationship,
    required this.role,
    required this.onEmitToken,
    required this.onConsumeToken,
    required this.onRevoke,
  });

  final CorporateRelationship relationship;
  final RelationshipRole role;
  final VoidCallback onEmitToken;
  final VoidCallback onConsumeToken;
  final VoidCallback onRevoke;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(24, 20, 24, 120),
      children: [
        _SplitHeader(relationship: relationship),
        const SizedBox(height: 20),
        _ActionsCard(
          relationship: relationship,
          role: role,
          onEmitToken: onEmitToken,
          onConsumeToken: onConsumeToken,
          onRevoke: onRevoke,
        ),
        const SizedBox(height: 16),
        _Timeline(relationship: relationship),
      ],
    );
  }
}

class _SplitHeader extends StatelessWidget {
  const _SplitHeader({required this.relationship});

  final CorporateRelationship relationship;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 22, 20, 18),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: theme.colorScheme.outline),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: _EntityAvatar(
                  label: relationship.holdingLabel,
                  caption: context.l10n.colHolding,
                  icon: Icons.apartment_rounded,
                  gradient: const [AppColors.indigo, AppColors.purple],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Icon(
                  Icons.arrow_forward_rounded,
                  size: 20,
                  color: theme.textTheme.bodySmall?.color,
                ),
              ),
              Expanded(
                child: _EntityAvatar(
                  label: relationship.subsidiaryLabel,
                  caption: context.l10n.colSubsidiary,
                  icon: Icons.business_outlined,
                  gradient: const [Color(0xFF0EA5E9), AppColors.indigo],
                  alignEnd: true,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 6,
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              _StatusBadge(status: relationship.status),
              Text(
                relationship.dateLabel,
                style: TextStyle(
                  fontSize: 11,
                  color: theme.textTheme.bodySmall?.color,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _EntityAvatar extends StatelessWidget {
  const _EntityAvatar({
    required this.label,
    required this.caption,
    required this.icon,
    required this.gradient,
    this.alignEnd = false,
  });

  final String label;
  final String caption;
  final IconData icon;
  final List<Color> gradient;
  final bool alignEnd;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: alignEnd
          ? CrossAxisAlignment.end
          : CrossAxisAlignment.start,
      children: [
        Container(
          width: 56,
          height: 56,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: gradient,
            ),
          ),
          child: Text(
            _initials(label),
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          caption,
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.8,
            color: theme.textTheme.bodySmall?.color,
          ),
        ),
        const SizedBox(height: 2),
        Row(
          mainAxisAlignment: alignEnd
              ? MainAxisAlignment.end
              : MainAxisAlignment.start,
          children: [
            Icon(icon, size: 13, color: AppColors.indigo),
            const SizedBox(width: 5),
            Flexible(
              child: Text(
                label,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: alignEnd ? TextAlign.end : TextAlign.start,
                style: const TextStyle(
                  fontSize: 12.5,
                  fontWeight: FontWeight.w600,
                  height: 1.25,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _ActionsCard extends StatelessWidget {
  const _ActionsCard({
    required this.relationship,
    required this.role,
    required this.onEmitToken,
    required this.onConsumeToken,
    required this.onRevoke,
  });

  final CorporateRelationship relationship;
  final RelationshipRole role;
  final VoidCallback onEmitToken;
  final VoidCallback onConsumeToken;
  final VoidCallback onRevoke;

  @override
  Widget build(BuildContext context) {
    final actions = <Widget>[];
    if (relationship.status == RelationshipStatus.pending) {
      if (role == RelationshipRole.holding) {
        actions.add(
          _PrimaryAction(
            key: const Key('relationship_action_emit'),
            icon: Icons.vpn_key_outlined,
            label: context.l10n.emitToken,
            onTap: onEmitToken,
          ),
        );
      } else if (role == RelationshipRole.subsidiary) {
        actions.add(
          _PrimaryAction(
            key: const Key('relationship_action_consume'),
            icon: Icons.key_rounded,
            label: context.l10n.consumeToken,
            onTap: onConsumeToken,
          ),
        );
      }
    } else if (relationship.status == RelationshipStatus.approved &&
        role == RelationshipRole.holding) {
      actions.add(
        _DangerAction(
          key: const Key('relationship_action_revoke'),
          icon: Icons.link_off_rounded,
          label: context.l10n.revokeAction,
          onTap: onRevoke,
        ),
      );
    }

    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: theme.colorScheme.outline),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              actions.isEmpty
                  ? context.l10n.relationshipNoActions
                  : context.l10n.actions,
              style: TextStyle(
                fontSize: 12,
                color: theme.textTheme.bodySmall?.color,
              ),
            ),
          ),
          if (actions.isNotEmpty) ...[const SizedBox(width: 12), ...actions],
        ],
      ),
    );
  }
}

class _PrimaryAction extends StatelessWidget {
  const _PrimaryAction({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
      onPressed: onTap,
      icon: Icon(icon, size: 16),
      label: Text(label),
      style: FilledButton.styleFrom(
        backgroundColor: AppColors.indigo,
        foregroundColor: Colors.white,
      ),
    );
  }
}

class _DangerAction extends StatelessWidget {
  const _DangerAction({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: onTap,
      icon: Icon(icon, size: 16),
      label: Text(label),
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.danger,
        side: BorderSide(color: AppColors.danger.withValues(alpha: 0.4)),
      ),
    );
  }
}

class _Timeline extends StatelessWidget {
  const _Timeline({required this.relationship});

  final CorporateRelationship relationship;

  @override
  Widget build(BuildContext context) {
    final events = _events(context, relationship);
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.fromLTRB(18, 18, 18, 6),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: theme.colorScheme.outline),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.l10n.colStatus,
            style: theme.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 14),
          for (var i = 0; i < events.length; i++)
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    width: 18,
                    child: Column(
                      children: [
                        Container(
                          width: 10,
                          height: 10,
                          margin: const EdgeInsets.only(top: 4),
                          decoration: BoxDecoration(
                            color: events[i].color,
                            shape: BoxShape.circle,
                          ),
                        ),
                        if (i < events.length - 1)
                          Expanded(
                            child: Container(
                              width: 2,
                              margin: const EdgeInsets.symmetric(vertical: 3),
                              color: theme.colorScheme.outline,
                            ),
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 18),
                      child: _TimelineEventTile(event: events[i]),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class _TimelineEventTile extends StatelessWidget {
  const _TimelineEventTile({required this.event});

  final _TimelineEvent event;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(event.icon, size: 15, color: event.color),
            const SizedBox(width: 7),
            Expanded(
              child: Text(
                event.title,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            if (event.date != null)
              Text(
                _dateLabel(event.date),
                style: TextStyle(
                  fontSize: 10.5,
                  color: theme.textTheme.bodySmall?.color,
                ),
              ),
          ],
        ),
        if (event.reason != null && event.reason!.trim().isNotEmpty) ...[
          const SizedBox(height: 6),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerHighest.withValues(
                alpha: 0.35,
              ),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: theme.colorScheme.outline),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (event.reasonLabel != null)
                  Text(
                    event.reasonLabel!,
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: theme.textTheme.bodySmall?.color,
                    ),
                  ),
                const SizedBox(height: 2),
                Text(event.reason!, style: const TextStyle(fontSize: 12)),
              ],
            ),
          ),
        ],
      ],
    );
  }
}

class _TimelineEvent {
  const _TimelineEvent({
    required this.title,
    required this.icon,
    required this.color,
    this.date,
    this.reason,
    this.reasonLabel,
  });

  final String title;
  final IconData icon;
  final Color color;
  final String? date;
  final String? reason;
  final String? reasonLabel;
}

List<_TimelineEvent> _events(
  BuildContext context,
  CorporateRelationship relationship,
) {
  final events = <_TimelineEvent>[
    _TimelineEvent(
      title: context.l10n.timelineStarted,
      date: relationship.startedAt,
      icon: Icons.flag_outlined,
      color: AppColors.indigo,
    ),
  ];

  if (relationship.tokenEmittedAt != null) {
    events.add(
      _TimelineEvent(
        title: context.l10n.timelineTokenEmitted,
        date: relationship.tokenEmittedAt,
        icon: Icons.vpn_key_outlined,
        color: AppColors.warning,
      ),
    );
  }

  if (relationship.approvedAt != null ||
      relationship.status == RelationshipStatus.approved) {
    events.add(
      _TimelineEvent(
        title: context.l10n.timelineApproved,
        date: relationship.approvedAt,
        icon: Icons.check_circle_outline_rounded,
        color: AppColors.success,
      ),
    );
  }

  if (relationship.rejectedAt != null ||
      relationship.status == RelationshipStatus.rejected) {
    events.add(
      _TimelineEvent(
        title: context.l10n.timelineRejected,
        date: relationship.rejectedAt,
        icon: Icons.cancel_outlined,
        color: AppColors.danger,
        reason: relationship.rejectionReason,
        reasonLabel: context.l10n.rejectionReasonLabel,
      ),
    );
  }

  if (relationship.status == RelationshipStatus.revoked ||
      relationship.revokedAt != null) {
    events.add(
      _TimelineEvent(
        title: context.l10n.timelineRevoked,
        date: relationship.revokedAt,
        icon: Icons.link_off_rounded,
        color: const Color(0xFF991B1B),
        reason: relationship.revocationReason,
        reasonLabel: context.l10n.revocationReasonLabel,
      ),
    );
  }

  if (relationship.status == RelationshipStatus.cancelled ||
      relationship.canceledAt != null) {
    events.add(
      _TimelineEvent(
        title: context.l10n.timelineCancelled,
        date: relationship.canceledAt,
        icon: Icons.block_rounded,
        color: const Color(0xFF71717A),
        reason: relationship.cancellationReason,
        reasonLabel: context.l10n.cancellationReasonLabel,
      ),
    );
  }

  return events;
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
            _statusLabel(context, status),
            style: TextStyle(
              fontSize: 10.5,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}

class _RelationshipDetailSkeleton extends StatelessWidget {
  const _RelationshipDetailSkeleton();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(24),
      children: const [
        SkeletonBox(height: 160, borderRadius: 16),
        SizedBox(height: 16),
        SkeletonBox(height: 64, borderRadius: 14),
        SizedBox(height: 16),
        SkeletonBox(height: 220, borderRadius: 14),
      ],
    );
  }
}

String _dateLabel(String? iso) {
  if (iso == null || iso.isEmpty) return '—';
  final local = DateTime.tryParse(iso)?.toLocal();
  if (local == null) return iso.length >= 10 ? iso.substring(0, 10) : iso;
  final date = local.toIso8601String();
  return date.substring(0, 10);
}

String _initials(String name) {
  final parts = name
      .trim()
      .split(RegExp(r'\s+'))
      .where((part) => part.isNotEmpty)
      .toList();
  if (parts.isEmpty) return '?';
  if (parts.length == 1) {
    final single = parts.first;
    return (single.length >= 2 ? single.substring(0, 2) : single).toUpperCase();
  }
  return '${parts.first.substring(0, 1)}${parts[1].substring(0, 1)}'
      .toUpperCase();
}

String _statusLabel(BuildContext context, RelationshipStatus status) =>
    switch (status) {
      RelationshipStatus.pending => context.l10n.statusPending,
      RelationshipStatus.approved => context.l10n.statusApproved,
      RelationshipStatus.rejected => context.l10n.statusRejected,
      RelationshipStatus.revoked => context.l10n.statusRevoked,
      RelationshipStatus.cancelled => context.l10n.statusCancelled,
      RelationshipStatus.unknown => context.l10n.statusUnknown,
    };

Color _statusColor(RelationshipStatus status) => switch (status) {
  RelationshipStatus.pending => AppColors.warning,
  RelationshipStatus.approved => AppColors.success,
  RelationshipStatus.rejected => AppColors.danger,
  RelationshipStatus.revoked => const Color(0xFF991B1B),
  RelationshipStatus.cancelled => const Color(0xFF71717A),
  RelationshipStatus.unknown => const Color(0xFF71717A),
};
