import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../core/network/api_exception.dart';
import '../../domain/entities/corporate_relationship.dart';
import '../providers/relationships_notifier.dart';

/// Modal para iniciar una relación indicando el Holding Tenant ID.
class NewRelationshipDialog extends StatefulWidget {
  const NewRelationshipDialog({super.key, required this.onSubmit});

  final Future<String?> Function(String holdingTenantId) onSubmit;

  @override
  State<NewRelationshipDialog> createState() => _NewRelationshipDialogState();
}

class _NewRelationshipDialogState extends State<NewRelationshipDialog> {
  final _controller = TextEditingController();
  bool _saving = false;
  String? _error;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    final id = _controller.text.trim();
    if (id.isEmpty) {
      setState(() => _error = 'Introduce el Holding Tenant ID.');
      return;
    }
    setState(() {
      _saving = true;
      _error = null;
    });
    final error = await widget.onSubmit(id);
    if (!mounted) return;
    if (error == null) {
      Navigator.of(context).pop();
      return;
    }
    setState(() {
      _saving = false;
      _error = error;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return _DialogShell(
      title: 'Nueva Relación',
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Introduce el identificador del tenant holding para iniciar la relación.',
            style: TextStyle(
              fontSize: 12.5,
              height: 1.5,
              color: theme.textTheme.bodySmall?.color,
            ),
          ),
          const SizedBox(height: 14),
          TextField(
            key: const Key('holding_tenant_id'),
            controller: _controller,
            enabled: !_saving,
            decoration: const InputDecoration(hintText: 'UUID del holding'),
            onSubmitted: (_) => _submit(),
          ),
          if (_error != null) ...[
            const SizedBox(height: 8),
            Text(_error!, style: const TextStyle(fontSize: 12, color: Color(0xFFEF4444))),
          ],
          const SizedBox(height: 18),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: _saving ? null : () => Navigator.of(context).maybePop(),
                child: const Text('Cancelar'),
              ),
              const SizedBox(width: 8),
              _GradientButton(
                label: 'Iniciar',
                loading: _saving,
                onPressed: _submit,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// Muestra el token de invitación para que el holding lo comparta.
class EmitTokenDialog extends StatelessWidget {
  const EmitTokenDialog({super.key, required this.token});

  final InviteToken token;

  @override
  Widget build(BuildContext context) {
    return _DialogShell(
      title: 'Token de invitación',
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Comparte este token con la filial para que consuma la relación. Puede caducar.',
            style: TextStyle(fontSize: 12.5, height: 1.5),
          ),
          const SizedBox(height: 14),
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: const Color(0xFFFEF3C7),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFFF59E0B)),
            ),
            child: Text(
              token.token,
              key: const Key('invite_token'),
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.6,
                color: Color(0xFF78350F),
              ),
            ),
          ),
          if (token.expiresAt != null) ...[
            const SizedBox(height: 8),
            Text(
              'Caduca: ${token.expiresAt}',
              style: const TextStyle(fontSize: 11, color: Color(0xFF71717A)),
            ),
          ],
          const SizedBox(height: 12),
          Align(
            alignment: Alignment.centerLeft,
            child: TextButton.icon(
              onPressed: () async {
                await Clipboard.setData(ClipboardData(text: token.token));
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Token copiado')),
                  );
                }
              },
              icon: const Icon(Icons.copy_rounded, size: 16),
              label: const Text('Copiar token'),
            ),
          ),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerRight,
            child: FilledButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cerrar'),
            ),
          ),
        ],
      ),
    );
  }
}

/// Modal para consumir el token de invitación (filial).
class ConsumeTokenDialog extends StatefulWidget {
  const ConsumeTokenDialog({super.key, required this.onSubmit});

  /// Devuelve un mensaje de error o `null` si fue exitoso.
  final Future<String?> Function(String token) onSubmit;

  @override
  State<ConsumeTokenDialog> createState() => _ConsumeTokenDialogState();
}

class _ConsumeTokenDialogState extends State<ConsumeTokenDialog> {
  final _controller = TextEditingController();
  bool _saving = false;
  String? _error;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    final token = _controller.text.trim();
    if (token.isEmpty) {
      setState(() => _error = 'Introduce el token.');
      return;
    }
    setState(() {
      _saving = true;
      _error = null;
    });
    final error = await widget.onSubmit(token);
    if (!mounted) return;
    if (error == null) {
      Navigator.of(context).pop();
      return;
    }
    setState(() {
      _saving = false;
      _error = error;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _DialogShell(
      title: 'Consumir token',
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Introduce el token de invitación recibido del holding.',
            style: TextStyle(fontSize: 12.5, height: 1.5),
          ),
          const SizedBox(height: 14),
          TextField(
            key: const Key('consume_token'),
            controller: _controller,
            enabled: !_saving,
            decoration: const InputDecoration(hintText: 'Token de invitación'),
            onSubmitted: (_) => _submit(),
          ),
          if (_error != null) ...[
            const SizedBox(height: 8),
            Text(_error!, style: const TextStyle(fontSize: 12, color: Color(0xFFEF4444))),
          ],
          const SizedBox(height: 18),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: _saving ? null : () => Navigator.of(context).maybePop(),
                child: const Text('Cancelar'),
              ),
              const SizedBox(width: 8),
              _GradientButton(
                label: 'Consumir',
                loading: _saving,
                onPressed: _submit,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// Confirmación simple con motivo opcional (rechazar / revocar / cancelar).
class RelationshipReasonDialog extends StatefulWidget {
  const RelationshipReasonDialog({
    super.key,
    required this.title,
    required this.actionLabel,
    required this.onSubmit,
    this.withReason = true,
  });

  final String title;
  final String actionLabel;
  final bool withReason;
  final Future<String?> Function(String? reason) onSubmit;

  @override
  State<RelationshipReasonDialog> createState() => _RelationshipReasonDialogState();
}

class _RelationshipReasonDialogState extends State<RelationshipReasonDialog> {
  final _controller = TextEditingController();
  bool _saving = false;
  String? _error;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    setState(() {
      _saving = true;
      _error = null;
    });
    final reason = widget.withReason ? _controller.text.trim() : null;
    final error = await widget.onSubmit(reason);
    if (!mounted) return;
    if (error == null) {
      Navigator.of(context).pop();
      return;
    }
    setState(() {
      _saving = false;
      _error = error;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _DialogShell(
      title: widget.title,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (widget.withReason) ...[
            const Text(
              'Motivo (opcional)',
              style: TextStyle(fontSize: 12.5, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 6),
            TextField(
              controller: _controller,
              enabled: !_saving,
              decoration: const InputDecoration(hintText: 'Describe el motivo'),
            ),
            const SizedBox(height: 8),
          ],
          if (_error != null)
            Text(_error!, style: const TextStyle(fontSize: 12, color: Color(0xFFEF4444))),
          const SizedBox(height: 14),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: _saving ? null : () => Navigator.of(context).maybePop(),
                child: const Text('Cancelar'),
              ),
              const SizedBox(width: 8),
              _GradientButton(
                label: widget.actionLabel,
                loading: _saving,
                onPressed: _submit,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ── Helpers conectados a Riverpod ──────────────────────────────────────────

Future<void> showNewRelationshipDialog(BuildContext context, WidgetRef ref) {
  return showDialog<void>(
    context: context,
    builder: (dialogContext) {
      final messenger = ScaffoldMessenger.of(context);
      return NewRelationshipDialog(
        onSubmit: (holdingId) async {
          try {
            await ref
                .read(relationshipsProvider.notifier)
                .initiate(holdingTenantId: holdingId);
            messenger.showSnackBar(
              const SnackBar(content: Text('Relación iniciada')),
            );
            return null;
          } catch (error) {
            return error is ApiException
                ? error.message
                : 'No se pudo iniciar la relación.';
          }
        },
      );
    },
  );
}

Future<void> showEmitTokenDialog(BuildContext context, InviteToken token) {
  return showDialog<void>(
    context: context,
    builder: (dialogContext) => EmitTokenDialog(token: token),
  );
}

Future<void> showConsumeTokenDialog(BuildContext context, WidgetRef ref) {
  return showDialog<void>(
    context: context,
    builder: (dialogContext) {
      final messenger = ScaffoldMessenger.of(context);
      return ConsumeTokenDialog(
        onSubmit: (token) async {
          try {
            await ref.read(relationshipsProvider.notifier).consumeToken(token);
            messenger.showSnackBar(
              const SnackBar(content: Text('Relación aprobada')),
            );
            return null;
          } catch (error) {
            return error is ApiException
                ? error.message
                : 'No se pudo consumir el token.';
          }
        },
      );
    },
  );
}

Future<void> showRejectRelationshipDialog(
  BuildContext context,
  WidgetRef ref,
  String relationshipId,
) {
  return showDialog<void>(
    context: context,
    builder: (dialogContext) => RelationshipReasonDialog(
      title: 'Rechazar relación',
      actionLabel: 'Rechazar',
      onSubmit: (reason) async {
        try {
          await ref
              .read(relationshipsProvider.notifier)
              .reject(relationshipId, reason: reason);
          return null;
        } catch (error) {
          return error is ApiException ? error.message : 'No se pudo rechazar.';
        }
      },
    ),
  );
}

Future<void> showRevokeRelationshipDialog(
  BuildContext context,
  WidgetRef ref,
  String relationshipId,
) {
  return showDialog<void>(
    context: context,
    builder: (dialogContext) => RelationshipReasonDialog(
      title: 'Revocar relación',
      actionLabel: 'Revocar',
      onSubmit: (reason) async {
        try {
          await ref
              .read(relationshipsProvider.notifier)
              .revoke(relationshipId, reason: reason);
          return null;
        } catch (error) {
          return error is ApiException ? error.message : 'No se pudo revocar.';
        }
      },
    ),
  );
}

Future<void> showCancelRelationshipDialog(
  BuildContext context,
  WidgetRef ref,
  String relationshipId,
) {
  return showDialog<void>(
    context: context,
    builder: (dialogContext) => RelationshipReasonDialog(
      title: 'Cancelar relación',
      actionLabel: 'Cancelar',
      withReason: false,
      onSubmit: (_) async {
        try {
          await ref.read(relationshipsProvider.notifier).cancel(relationshipId);
          return null;
        } catch (error) {
          return error is ApiException ? error.message : 'No se pudo cancelar.';
        }
      },
    ),
  );
}

class _DialogShell extends StatelessWidget {
  const _DialogShell({required this.title, required this.child});

  final String title;
  final Widget child;

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
        constraints: const BoxConstraints(maxWidth: 460),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                title,
                style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 12),
              child,
            ],
          ),
        ),
      ),
    );
  }
}

class _GradientButton extends StatelessWidget {
  const _GradientButton({
    required this.label,
    required this.onPressed,
    this.loading = false,
  });

  final String label;
  final VoidCallback onPressed;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Material(
        color: Colors.transparent,
        child: Ink(
          height: 42,
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [Color(0xFF6366F1), Color(0xFF8B5CF6)]),
          ),
          child: InkWell(
            onTap: loading ? null : onPressed,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Center(
                child: loading
                    ? const SizedBox(
                        width: 16,
                        height: 16,
                        child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                      )
                    : Text(
                        label,
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
    );
  }
}
