import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../core/network/api_exception.dart';
import '../../../../core/i18n/l10n_ext.dart';
import '../../domain/entities/party.dart';
import '../../domain/entities/party_detail.dart';
import '../../domain/repositories/parties_repository.dart';
import '../providers/update_party_notifier.dart';

/// Modal de edición de Party (V5). `party_type` es de solo lectura.
class EditPartyDialog extends StatefulWidget {
  const EditPartyDialog({
    super.key,
    required this.detail,
    required this.onSubmit,
  });

  final PartyDetail detail;

  /// Devuelve un mensaje de error o `null` si la actualización fue exitosa.
  final Future<String?> Function(UpdatePartyParams data) onSubmit;

  @override
  State<EditPartyDialog> createState() => _EditPartyDialogState();
}

class _EditPartyDialogState extends State<EditPartyDialog> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _displayName;
  late final TextEditingController _firstName;
  late final TextEditingController _middleName;
  late final TextEditingController _lastName;
  late final TextEditingController _secondLastName;
  late final TextEditingController _birthDate;
  late final TextEditingController _legalName;
  late final TextEditingController _tradeName;
  late final TextEditingController _taxId;

  bool _saving = false;
  String? _error;

  bool get _isOrganization => widget.detail.isOrganization;

  @override
  void initState() {
    super.initState();
    final person = widget.detail.person;
    final organization = widget.detail.organization;
    _displayName = TextEditingController(text: widget.detail.displayName);
    _firstName = TextEditingController(text: person?.firstName ?? '');
    _middleName = TextEditingController(text: person?.middleName ?? '');
    _lastName = TextEditingController(text: person?.lastName ?? '');
    _secondLastName = TextEditingController(text: person?.secondLastName ?? '');
    _birthDate = TextEditingController(text: person?.birthDate ?? '');
    _legalName = TextEditingController(text: organization?.legalName ?? '');
    _tradeName = TextEditingController(text: organization?.tradeName ?? '');
    _taxId = TextEditingController(text: organization?.taxId ?? '');
  }

  @override
  void dispose() {
    _displayName.dispose();
    _firstName.dispose();
    _middleName.dispose();
    _lastName.dispose();
    _secondLastName.dispose();
    _birthDate.dispose();
    _legalName.dispose();
    _tradeName.dispose();
    _taxId.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    setState(() {
      _saving = true;
      _error = null;
    });

    String? optional(TextEditingController controller) {
      final text = controller.text.trim();
      return text.isEmpty ? null : text;
    }

    final error = await widget.onSubmit(
      UpdatePartyParams(
        displayName: _displayName.text.trim(),
        partyType: PartyType.fromApi(widget.detail.partyType),
        firstName: _isOrganization ? null : optional(_firstName),
        middleName: _isOrganization ? null : optional(_middleName),
        lastName: _isOrganization ? null : optional(_lastName),
        secondLastName: _isOrganization ? null : optional(_secondLastName),
        birthDate: _isOrganization ? null : optional(_birthDate),
        legalName: _isOrganization ? optional(_legalName) : null,
        tradeName: _isOrganization ? optional(_tradeName) : null,
        taxId: _isOrganization ? optional(_taxId) : null,
      ),
    );

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
        constraints: const BoxConstraints(maxWidth: 520),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        context.l10n.editPartyTitle,
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
                Text(context.l10n.displayName, style: _labelStyle(theme)),
                const SizedBox(height: 6),
                TextFormField(
                  key: const Key('edit_display_name'),
                  controller: _displayName,
                  enabled: !_saving,
                  decoration: InputDecoration(
                    hintText: context.l10n.partyNameHint,
                  ),
                  validator: (value) => (value == null || value.trim().isEmpty)
                      ? 'Requerido'
                      : null,
                ),
                const SizedBox(height: 14),
                Text(context.l10n.typeNotEditable, style: _labelStyle(theme)),
                const SizedBox(height: 6),
                Container(
                  height: 48,
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surfaceContainerHighest.withValues(
                      alpha: 0.5,
                    ),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: theme.colorScheme.outline),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        _isOrganization
                            ? Icons.business_outlined
                            : Icons.person_outline_rounded,
                        size: 16,
                        color: theme.textTheme.bodySmall?.color,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        widget.detail.isOrganization
                            ? context.l10n.partyTypeOrganization
                            : context.l10n.partyTypeIndividual,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                if (_isOrganization) ...[
                  _field(
                    theme,
                    context.l10n.legalName,
                    const Key('edit_legal_name'),
                    _legalName,
                  ),
                  const SizedBox(height: 12),
                  _field(
                    theme,
                    context.l10n.taxId,
                    const Key('edit_tax_id'),
                    _taxId,
                  ),
                  const SizedBox(height: 12),
                  _field(
                    theme,
                    context.l10n.tradeName,
                    const Key('edit_trade_name'),
                    _tradeName,
                  ),
                ] else ...[
                  Row(
                    children: [
                      Expanded(
                        child: _field(
                          theme,
                          context.l10n.firstName,
                          const Key('edit_first_name'),
                          _firstName,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: _field(
                          theme,
                          context.l10n.middleName,
                          const Key('edit_middle_name'),
                          _middleName,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: _field(
                          theme,
                          context.l10n.lastName,
                          const Key('edit_last_name'),
                          _lastName,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: _field(
                          theme,
                          context.l10n.secondLastName,
                          const Key('edit_second_last_name'),
                          _secondLastName,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  _field(
                    theme,
                    context.l10n.birthDate,
                    const Key('edit_birth_date'),
                    _birthDate,
                    hint: 'YYYY-MM-DD',
                  ),
                ],
                if (_error != null) ...[
                  const SizedBox(height: 12),
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
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
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
                                        context.l10n.save,
                                        style: TextStyle(
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
      ),
    );
  }

  Widget _field(
    ThemeData theme,
    String label,
    Key key,
    TextEditingController controller, {
    String? hint,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: _labelStyle(theme)),
        const SizedBox(height: 6),
        TextFormField(
          key: key,
          controller: controller,
          enabled: !_saving,
          decoration: InputDecoration(hintText: hint),
        ),
      ],
    );
  }

  TextStyle? _labelStyle(ThemeData theme) => TextStyle(
    fontSize: 12.5,
    fontWeight: FontWeight.w500,
    color: theme.textTheme.bodySmall?.color,
  );
}

/// Abre el modal conectado al notifier; refresca detalle y lista al guardar.
Future<void> showEditPartyDialog(
  BuildContext context,
  WidgetRef ref,
  PartyDetail detail,
) {
  final l10n = context.l10n;

  return showDialog<void>(
    context: context,
    builder: (dialogContext) {
      final messenger = ScaffoldMessenger.of(context);
      return EditPartyDialog(
        detail: detail,
        onSubmit: (data) async {
          try {
            await ref
                .read(updatePartyProvider.notifier)
                .updateParty(partyId: detail.id, data: data);
            messenger.showSnackBar(SnackBar(content: Text(l10n.partyUpdated)));
            return null;
          } catch (error) {
            return error is ApiException
                ? error.message
                : l10n.couldNotUpdateParty;
          }
        },
      );
    },
  );
}
