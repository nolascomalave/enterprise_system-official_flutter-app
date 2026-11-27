import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../../core/network/api_exception.dart';
import '../../../../core/i18n/l10n_ext.dart';
import '../../domain/entities/security_settings.dart';
import '../providers/security_settings_notifier.dart';

/// Modal de configuración TOTP: QR + secret + verificación + backup codes.
class TotpSetupDialog extends StatefulWidget {
  const TotpSetupDialog({
    super.key,
    required this.setup,
    required this.onVerify,
  });

  final TotpSetup setup;
  final Future<List<String>> Function(String code) onVerify;

  @override
  State<TotpSetupDialog> createState() => _TotpSetupDialogState();
}

class _TotpSetupDialogState extends State<TotpSetupDialog> {
  final _codeController = TextEditingController();
  bool _verifying = false;
  String? _error;
  List<String>? _backupCodes;
  bool _acknowledged = false;

  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }

  Future<void> _verify() async {
    final code = _codeController.text.trim();
    if (code.length != 6) {
      setState(() => _error = context.l10n.invalidCode);
      return;
    }
    setState(() {
      _verifying = true;
      _error = null;
    });
    try {
      final codes = await widget.onVerify(code);
      if (!mounted) return;
      setState(() {
        _verifying = false;
        _backupCodes = codes;
      });
    } catch (error) {
      if (!mounted) return;
      setState(() {
        _verifying = false;
        _error = error is ApiException
            ? error.message
            : context.l10n.invalidCode;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Dialog(
      insetPadding: const EdgeInsets.all(24),
      backgroundColor: theme.colorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: theme.colorScheme.outline),
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 480),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: _backupCodes == null
              ? _buildSetup(theme, isDark)
              : _buildSuccess(theme),
        ),
      ),
    );
  }

  Widget _buildSetup(ThemeData theme, bool isDark) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          context.l10n.totpConfigTitle,
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          context.l10n.totpScan,
          style: TextStyle(
            fontSize: 13,
            color: isDark ? const Color(0xFFA1A1AA) : const Color(0xFF71717A),
          ),
        ),
        const SizedBox(height: 20),
        Center(
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: theme.colorScheme.outline),
            ),
            child: QrImageView(
              data: widget.setup.otpauthUrl,
              version: QrVersions.auto,
              size: 190,
              backgroundColor: Colors.white,
              eyeStyle: const QrEyeStyle(
                eyeShape: QrEyeShape.square,
                color: Colors.black,
              ),
              dataModuleStyle: const QrDataModuleStyle(
                dataModuleShape: QrDataModuleShape.square,
                color: Colors.black,
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          context.l10n.totpManual,
          style: TextStyle(
            fontSize: 12,
            color: isDark ? const Color(0xFFA1A1AA) : const Color(0xFF71717A),
          ),
        ),
        const SizedBox(height: 6),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: theme.colorScheme.outline),
          ),
          child: SelectableText(
            widget.setup.secret,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.5,
            ),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          context.l10n.codeLabel,
          style: TextStyle(
            fontSize: 12.5,
            fontWeight: FontWeight.w500,
            color: theme.textTheme.bodySmall?.color,
          ),
        ),
        const SizedBox(height: 6),
        TextField(
          key: const Key('totp_code'),
          controller: _codeController,
          enabled: !_verifying,
          autofocus: true,
          keyboardType: TextInputType.number,
          maxLength: 6,
          textAlign: TextAlign.center,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            letterSpacing: 8,
          ),
          decoration: const InputDecoration(
            counterText: '',
            hintText: '000000',
          ),
          onSubmitted: (_) => _verify(),
        ),
        if (_error != null) ...[
          const SizedBox(height: 8),
          Text(
            _error!,
            style: const TextStyle(fontSize: 12, color: Color(0xFFEF4444)),
          ),
        ],
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: _verifying
                  ? null
                  : () => Navigator.of(context).maybePop(),
              child: Text(context.l10n.cancel),
            ),
            const SizedBox(width: 8),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Material(
                color: Colors.transparent,
                child: Ink(
                  height: 42,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF6366F1), Color(0xFF8B5CF6)],
                    ),
                  ),
                  child: InkWell(
                    onTap: _verifying ? null : _verify,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 22),
                      child: Center(
                        child: _verifying
                            ? const SizedBox(
                                width: 16,
                                height: 16,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: Colors.white,
                                ),
                              )
                            : Text(
                                context.l10n.verify,
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
      ],
    );
  }

  Widget _buildSuccess(ThemeData theme) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            const Icon(
              Icons.verified_outlined,
              color: Color(0xFF10B981),
              size: 22,
            ),
            const SizedBox(width: 8),
            Text(
              context.l10n.twoFactorActivated,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0x1AF59E0B),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color(0x33F59E0B)),
          ),
          child: Text(
            context.l10n.backupWarning,
            style: TextStyle(
              fontSize: 12,
              height: 1.5,
              color: theme.brightness == Brightness.dark
                  ? const Color(0xFFFCD34D)
                  : const Color(0xFF78350F),
            ),
          ),
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: theme.colorScheme.outline),
          ),
          child: Wrap(
            spacing: 16,
            runSpacing: 10,
            children: [
              for (final code in _backupCodes!)
                SelectableText(
                  code,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.2,
                  ),
                ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        CheckboxListTile(
          key: const Key('backup_ack'),
          value: _acknowledged,
          onChanged: (value) => setState(() => _acknowledged = value ?? false),
          contentPadding: EdgeInsets.zero,
          controlAffinity: ListTileControlAffinity.leading,
          dense: true,
          title: Text(
            context.l10n.backupAck,
            style: const TextStyle(fontSize: 13),
          ),
        ),
        const SizedBox(height: 8),
        Align(
          alignment: Alignment.centerRight,
          child: FilledButton(
            key: const Key('totp_close'),
            onPressed: _acknowledged ? () => Navigator.of(context).pop() : null,
            child: Text(context.l10n.close),
          ),
        ),
      ],
    );
  }
}

/// Modal de step-up con código OTP (desactivar 2FA / activar EMAIL_OTP).
class OtpStepUpDialog extends StatefulWidget {
  const OtpStepUpDialog({
    super.key,
    required this.title,
    required this.description,
    required this.requestOtp,
    required this.onConfirm,
    this.successMessage,
  });

  final String title;
  final String description;
  final Future<void> Function() requestOtp;
  final Future<void> Function(String code) onConfirm;
  final String? successMessage;

  @override
  State<OtpStepUpDialog> createState() => _OtpStepUpDialogState();
}

class _OtpStepUpDialogState extends State<OtpStepUpDialog> {
  final _codeController = TextEditingController();
  bool _requesting = true;
  bool _submitting = false;
  String? _error;
  String? _requestError;

  @override
  void initState() {
    super.initState();
    _request();
  }

  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }

  Future<void> _request() async {
    setState(() {
      _requesting = true;
      _requestError = null;
    });
    try {
      await widget.requestOtp();
      if (!mounted) return;
      setState(() => _requesting = false);
    } catch (error) {
      if (!mounted) return;
      setState(() {
        _requesting = false;
        _requestError = error is ApiException
            ? error.message
            : context.l10n.couldNotSendCode;
      });
    }
  }

  Future<void> _confirm() async {
    final code = _codeController.text.trim();
    if (code.isEmpty) {
      setState(() => _error = context.l10n.invalidCode);
      return;
    }
    setState(() {
      _submitting = true;
      _error = null;
    });
    final messenger = ScaffoldMessenger.of(context);
    try {
      await widget.onConfirm(code);
      if (!mounted) return;
      if (widget.successMessage != null) {
        messenger.showSnackBar(SnackBar(content: Text(widget.successMessage!)));
      }
      Navigator.of(context).pop();
    } catch (error) {
      if (!mounted) return;
      setState(() {
        _submitting = false;
        _error = error is ApiException
            ? error.message
            : context.l10n.invalidCode;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Dialog(
      insetPadding: const EdgeInsets.all(24),
      backgroundColor: theme.colorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: theme.colorScheme.outline),
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 440),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                widget.title,
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              if (_requesting)
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 24),
                  child: Center(
                    child: SizedBox(
                      width: 22,
                      height: 22,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                  ),
                )
              else if (_requestError != null) ...[
                Text(
                  _requestError!,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFFEF4444),
                  ),
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                    onPressed: _request,
                    child: Text(context.l10n.retry),
                  ),
                ),
              ] else ...[
                Text(
                  widget.description,
                  style: TextStyle(
                    fontSize: 13,
                    height: 1.5,
                    color: theme.textTheme.bodySmall?.color,
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  key: const Key('otp_code'),
                  controller: _codeController,
                  enabled: !_submitting,
                  autofocus: true,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  maxLength: 8,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 6,
                  ),
                  decoration: const InputDecoration(
                    counterText: '',
                    hintText: '000000',
                  ),
                  onSubmitted: (_) => _confirm(),
                ),
                if (_error != null) ...[
                  const SizedBox(height: 8),
                  Text(
                    _error!,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFFEF4444),
                    ),
                  ),
                ],
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: _submitting
                          ? null
                          : () => Navigator.of(context).maybePop(),
                      child: Text(context.l10n.cancel),
                    ),
                    const SizedBox(width: 8),
                    FilledButton(
                      key: const Key('otp_confirm'),
                      onPressed: _submitting ? null : _confirm,
                      child: _submitting
                          ? const SizedBox(
                              width: 14,
                              height: 14,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : Text(context.l10n.confirmAction),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

/// Abre el modal TOTP conectado al notifier.
Future<void> showTotpSetupDialog(
  BuildContext context,
  WidgetRef ref,
  TotpSetup setup,
) {
  return showDialog<void>(
    context: context,
    builder: (dialogContext) => TotpSetupDialog(
      setup: setup,
      onVerify: (code) =>
          ref.read(securitySettingsProvider.notifier).verifyTotp(code: code),
    ),
  );
}

/// Desactivación de 2FA con step-up (DISABLE_MFA).
Future<void> showDisableMfaDialog(BuildContext context, WidgetRef ref) {
  final notifier = ref.read(securitySettingsProvider.notifier);
  return showDialog<void>(
    context: context,
    builder: (dialogContext) => OtpStepUpDialog(
      title: context.l10n.disableMfaTitle,
      description: context.l10n.disableMfaDesc,
      requestOtp: () => notifier.requestOtp(MfaAction.disableMfa),
      onConfirm: (code) => notifier.disableMfa(otpCode: code),
      successMessage: context.l10n.mfaDisabled,
    ),
  );
}

/// Activación de EMAIL_OTP con step-up (ENABLE_MFA).
Future<void> showEnableEmailOtpDialog(BuildContext context, WidgetRef ref) {
  final notifier = ref.read(securitySettingsProvider.notifier);
  return showDialog<void>(
    context: context,
    builder: (dialogContext) => OtpStepUpDialog(
      title: context.l10n.enableEmailTitle,
      description: context.l10n.enableEmailDesc,
      requestOtp: () => notifier.requestOtp(MfaAction.enableMfa),
      onConfirm: (code) => notifier.enableEmailOtp(otpCode: code),
      successMessage: context.l10n.mfaEmailEnabled,
    ),
  );
}
