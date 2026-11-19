import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../core/i18n/generated/app_localizations.dart';
import '../../../../core/router/app_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../providers/login_notifier.dart';
import '../state/login_state.dart';
import '../widgets/auth_shell.dart';

/// Pantalla de verificación en dos pasos (código de 6 dígitos).
class TwoFactorPage extends ConsumerStatefulWidget {
  const TwoFactorPage({super.key});

  @override
  ConsumerState<TwoFactorPage> createState() => _TwoFactorPageState();
}

class _TwoFactorPageState extends ConsumerState<TwoFactorPage> {
  final _codeController = TextEditingController();

  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }

  void _verify() {
    FocusScope.of(context).unfocus();
    ref.read(loginProvider.notifier).verifyTwoFactor(
          code: _codeController.text.trim(),
        );
  }

  void _backToLogin() {
    ref.read(loginProvider.notifier).reset();
    context.go(AppRoutes.login);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final state = ref.watch(loginProvider);
    final isLoading = state is LoginLoading;
    final errorMessage = state is LoginError ? state.message : null;
    final hasTempToken = state is LoginRequiresTwoFactor || isLoading;

    ref.listen<LoginState>(loginProvider, (previous, next) {
      if (next is LoginSuccess) {
        context.go(AppRoutes.dashboard);
      }
    });

    return AuthShell(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Container(
                width: 36,
                height: 36,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [AppColors.indigo, AppColors.purple],
                  ),
                ),
                child: const Icon(Icons.shield_outlined, color: Colors.white, size: 18),
              ),
              const SizedBox(width: 10),
              Text(
                'Enterprise App',
                style: theme.textTheme.titleMedium?.copyWith(letterSpacing: -0.4),
              ),
            ],
          ),
          const SizedBox(height: 40),
          Text(l10n.twoFactorTitle, style: theme.textTheme.headlineMedium),
          const SizedBox(height: 6),
          Text(l10n.twoFactorSubtitle, style: theme.textTheme.bodyMedium),
          const SizedBox(height: 28),

          if (!hasTempToken) ...[
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0x1AF59E0B),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: const Color(0x33F59E0B)),
              ),
              child: Row(
                children: [
                  const Icon(Icons.info_outline_rounded, size: 16, color: AppColors.warning),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'La verificación expiró. Vuelve a iniciar sesión.',
                      style: theme.textTheme.bodySmall,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ] else ...[
            Text(l10n.codeLabel, style: theme.textTheme.labelLarge),
            const SizedBox(height: 8),
            TextField(
              controller: _codeController,
              enabled: !isLoading,
              autofocus: true,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              maxLength: 6,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                letterSpacing: 8,
              ),
              decoration: const InputDecoration(
                counterText: '',
                hintText: '000000',
              ),
              onSubmitted: (_) => _verify(),
            ),
            const SizedBox(height: 24),
            GradientButton(
              label: l10n.verify,
              loading: isLoading,
              onPressed: _verify,
            ),
            if (errorMessage != null) AuthErrorText(errorMessage),
          ],
          const SizedBox(height: 20),
          TextButton.icon(
            onPressed: _backToLogin,
            icon: const Icon(Icons.arrow_back_rounded, size: 16),
            label: Text(l10n.backToLogin),
          ),
        ],
      ),
    );
  }
}
