import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart' hide Notification;

import '../../../../core/i18n/l10n_ext.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/ui/skeleton.dart';
import '../../domain/entities/notification.dart';
import '../providers/notifications_notifier.dart';
import 'notification_relative_time.dart';
import 'notification_route.dart';

/// Panel desplegable (desktop) o bottom sheet (móvil) de notificaciones.
class NotificationsPanel extends ConsumerWidget {
  const NotificationsPanel({super.key, this.onClose});

  final VoidCallback? onClose;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final async = ref.watch(notificationsProvider);
    final unread = async.value?.unreadCount ?? 0;

    return Material(
      color: Colors.transparent,
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: isDark ? AppColors.darkSurface : AppColors.lightSurface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: theme.colorScheme.outline),
          boxShadow: isDark ? AppShadows.premiumDark : AppShadows.premiumLight,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 10, 8, 10),
              child: Row(
                children: [
                  Flexible(
                    child: Text(
                      context.l10n.notificationsTitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 14.5,
                        fontWeight: FontWeight.w600,
                        letterSpacing: -0.2,
                      ),
                    ),
                  ),
                  if (unread > 0) ...[
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 7,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFF3B82F6).withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(999),
                      ),
                      child: Text(
                        context.l10n.notificationsUnreadCount(unread),
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF3B82F6),
                        ),
                      ),
                    ),
                  ],
                  const Spacer(),
                  if (onClose != null)
                    IconButton(
                      tooltip: context.l10n.close,
                      onPressed: onClose,
                      visualDensity: VisualDensity.compact,
                      icon: const Icon(Icons.close_rounded, size: 18),
                    ),
                ],
              ),
            ),
            Divider(height: 1, color: theme.colorScheme.outline),
            Expanded(
              child: async.when(
                loading: () => const _NotificationsSkeleton(),
                error: (error, stack) => _NotificationsError(
                  onRetry: () => ref.invalidate(notificationsProvider),
                ),
                data: (state) => state.items.isEmpty
                    ? const _NotificationsEmpty()
                    : ListView.separated(
                        primary: false,
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        itemCount: state.items.length,
                        separatorBuilder: (context, index) => Divider(
                          height: 1,
                          indent: 32,
                          endIndent: 16,
                          color: theme.colorScheme.outline.withValues(
                            alpha: 0.5,
                          ),
                        ),
                        itemBuilder: (context, index) {
                          final item = state.items[index];
                          return _NotificationTile(
                            notification: item,
                            onTap: () => _open(context, ref, item),
                          );
                        },
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _open(
    BuildContext context,
    WidgetRef ref,
    Notification notification,
  ) async {
    final router = GoRouter.of(context);
    final notifier = ref.read(notificationsProvider.notifier);
    final route = notificationRoute(notification);

    try {
      await notifier.markAsRead(notification.id);
    } catch (_) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(context.l10n.notificationMarkReadError)),
        );
      }
    }

    onClose?.call();
    if (route != null) router.go(route);
  }
}

class _NotificationTile extends StatelessWidget {
  const _NotificationTile({required this.notification, required this.onTap});

  final Notification notification;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final secondary = isDark
        ? AppColors.darkTextSecondary
        : AppColors.lightTextSecondary;
    final unread = !notification.isRead;

    return InkWell(
      key: Key('notification_${notification.id}'),
      onTap: onTap,
      child: Container(
        color: unread
            ? const Color(0xFF3B82F6).withValues(alpha: 0.045)
            : Colors.transparent,
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 8,
              height: 18,
              child: unread
                  ? Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        key: Key('notification_unread_${notification.id}'),
                        width: 7,
                        height: 7,
                        decoration: const BoxDecoration(
                          color: Color(0xFF3B82F6),
                          shape: BoxShape.circle,
                        ),
                      ),
                    )
                  : null,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          notification.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 12.8,
                            height: 1.25,
                            fontWeight: unread
                                ? FontWeight.w600
                                : FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        notificationRelativeTime(
                          context,
                          notification.createdAt,
                        ),
                        style: TextStyle(
                          fontSize: 10,
                          color: secondary,
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                  if (notification.body.isNotEmpty) ...[
                    const SizedBox(height: 3),
                    Text(
                      notification.body,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 11.5,
                        height: 1.4,
                        color: secondary,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _NotificationsEmpty extends StatelessWidget {
  const _NotificationsEmpty();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(28),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 46,
              height: 46,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: theme.colorScheme.surfaceContainerHighest.withValues(
                  alpha: 0.5,
                ),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.notifications_off_outlined,
                size: 22,
                color: theme.textTheme.bodySmall?.color,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              context.l10n.notificationsEmpty,
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 3),
            Text(
              context.l10n.notificationsEmptyHint,
              style: TextStyle(
                fontSize: 11.5,
                color: theme.textTheme.bodySmall?.color,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class _NotificationsError extends StatelessWidget {
  const _NotificationsError({required this.onRetry});

  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.cloud_off_outlined,
              size: 26,
              color: theme.textTheme.bodySmall?.color,
            ),
            const SizedBox(height: 8),
            Text(
              context.l10n.notificationsError,
              style: TextStyle(
                fontSize: 12,
                color: theme.textTheme.bodySmall?.color,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            FilledButton.tonal(
              onPressed: onRetry,
              child: Text(context.l10n.retry),
            ),
          ],
        ),
      ),
    );
  }
}

class _NotificationsSkeleton extends StatelessWidget {
  const _NotificationsSkeleton();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      primary: false,
      padding: const EdgeInsets.all(16),
      itemCount: 4,
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemBuilder: (context, index) => const Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SkeletonBox(width: 7, height: 7, borderRadius: 999),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SkeletonBox(width: 170, height: 12),
                SizedBox(height: 7),
                SkeletonBox(width: 110, height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
