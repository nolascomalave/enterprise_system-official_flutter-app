import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../core/network/api_exception.dart';
import '../../../../core/i18n/l10n_ext.dart';
import '../../domain/entities/party.dart';
import '../../domain/repositories/parties_repository.dart';
import '../providers/parties_notifier.dart';

/// Formulario dinámico de creación de Party (INDIVIDUAL / ORGANIZATION).
///
/// [onSubmit] devuelve un mensaje de error o `null` si el guardado fue exitoso.
class CreatePartyForm extends StatefulWidget {
  const CreatePartyForm({super.key, required this.onSubmit});

  final Future<String?> Function(CreatePartyParams params) onSubmit;

  @override
  State<CreatePartyForm> createState() => _CreatePartyFormState();
}

class _CreatePartyFormState extends State<CreatePartyForm> {
  final _formKey = GlobalKey<FormState>();
  final _displayName = TextEditingController();
  final _firstName = TextEditingController();
  final _lastName = TextEditingController();
  final _secondLastName = TextEditingController();
  final _legalName = TextEditingController();
  final _taxId = TextEditingController();
  final _tradeName = TextEditingController();

  PartyType _type = PartyType.individual;
  bool _saving = false;
  String? _error;

  @override
  void dispose() {
    _displayName.dispose();
    _firstName.dispose();
    _lastName.dispose();
    _secondLastName.dispose();
    _legalName.dispose();
    _taxId.dispose();
    _tradeName.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    setState(() {
      _saving = true;
      _error = null;
    });

    final error = await widget.onSubmit(
      CreatePartyParams(
        displayName: _displayName.text.trim(),
        partyType: _type,
        firstName: _type == PartyType.individual
            ? _firstName.text.trim()
            : null,
        lastName: _type == PartyType.individual ? _lastName.text.trim() : null,
        secondLastName:
            _type == PartyType.individual &&
                _secondLastName.text.trim().isNotEmpty
            ? _secondLastName.text.trim()
            : null,
        legalName: _type == PartyType.organization
            ? _legalName.text.trim()
            : null,
        taxId: _type == PartyType.organization ? _taxId.text.trim() : null,
        tradeName:
            _type == PartyType.organization && _tradeName.text.trim().isNotEmpty
            ? _tradeName.text.trim()
            : null,
      ),
    );

    if (!mounted) return;
    setState(() {
      _saving = false;
      _error = error;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Selector de tipo
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: isDark ? const Color(0xFF18181B) : const Color(0xFFF4F4F5),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: theme.colorScheme.outline),
            ),
            child: Row(
              children: [
                Expanded(
                  child: _TypeOption(
                    key: const Key('party-type-individual'),
                    label: context.l10n.partyTypeIndividual,
                    icon: Icons.person_outline_rounded,
                    selected: _type == PartyType.individual,
                    onTap: () => setState(() => _type = PartyType.individual),
                  ),
                ),
                Expanded(
                  child: _TypeOption(
                    key: const Key('party-type-organization'),
                    label: context.l10n.partyTypeOrganization,
                    icon: Icons.business_outlined,
                    selected: _type == PartyType.organization,
                    onTap: () => setState(() => _type = PartyType.organization),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 18),

          _Label(context.l10n.displayName),
          const SizedBox(height: 6),
          TextFormField(
            key: const Key('display_name'),
            controller: _displayName,
            enabled: !_saving,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(hintText: context.l10n.exampleOrg),
            validator: (value) => (value == null || value.trim().isEmpty)
                ? context.l10n.required
                : null,
          ),
          const SizedBox(height: 16),

          if (_type == PartyType.individual) ...[
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _Label(context.l10n.firstName),
                      const SizedBox(height: 6),
                      TextFormField(
                        key: const Key('first_name'),
                        controller: _firstName,
                        enabled: !_saving,
                        decoration: InputDecoration(
                          hintText: context.l10n.exampleFirstName,
                        ),
                        validator: (value) =>
                            (value == null || value.trim().isEmpty)
                            ? context.l10n.required
                            : null,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _Label(context.l10n.lastName),
                      const SizedBox(height: 6),
                      TextFormField(
                        key: const Key('last_name'),
                        controller: _lastName,
                        enabled: !_saving,
                        decoration: InputDecoration(
                          hintText: context.l10n.exampleLastName,
                        ),
                        validator: (value) =>
                            (value == null || value.trim().isEmpty)
                            ? context.l10n.required
                            : null,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _Label(context.l10n.secondLastName),
            const SizedBox(height: 6),
            TextFormField(
              key: const Key('second_last_name'),
              controller: _secondLastName,
              enabled: !_saving,
              decoration: InputDecoration(
                hintText: context.l10n.exampleSecondLastName,
              ),
            ),
          ] else ...[
            _Label(context.l10n.legalName),
            const SizedBox(height: 6),
            TextFormField(
              key: const Key('legal_name'),
              controller: _legalName,
              enabled: !_saving,
              decoration: InputDecoration(
                hintText: context.l10n.exampleLegalName,
              ),
              validator: (value) => (value == null || value.trim().isEmpty)
                  ? context.l10n.required
                  : null,
            ),
            const SizedBox(height: 16),
            _Label(context.l10n.taxId),
            const SizedBox(height: 6),
            TextFormField(
              key: const Key('tax_id'),
              controller: _taxId,
              enabled: !_saving,
              decoration: InputDecoration(hintText: context.l10n.exampleTaxId),
              validator: (value) => (value == null || value.trim().isEmpty)
                  ? context.l10n.required
                  : null,
            ),
            const SizedBox(height: 16),
            _Label(context.l10n.tradeName),
            const SizedBox(height: 6),
            TextFormField(
              key: const Key('trade_name'),
              controller: _tradeName,
              enabled: !_saving,
              decoration: InputDecoration(
                hintText: context.l10n.exampleTradeName,
              ),
            ),
          ],

          if (_error != null) ...[
            const SizedBox(height: 14),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                color: const Color(0x1AEF4444),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: const Color(0x33EF4444)),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.error_outline_rounded,
                    size: 16,
                    color: Color(0xFFEF4444),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      _error!,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFFEF4444),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
          const SizedBox(height: 22),

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
                        padding: const EdgeInsets.symmetric(horizontal: 22),
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
    );
  }
}

class _Label extends StatelessWidget {
  const _Label(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 12.5,
        fontWeight: FontWeight.w500,
        color: Theme.of(context).textTheme.bodySmall?.color,
      ),
    );
  }
}

class _TypeOption extends StatelessWidget {
  const _TypeOption({
    super.key,
    required this.label,
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final primary = theme.colorScheme.primary;

    return Material(
      color: selected ? primary.withValues(alpha: 0.12) : Colors.transparent,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 9),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 15,
                color: selected
                    ? primary
                    : (isDark
                          ? const Color(0xFFA1A1AA)
                          : const Color(0xFF71717A)),
              ),
              const SizedBox(width: 6),
              Text(
                label,
                style: TextStyle(
                  fontSize: 12.5,
                  fontWeight: selected ? FontWeight.w600 : FontWeight.w500,
                  color: selected
                      ? primary
                      : (isDark
                            ? const Color(0xFFA1A1AA)
                            : const Color(0xFF71717A)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Abre el modal de creación de Party conectado a [PartiesNotifier].
Future<void> showCreatePartyDialog(BuildContext context, WidgetRef ref) {
  final l10n = context.l10n;

  return showDialog<void>(
    context: context,
    builder: (dialogContext) {
      final messenger = ScaffoldMessenger.of(context);
      return Dialog(
        insetPadding: const EdgeInsets.all(24),
        backgroundColor: Theme.of(dialogContext).colorScheme.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: Theme.of(dialogContext).colorScheme.outline),
        ),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 520),
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
                        l10n.newParty,
                        style: Theme.of(dialogContext).textTheme.titleLarge
                            ?.copyWith(fontWeight: FontWeight.w600),
                      ),
                    ),
                    IconButton(
                      tooltip: l10n.close,
                      onPressed: () => Navigator.of(dialogContext).maybePop(),
                      icon: const Icon(Icons.close_rounded, size: 20),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                CreatePartyForm(
                  onSubmit: (params) async {
                    try {
                      await ref
                          .read(partiesProvider.notifier)
                          .createParty(params);
                      if (dialogContext.mounted) {
                        Navigator.of(dialogContext).pop();
                      }
                      messenger.showSnackBar(
                        SnackBar(content: Text(l10n.partyCreated)),
                      );
                      return null;
                    } catch (error) {
                      return error is ApiException
                          ? error.message
                          : l10n.couldNotCreateParty;
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
