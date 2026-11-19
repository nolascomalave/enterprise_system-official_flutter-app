import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../core/network/api_exception.dart';
import '../../domain/entities/client_application.dart';
import '../providers/client_apps_notifier.dart';

/// Modal de creación de aplicación cliente (muestra el secret una única vez).
class CreateClientAppDialog extends StatefulWidget {
  const CreateClientAppDialog({super.key, required this.onCreate});

  final Future<ClientApplication> Function(String name, List<String> scopes)
      onCreate;

  @override
  State<CreateClientAppDialog> createState() => _CreateClientAppDialogState();
}

class _CreateClientAppDialogState extends State<CreateClientAppDialog> {
  final _nameController = TextEditingController();
  final _scopesController = TextEditingController();
  bool _saving = false;
  String? _error;
  ClientApplication? _created;

  @override
  void dispose() {
    _nameController.dispose();
    _scopesController.dispose();
    super.dispose();
  }

  List<String> get _scopes => _scopesController.text
      .split(',')
      .map((scope) => scope.trim())
      .where((scope) => scope.isNotEmpty)
      .toList();

  Future<void> _submit() async {
    if (_nameController.text.trim().isEmpty) {
      setState(() => _error = 'El nombre es obligatorio.');
      return;
    }
    if (_scopes.isEmpty) {
      setState(() => _error = 'Añade al menos un scope.');
      return;
    }
    setState(() {
      _saving = true;
      _error = null;
    });
    try {
      final created = await widget.onCreate(
        _nameController.text.trim(),
        _scopes,
      );
      if (!mounted) return;
      setState(() {
        _saving = false;
        _created = created;
      });
    } catch (error) {
      if (!mounted) return;
      setState(() {
        _saving = false;
        _error = error is ApiException
            ? error.message
            : 'No se pudo crear la aplicación.';
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
        constraints: const BoxConstraints(maxWidth: 500),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: _created == null ? _buildForm(theme) : _buildSecret(theme),
        ),
      ),
    );
  }

  Widget _buildForm(ThemeData theme) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                'Crear Aplicación',
                style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
              ),
            ),
            IconButton(
              tooltip: 'Cerrar',
              onPressed: () => Navigator.of(context).maybePop(),
              icon: const Icon(Icons.close_rounded, size: 20),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Text(
          'Nombre',
          style: TextStyle(
            fontSize: 12.5,
            fontWeight: FontWeight.w500,
            color: theme.textTheme.bodySmall?.color,
          ),
        ),
        const SizedBox(height: 6),
        TextField(
          key: const Key('app_name'),
          controller: _nameController,
          enabled: !_saving,
          decoration: const InputDecoration(hintText: 'Portal de integración'),
        ),
        const SizedBox(height: 16),
        Text(
          'Scopes (separados por comas)',
          style: TextStyle(
            fontSize: 12.5,
            fontWeight: FontWeight.w500,
            color: theme.textTheme.bodySmall?.color,
          ),
        ),
        const SizedBox(height: 6),
        TextField(
          key: const Key('app_scopes'),
          controller: _scopesController,
          enabled: !_saving,
          decoration: const InputDecoration(
            hintText: 'parties:read, parties:write',
          ),
        ),
        if (_error != null) ...[
          const SizedBox(height: 10),
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
              onPressed: _saving ? null : () => Navigator.of(context).maybePop(),
              child: const Text('Cancelar'),
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
                            : const Text(
                                'Crear',
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
    );
  }

  Widget _buildSecret(ThemeData theme) {
    final created = _created!;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            const Icon(Icons.check_circle_outline_rounded,
                color: Color(0xFF10B981), size: 22),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                'Aplicación creada',
                style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Text(
          '${created.name} · ${created.clientId}',
          style: TextStyle(
            fontSize: 12.5,
            color: theme.textTheme.bodySmall?.color,
          ),
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: const Color(0xFFFEF3C7), // ámbar claro
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFFF59E0B)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  Icon(Icons.warning_amber_rounded, size: 18, color: Color(0xFF92400E)),
                  SizedBox(width: 6),
                  Text(
                    'Solo se mostrará una vez',
                    style: TextStyle(
                      fontSize: 12.5,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF78350F),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              const Text(
                'Copia el client secret ahora. Por seguridad, no podrás volver a verlo.',
                style: TextStyle(fontSize: 12, height: 1.4, color: Color(0xFF78350F)),
              ),
              const SizedBox(height: 10),
              SelectableText(
                created.clientSecret ?? '',
                key: const Key('app_secret'),
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.5,
                  color: Color(0xFF78350F),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Align(
          alignment: Alignment.centerLeft,
          child: TextButton.icon(
            onPressed: () async {
              await Clipboard.setData(
                ClipboardData(text: created.clientSecret ?? ''),
              );
              if (!mounted) return;
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Client secret copiado')),
              );
            },
            icon: const Icon(Icons.copy_rounded, size: 16),
            label: const Text('Copiar secreto'),
          ),
        ),
        const SizedBox(height: 8),
        Align(
          alignment: Alignment.centerRight,
          child: FilledButton(
            key: const Key('app_close'),
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cerrar'),
          ),
        ),
      ],
    );
  }
}

/// Abre el modal y refresca la lista al cerrarlo.
Future<void> showCreateClientAppDialog(BuildContext context, WidgetRef ref) async {
  await showDialog<void>(
    context: context,
    builder: (dialogContext) => Consumer(
      builder: (context, dref, _) => CreateClientAppDialog(
        onCreate: (name, scopes) => dref
            .read(clientAppsProvider.notifier)
            .createApplication(name: name, scopes: scopes),
      ),
    ),
  );
  try {
    await ref.read(clientAppsProvider.notifier).refresh();
  } catch (_) {
    // La lista ya se refrescó al crear; ignoramos fallos del refresco extra.
  }
}
