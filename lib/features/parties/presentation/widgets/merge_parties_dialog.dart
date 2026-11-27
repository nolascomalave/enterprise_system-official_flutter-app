import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../core/network/api_exception.dart';
import '../../../../core/i18n/l10n_ext.dart';
import '../../domain/entities/party.dart';
import '../providers/merge_parties_notifier.dart';

/// Modal de fusión de parties (Golden Record).
class MergePartiesDialog extends StatefulWidget {
  const MergePartiesDialog({
    super.key,
    required this.parties,
    required this.onSubmit,
  });

  /// Parties disponibles (las fusionadas se excluyen internamente).
  final List<Party> parties;

  /// Devuelve un mensaje de error o `null` si la fusión fue exitosa.
  final Future<String?> Function(String sourceId, String targetId) onSubmit;

  @override
  State<MergePartiesDialog> createState() => _MergePartiesDialogState();
}

class _MergePartiesDialogState extends State<MergePartiesDialog> {
  String? _targetId;
  String? _sourceId;
  bool _saving = false;
  String? _error;

  List<Party> get _available =>
      widget.parties.where((p) => !p.isMerged).toList();

  Future<void> _submit() async {
    if (_targetId == null || _sourceId == null) {
      setState(() => _error = context.l10n.selectBothParties);
      return;
    }
    if (_targetId == _sourceId) {
      setState(() => _error = context.l10n.distinctParties);
      return;
    }
    setState(() {
      _saving = true;
      _error = null;
    });
    final error = await widget.onSubmit(_sourceId!, _targetId!);
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
    return Dialog(
      insetPadding: const EdgeInsets.all(24),
      backgroundColor: theme.colorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: theme.colorScheme.outline),
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 500),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      context.l10n.mergeTitle,
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  IconButton(
                    tooltip: context.l10n.close,
                    onPressed: () => Navigator.of(context).maybePop(),
                    icon: const Icon(Icons.close_rounded, size: 20),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                context.l10n.mergeInstruction,
                style: TextStyle(
                  fontSize: 12.5,
                  height: 1.5,
                  color: theme.textTheme.bodySmall?.color,
                ),
              ),
              const SizedBox(height: 18),
              Text(context.l10n.mergeTarget, style: _labelStyle(theme)),
              const SizedBox(height: 6),
              DropdownButtonFormField<String>(
                key: const Key('merge_target'),
                isExpanded: true,
                items: [
                  for (final party in _available)
                    DropdownMenuItem(
                      value: party.id,
                      child: Text(party.displayName),
                    ),
                ],
                onChanged: _saving
                    ? null
                    : (value) => setState(() => _targetId = value),
              ),
              const SizedBox(height: 16),
              Text(context.l10n.mergeSource, style: _labelStyle(theme)),
              const SizedBox(height: 6),
              DropdownButtonFormField<String>(
                key: const Key('merge_source'),
                isExpanded: true,
                items: [
                  for (final party in _available)
                    DropdownMenuItem(
                      value: party.id,
                      child: Text(party.displayName),
                    ),
                ],
                onChanged: _saving
                    ? null
                    : (value) => setState(() => _sourceId = value),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFFFEF3C7),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: const Color(0xFFF59E0B)),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.warning_amber_rounded,
                      size: 18,
                      color: Color(0xFF92400E),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        context.l10n.mergeWarning,
                        style: const TextStyle(
                          fontSize: 12,
                          height: 1.45,
                          color: Color(0xFF78350F),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (_error != null) ...[
                const SizedBox(height: 10),
                Text(
                  _error!,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFFEF4444),
                  ),
                ),
              ],
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: _saving
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
                          onTap: _saving ? null : _submit,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Center(
                              child: _saving
                                  ? const SizedBox(
                                      width: 16,
                                      height: 16,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        color: Colors.white,
                                      ),
                                    )
                                  : Text(
                                      context.l10n.mergeParties,
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
          ),
        ),
      ),
    );
  }

  TextStyle? _labelStyle(ThemeData theme) => TextStyle(
    fontSize: 12.5,
    fontWeight: FontWeight.w500,
    color: theme.textTheme.bodySmall?.color,
  );
}

/// Abre el modal conectado al notifier (y refresca la lista al fusionar).
Future<void> showMergePartiesDialog(
  BuildContext context,
  WidgetRef ref,
  List<Party> parties,
) {
  final l10n = context.l10n;

  if (parties.where((party) => !party.isMerged).length < 2) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(l10n.noPartiesToMerge)));
    return Future.value();
  }

  return showDialog<void>(
    context: context,
    builder: (dialogContext) {
      final messenger = ScaffoldMessenger.of(context);
      return MergePartiesDialog(
        parties: parties,
        onSubmit: (sourceId, targetId) async {
          try {
            await ref
                .read(mergePartiesProvider.notifier)
                .merge(sourcePartyId: sourceId, targetPartyId: targetId);
            messenger.showSnackBar(SnackBar(content: Text(l10n.mergeSuccess)));
            return null;
          } catch (error) {
            return error is ApiException
                ? error.message
                : l10n.couldNotMergeParties;
          }
        },
      );
    },
  );
}
