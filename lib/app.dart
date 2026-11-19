import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

import 'core/i18n/generated/app_localizations.dart';
import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';
import 'features/preferences/domain/entities/user_preferences.dart';
import 'features/preferences/presentation/providers/preferences_notifier.dart';

class EnterpriseApp extends ConsumerWidget {
  const EnterpriseApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    final preferences =
        ref.watch(preferencesProvider).value ?? UserPreferences.defaults;

    return MaterialApp.router(
      title: 'Enterprise App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: preferences.themeMode,
      locale: preferences.locale,
      routerConfig: router,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
