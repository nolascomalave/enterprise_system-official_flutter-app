import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../core/i18n/generated/app_localizations.dart';
import '../../../../core/router/app_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../providers/login_notifier.dart';
import '../state/login_state.dart';
import '../widgets/auth_shell.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _tenantController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _tenantController.dispose();
    super.dispose();
  }

  void _submit() {
    FocusScope.of(context).unfocus();
    ref.read(loginProvider.notifier).login(
          email: _emailController.text.trim(),
          password: _passwordController.text,
          tenantId: _tenantController.text.trim(),
        );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final state = ref.watch(loginProvider);
    final isLoading = state is LoginLoading;
    final errorMessage = state is LoginError ? state.message : null;

    ref.listen<LoginState>(loginProvider, (previous, next) {
      if (next is LoginSuccess) {
        context.go(AppRoutes.dashboard);
      } else if (next is LoginRequiresTwoFactor) {
        context.go(AppRoutes.twoFactor);
      }
    });

    final theme = Theme.of(context);

    return AuthShell(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Logo móvil
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
                child: const Icon(Icons.apartment_rounded, color: Colors.white, size: 18),
              ),
              const SizedBox(width: 10),
              Text(
                'Enterprise App',
                style: theme.textTheme.titleMedium?.copyWith(letterSpacing: -0.4),
              ),
            ],
          ),
          const SizedBox(height: 40),
          Text(l10n.loginTitle, style: theme.textTheme.headlineMedium),
          const SizedBox(height: 6),
          Text(l10n.loginSubtitle, style: theme.textTheme.bodyMedium),
          const SizedBox(height: 28),

          Text(l10n.emailLabel, style: theme.textTheme.labelLarge),
          const SizedBox(height: 8),
          TextField(
            controller: _emailController,
            enabled: !isLoading,
            keyboardType: TextInputType.emailAddress,
            autofillHints: const [AutofillHints.email],
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(hintText: 'nombre@empresa.com'),
          ),
          const SizedBox(height: 16),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(l10n.passwordLabel, style: theme.textTheme.labelLarge),
              TextButton(
                onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(l10n.comingSoon)),
                ),
                style: TextButton.styleFrom(
                  minimumSize: Size.zero,
                  padding: EdgeInsets.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: Text(l10n.forgotPassword, style: const TextStyle(fontSize: 12)),
              ),
            ],
          ),
          const SizedBox(height: 8),
          TextField(
            controller: _passwordController,
            enabled: !isLoading,
            obscureText: _obscurePassword,
            autofillHints: const [AutofillHints.password],
            textInputAction: TextInputAction.done,
            onSubmitted: (_) => _submit(),
            decoration: InputDecoration(
              hintText: '••••••••',
              suffixIcon: IconButton(
                onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                icon: Icon(
                  _obscurePassword
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  size: 18,
                ),
                tooltip: l10n.passwordLabel,
              ),
            ),
          ),
          const SizedBox(height: 16),

          Text(l10n.tenantLabel, style: theme.textTheme.labelLarge),
          const SizedBox(height: 8),
          TextField(
            controller: _tenantController,
            enabled: !isLoading,
            textInputAction: TextInputAction.done,
            onSubmitted: (_) => _submit(),
            decoration: InputDecoration(hintText: l10n.tenantHint),
          ),
          const SizedBox(height: 24),

          GradientButton(
            label: l10n.signIn,
            loading: isLoading,
            onPressed: _submit,
          ),
          if (errorMessage != null) ...[
            const SizedBox(height: 0),
            AuthErrorText(errorMessage),
          ],
          const SizedBox(height: 16),
          OutlinedButton.icon(
            onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(l10n.comingSoon)),
            ),
            icon: const Icon(Icons.add_business_outlined, size: 16),
            label: Text(l10n.registerCompany),
            style: OutlinedButton.styleFrom(
              minimumSize: const Size.fromHeight(46),
            ),
          ),
        ],
      ),
    );
  }
}
