import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../core/network/api_exception.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/ui/skeleton.dart';
import '../../../client_apps/domain/entities/client_application.dart';
import '../../../client_apps/presentation/providers/client_apps_notifier.dart';
import '../../../client_apps/presentation/widgets/create_client_app_dialog.dart';
import '../../../preferences/domain/entities/user_preferences.dart';
import '../../../preferences/presentation/providers/preferences_notifier.dart';
import '../../domain/entities/security_settings.dart';
import '../providers/security_settings_notifier.dart';
import '../widgets/security_dialogs.dart';

/// Configuración de seguridad (MFA) — V5 Premium.
class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  Future<void> _configure(
    BuildContext context,
    WidgetRef ref,
    MfaMethod method,
  ) async {
    final notifier = ref.read(securitySettingsProvider.notifier);
    try {
      if (method == MfaMethod.totp) {
        final setup = await notifier.startTotpSetup();
        if (!context.mounted) return;
        await showTotpSetupDialog(context, ref, setup);
      } else {
        await showEnableEmailOtpDialog(context, ref);
      }
    } on ApiException catch (error) {
      if (context.mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(error.message)));
      }
    }
  }

  Future<void> _disable(BuildContext context, WidgetRef ref) =>
      showDisableMfaDialog(context, ref);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final settings = ref.watch(securitySettingsProvider);
    final preferences =
        ref.watch(preferencesProvider).value ?? UserPreferences.defaults;

    Future<void> updateTheme(ThemePreference value) async {
      try {
        await ref.read(preferencesProvider.notifier).setTheme(value);
      } on ApiException catch (error) {
        if (context.mounted) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(error.message)));
        }
      }
    }

    Future<void> updateLocale(String localeCode) async {
      try {
        await ref.read(preferencesProvider.notifier).setLocale(localeCode);
      } on ApiException catch (error) {
        if (context.mounted) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(error.message)));
        }
      }
    }

    return SafeArea(
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(24, 24, 24, 120),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Configuración',
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    letterSpacing: -0.6,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'Seguridad y acceso de tu cuenta',
                  style: TextStyle(
                    fontSize: 13,
                    color: isDark
                        ? AppColors.darkTextSecondary
                        : AppColors.lightTextSecondary,
                  ),
                ),
                const SizedBox(height: 24),
                _AppearanceCard(
                  preferences: preferences,
                  onThemeChanged: updateTheme,
                  onLocaleChanged: updateLocale,
                ),
                const SizedBox(height: 16),
                _SecurityCard(
                  settings: settings,
                  onToggle: (value) {
                    if (value) {
                      _configure(context, ref, settings.method);
                    } else {
                      _disable(context, ref);
                    }
                  },
                  onSelectMethod: (method) =>
                      ref.read(securitySettingsProvider.notifier).selectMethod(method),
                  onConfigure: () => _configure(context, ref, settings.method),
                ),
                const SizedBox(height: 16),
                const _ClientAppsCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _AppearanceCard extends StatelessWidget {
  const _AppearanceCard({
    required this.preferences,
    required this.onThemeChanged,
    required this.onLocaleChanged,
  });

  final UserPreferences preferences;
  final ValueChanged<ThemePreference> onThemeChanged;
  final ValueChanged<String> onLocaleChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final secondary =
        isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary;

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
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 16),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(11),
                    gradient: const LinearGradient(
                      colors: [AppColors.indigo, AppColors.violet],
                    ),
                  ),
                  child: const Icon(Icons.palette_outlined, size: 20, color: Colors.white),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Apariencia',
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          letterSpacing: -0.2,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Tema e idioma se guardan en tu cuenta.',
                        style: TextStyle(fontSize: 12, color: secondary),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider(height: 1, color: theme.colorScheme.outline),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
            child: Wrap(
              spacing: 24,
              runSpacing: 16,
              crossAxisAlignment: WrapCrossAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tema',
                      style: TextStyle(
                        fontSize: 12.5,
                        fontWeight: FontWeight.w500,
                        color: theme.textTheme.bodySmall?.color,
                      ),
                    ),
                    const SizedBox(height: 8),
                    SegmentedButton<ThemePreference>(
                      key: const Key('pref_theme'),
                      segments: [
                        for (final value in ThemePreference.values)
                          ButtonSegment(value: value, label: Text(value.label)),
                      ],
                      selected: {preferences.theme},
                      showSelectedIcon: false,
                      onSelectionChanged: (selection) => onThemeChanged(selection.first),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Idioma',
                      style: TextStyle(
                        fontSize: 12.5,
                        fontWeight: FontWeight.w500,
                        color: theme.textTheme.bodySmall?.color,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.surfaceContainerHighest,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: theme.colorScheme.outline),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          key: const Key('pref_locale'),
                          value: preferences.localeCode,
                          items: const [
                            DropdownMenuItem(value: 'es', child: Text('Español')),
                            DropdownMenuItem(value: 'en', child: Text('Inglés')),
                          ],
                          onChanged: (value) {
                            if (value != null) onLocaleChanged(value);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ClientAppsCard extends ConsumerWidget {
  const _ClientAppsCard();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final secondary =
        isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary;
    final appsAsync = ref.watch(clientAppsProvider);

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
            padding: const EdgeInsets.fromLTRB(20, 20, 16, 16),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(11),
                    gradient: const LinearGradient(
                      colors: [AppColors.indigo, AppColors.violet],
                    ),
                  ),
                  child: const Icon(Icons.apps_rounded, size: 20, color: Colors.white),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Aplicaciones Cliente',
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          letterSpacing: -0.2,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Integraciones OAuth2 (M2M) de tu tenant.',
                        style: TextStyle(fontSize: 12, color: secondary),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Material(
                    color: Colors.transparent,
                    child: Ink(
                      height: 38,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [AppColors.indigo, AppColors.violet],
                        ),
                      ),
                      child: InkWell(
                        onTap: () => showCreateClientAppDialog(context, ref),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 14),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Icon(Icons.add_rounded, size: 16, color: Colors.white),
                              SizedBox(width: 6),
                              Text(
                                'Crear Aplicación',
                                style: TextStyle(
                                  fontSize: 12.5,
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
            ),
          ),
          Divider(height: 1, color: theme.colorScheme.outline),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
            child: appsAsync.when(
              loading: () => Column(
                children: const [
                  SkeletonBox(height: 56, borderRadius: 12),
                  SizedBox(height: 10),
                  SkeletonBox(height: 56, borderRadius: 12),
                ],
              ),
              error: (error, _) => Row(
                children: [
                  Expanded(
                    child: Text(
                      'No se pudieron cargar las aplicaciones',
                      style: TextStyle(fontSize: 13, color: secondary),
                    ),
                  ),
                  TextButton(
                    onPressed: () => ref.invalidate(clientAppsProvider),
                    child: const Text('Reintentar'),
                  ),
                ],
              ),
              data: (apps) {
                if (apps.isEmpty) {
                  return Text(
                    'Aún no hay aplicaciones cliente. Crea la primera para integrar un servicio.',
                    style: TextStyle(fontSize: 13, color: secondary),
                  );
                }
                return Column(
                  children: [
                    for (var i = 0; i < apps.length; i++) ...[
                      if (i > 0) const SizedBox(height: 10),
                      _ClientAppRow(app: apps[i]),
                    ],
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _ClientAppRow extends StatelessWidget {
  const _ClientAppRow({required this.app});

  final ClientApplication app;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final secondary =
        isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary;
    final color = app.isActive ? AppColors.success : AppColors.danger;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.4),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: theme.colorScheme.outline),
      ),
      child: Row(
        children: [
          Container(
            width: 34,
            height: 34,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.indigo.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(9),
            ),
            child: const Icon(Icons.key_outlined, size: 17, color: AppColors.indigo),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  app.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 2),
                Text(
                  'client_id: ${app.clientId}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 11, color: secondary),
                ),
                if (app.scopes.isNotEmpty) ...[
                  const SizedBox(height: 2),
                  Text(
                    app.scopes.join(', '),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 10.5, color: secondary),
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.10),
              borderRadius: BorderRadius.circular(999),
              border: Border.all(color: color.withValues(alpha: 0.2)),
            ),
            child: Text(
              app.statusLabel,
              style: TextStyle(
                fontSize: 10.5,
                fontWeight: FontWeight.w600,
                color: color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SecurityCard extends StatelessWidget {
  const _SecurityCard({
    required this.settings,
    required this.onToggle,
    required this.onSelectMethod,
    required this.onConfigure,
  });

  final SecuritySettings settings;
  final ValueChanged<bool> onToggle;
  final ValueChanged<MfaMethod> onSelectMethod;
  final VoidCallback onConfigure;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final secondary =
        isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary;

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
            padding: const EdgeInsets.fromLTRB(20, 20, 16, 16),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(11),
                    gradient: const LinearGradient(
                      colors: [AppColors.indigo, AppColors.violet],
                    ),
                  ),
                  child: const Icon(Icons.shield_outlined, size: 20, color: Colors.white),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Autenticación de Dos Factores (2FA)',
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          letterSpacing: -0.2,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Añade un segundo factor para proteger tu cuenta.',
                        style: TextStyle(fontSize: 12, color: secondary),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Switch(
                  key: const Key('mfa_switch'),
                  value: settings.enabled,
                  onChanged: onToggle,
                ),
              ],
            ),
          ),
          Divider(height: 1, color: theme.colorScheme.outline),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
            child: settings.enabled
                ? _EnabledBody(method: settings.method)
                : _DisabledBody(
                    method: settings.method,
                    onSelectMethod: onSelectMethod,
                    onConfigure: onConfigure,
                  ),
          ),
        ],
      ),
    );
  }
}

class _EnabledBody extends StatelessWidget {
  const _EnabledBody({required this.method});

  final MfaMethod method;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: AppColors.success.withValues(alpha: 0.10),
            borderRadius: BorderRadius.circular(999),
            border: Border.all(color: AppColors.success.withValues(alpha: 0.2)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 6,
                height: 6,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.success,
                ),
              ),
              const SizedBox(width: 6),
              const Text(
                'Activo',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: AppColors.success,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 10),
        Flexible(
          child: Text(
            'Método: ${method.label}',
            style: TextStyle(fontSize: 13, color: theme.textTheme.bodySmall?.color),
          ),
        ),
        const Spacer(),
        Text(
          'Desactiva con el switch',
          style: TextStyle(fontSize: 11, color: theme.textTheme.bodySmall?.color),
        ),
      ],
    );
  }
}

class _DisabledBody extends StatelessWidget {
  const _DisabledBody({
    required this.method,
    required this.onSelectMethod,
    required this.onConfigure,
  });

  final MfaMethod method;
  final ValueChanged<MfaMethod> onSelectMethod;
  final VoidCallback onConfigure;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Método',
          style: TextStyle(
            fontSize: 12.5,
            fontWeight: FontWeight.w500,
            color: theme.textTheme.bodySmall?.color,
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            SegmentedButton<MfaMethod>(
              key: const Key('mfa_method'),
              segments: const [
                ButtonSegment(
                  value: MfaMethod.totp,
                  label: Text('TOTP'),
                  icon: Icon(Icons.qr_code_2_rounded, size: 16),
                ),
                ButtonSegment(
                  value: MfaMethod.emailOtp,
                  label: Text('EMAIL_OTP'),
                  icon: Icon(Icons.mail_outline_rounded, size: 16),
                ),
              ],
              selected: {method},
              showSelectedIcon: false,
              onSelectionChanged: (selection) => onSelectMethod(selection.first),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Material(
                color: Colors.transparent,
                child: Ink(
                  height: 42,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [AppColors.indigo, AppColors.violet],
                    ),
                  ),
                  child: InkWell(
                    key: const Key('mfa_configure'),
                    onTap: onConfigure,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: Center(
                        child: Text(
                          method == MfaMethod.totp
                              ? 'Configurar TOTP'
                              : 'Configurar EMAIL_OTP',
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Text(
          'El estado de 2FA se conserva durante la sesión (el backend no expone un GET de preferencias).',
          style: TextStyle(fontSize: 11, color: theme.textTheme.bodySmall?.color),
        ),
      ],
    );
  }
}
