import 'package:intl/intl.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../core/i18n/l10n_ext.dart';

/// Fecha relativa de una notificación ("Hace 5 min", "Hace 2 h"...).
String notificationRelativeTime(BuildContext context, DateTime createdAt) {
  final local = createdAt.toLocal();
  final difference = DateTime.now().difference(local);

  if (difference.inSeconds < 60) return context.l10n.notificationJustNow;
  if (difference.inMinutes < 60) {
    return context.l10n.notificationMinutesAgo(difference.inMinutes);
  }
  if (difference.inHours < 24) {
    return context.l10n.notificationHoursAgo(difference.inHours);
  }
  if (difference.inDays < 7) {
    return context.l10n.notificationDaysAgo(difference.inDays);
  }
  return DateFormat.yMMMd(Localizations.localeOf(context).toLanguageTag())
      .format(local);
}
