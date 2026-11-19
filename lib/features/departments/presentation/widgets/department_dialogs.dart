import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../core/network/api_exception.dart';
import '../../../employees/domain/entities/employee.dart' show Employee;
import '../../../employees/presentation/providers/employees_notifier.dart';
import '../../../employees/presentation/providers/employees_providers.dart';
import '../../../parties/domain/entities/party.dart';
import '../../domain/entities/corporate_group.dart';
import '../../domain/entities/department.dart';
import '../../domain/repositories/department_repository.dart';
import '../providers/corporate_groups_notifier.dart';
import '../providers/departments_notifier.dart';

/// Formulario de creación de departamento.
class CreateDepartmentForm extends StatefulWidget {
  const CreateDepartmentForm({
    super.key,
    required this.departments,
    required this.managers,
    required this.onSubmit,
    this.initialParentId,
  });

  final List<Department> departments;

  /// Empleados disponibles como manager (id = party_id).
  final List<({String id, String label})> managers;
  final Future<String?> Function(CreateDepartmentParams params) onSubmit;
  final String? initialParentId;

  @override
  State<CreateDepartmentForm> createState() => _CreateDepartmentFormState();
}

class _CreateDepartmentFormState extends State<CreateDepartmentForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _codeController = TextEditingController();

  DepartmentUnitType _unitType = DepartmentUnitType.department;
  String? _parentId;
  String? _managerId;
  bool _saving = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    _parentId = widget.initialParentId;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _codeController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    setState(() {
      _saving = true;
      _error = null;
    });

    final error = await widget.onSubmit(
      CreateDepartmentParams(
        name: _nameController.text.trim(),
        code: _codeController.text.trim(),
        unitType: _unitType,
        parentDepartmentId: _parentId,
        managerPartyId: _managerId,
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
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _Label('Nombre'),
          const SizedBox(height: 6),
          TextFormField(
            key: const Key('dept_name'),
            controller: _nameController,
            enabled: !_saving,
            decoration: const InputDecoration(hintText: 'Tecnología'),
            validator: (value) =>
                (value == null || value.trim().isEmpty) ? 'Requerido' : null,
          ),
          const SizedBox(height: 16),

          _Label('Código'),
          const SizedBox(height: 6),
          TextFormField(
            key: const Key('dept_code'),
            controller: _codeController,
            enabled: !_saving,
            decoration: const InputDecoration(hintText: 'TECH'),
            validator: (value) =>
                (value == null || value.trim().isEmpty) ? 'Requerido' : null,
          ),
          const SizedBox(height: 16),

          _Label('Tipo de unidad'),
          const SizedBox(height: 6),
          DropdownButtonFormField<DepartmentUnitType>(
            key: const Key('dept_unit_type'),
            initialValue: _unitType,
            isExpanded: true,
            items: [
              for (final type in DepartmentUnitType.values)
                DropdownMenuItem(value: type, child: Text(type.label)),
            ],
            onChanged: _saving
                ? null
                : (value) => setState(() => _unitType = value ?? _unitType),
          ),
          const SizedBox(height: 16),

          _Label('Departamento padre (opcional)'),
          const SizedBox(height: 6),
          DropdownButtonFormField<String?>(
            key: const Key('dept_parent'),
            initialValue: _parentId,
            isExpanded: true,
            items: [
              const DropdownMenuItem<String?>(
                value: null,
                child: Text('— Sin padre (raíz) —'),
              ),
              for (final department in widget.departments)
                DropdownMenuItem<String?>(
                  value: department.id,
                  child: Text(department.name),
                ),
            ],
            onChanged:
                _saving ? null : (value) => setState(() => _parentId = value),
          ),
          const SizedBox(height: 16),

          _Label('Manager (opcional)'),
          const SizedBox(height: 6),
          DropdownButtonFormField<String?>(
            key: const Key('dept_manager'),
            initialValue: _managerId,
            isExpanded: true,
            items: [
              const DropdownMenuItem<String?>(
                value: null,
                child: Text('— Sin manager —'),
              ),
              for (final manager in widget.managers)
                DropdownMenuItem<String?>(
                  value: manager.id,
                  child: Text(manager.label),
                ),
            ],
            onChanged:
                _saving ? null : (value) => setState(() => _managerId = value),
          ),

          if (_error != null) ...[
            const SizedBox(height: 14),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                color: const Color(0x1AEF4444),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: const Color(0x33EF4444)),
              ),
              child: Text(
                _error!,
                style: const TextStyle(fontSize: 12, color: Color(0xFFEF4444)),
              ),
            ),
          ],
          const SizedBox(height: 22),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: _saving ? null : () => Navigator.of(context).maybePop(),
                child: const Text('Cancelar'),
              ),
              const SizedBox(width: 8),
              _SaveButton(saving: _saving, onPressed: _submit),
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

class _SaveButton extends StatelessWidget {
  const _SaveButton({required this.saving, required this.onPressed});

  final bool saving;
  final VoidCallback onPressed;

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
            onTap: saving ? null : onPressed,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Center(
                child: saving
                    ? const SizedBox(
                        width: 16,
                        height: 16,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : const Text(
                        'Guardar',
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
    );
  }
}

/// Modal de creación de departamento (con parent opcional preseleccionado).
Future<void> showCreateDepartmentDialog(
  BuildContext context,
  WidgetRef ref, {
  String? parentId,
}) {
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
          child: Consumer(
            builder: (context, dref, _) {
              final departments = dref.watch(departmentsProvider).value ?? const [];
              final employees = dref.watch(employeesProvider).value ?? const <Employee>[];
              final parties = dref.watch(individualPartiesProvider).value ?? const <Party>[];
              final names = {for (final Party party in parties) party.id: party.displayName};
              final managers = [
                for (final employee in employees)
                  (
                    id: employee.partyId,
                    label: names[employee.partyId] ?? 'Party ${employee.partyId}',
                  ),
              ];

              return SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Nuevo Departamento',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(fontWeight: FontWeight.w600),
                          ),
                        ),
                        IconButton(
                          tooltip: 'Cerrar',
                          onPressed: () => Navigator.of(dialogContext).maybePop(),
                          icon: const Icon(Icons.close_rounded, size: 20),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    CreateDepartmentForm(
                      departments: departments,
                      managers: managers,
                      initialParentId: parentId,
                      onSubmit: (params) async {
                        try {
                          await dref
                              .read(departmentsProvider.notifier)
                              .createDepartment(params);
                          if (dialogContext.mounted) {
                            Navigator.of(dialogContext).pop();
                          }
                          messenger.showSnackBar(
                            const SnackBar(
                                content: Text('Departamento creado correctamente')),
                          );
                          return null;
                        } catch (error) {
                          return error is ApiException
                              ? error.message
                              : 'No se pudo crear el departamento.';
                        }
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      );
    },
  );
}

/// Modal simple para crear un grupo corporativo.
Future<void> showCreateCorporateGroupDialog(
  BuildContext context,
  WidgetRef ref,
) {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  var saving = false;
  String? error;

  return showDialog<void>(
    context: context,
    builder: (dialogContext) {
      final messenger = ScaffoldMessenger.of(context);
      return StatefulBuilder(
        builder: (context, setState) {
          Future<void> submit() async {
            if (!(formKey.currentState?.validate() ?? false)) return;
            setState(() {
              saving = true;
              error = null;
            });
            try {
              await ref.read(corporateGroupsProvider.notifier).createGroup(
                    name: nameController.text.trim(),
                    description: descriptionController.text.trim().isEmpty
                        ? null
                        : descriptionController.text.trim(),
                  );
              if (dialogContext.mounted) Navigator.of(dialogContext).pop();
              messenger.showSnackBar(
                const SnackBar(content: Text('Grupo corporativo creado')),
              );
            } catch (e) {
              setState(() {
                saving = false;
                error = e is ApiException
                    ? e.message
                    : 'No se pudo crear el grupo.';
              });
            }
          }

          return Dialog(
            insetPadding: const EdgeInsets.all(24),
            backgroundColor: Theme.of(dialogContext).colorScheme.surface,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: BorderSide(color: Theme.of(dialogContext).colorScheme.outline),
            ),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 460),
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Nuevo Grupo Corporativo',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(fontWeight: FontWeight.w600),
                            ),
                          ),
                          IconButton(
                            tooltip: 'Cerrar',
                            onPressed: () => Navigator.of(dialogContext).maybePop(),
                            icon: const Icon(Icons.close_rounded, size: 20),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      const _Label('Nombre'),
                      const SizedBox(height: 6),
                      TextFormField(
                        key: const Key('group_name'),
                        controller: nameController,
                        enabled: !saving,
                        decoration: const InputDecoration(hintText: 'Corporativo'),
                        validator: (value) =>
                            (value == null || value.trim().isEmpty) ? 'Requerido' : null,
                      ),
                      const SizedBox(height: 16),
                      const _Label('Descripción (opcional)'),
                      const SizedBox(height: 6),
                      TextFormField(
                        key: const Key('group_description'),
                        controller: descriptionController,
                        enabled: !saving,
                        decoration:
                            const InputDecoration(hintText: 'Agrupación de unidades'),
                      ),
                      if (error != null) ...[
                        const SizedBox(height: 12),
                        Text(
                          error!,
                          style: const TextStyle(fontSize: 12, color: Color(0xFFEF4444)),
                        ),
                      ],
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed:
                                saving ? null : () => Navigator.of(dialogContext).maybePop(),
                            child: const Text('Cancelar'),
                          ),
                          const SizedBox(width: 8),
                          _SaveButton(saving: saving, onPressed: submit),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      );
    },
  );
}

/// Asigna un departamento a un grupo corporativo.
Future<void> showAssignDepartmentDialog(
  BuildContext context,
  WidgetRef ref,
  CorporateGroup group,
) {
  String? departmentId;

  return showDialog<void>(
    context: context,
    builder: (dialogContext) {
      final messenger = ScaffoldMessenger.of(context);
      return StatefulBuilder(
        builder: (context, setState) {
          final departments = ref.watch(departmentsProvider).value ?? const [];
          var saving = false;

          Future<void> submit() async {
            if (departmentId == null) return;
            setState(() => saving = true);
            try {
              await ref
                  .read(corporateGroupsProvider.notifier)
                  .assignDepartment(groupId: group.id, departmentId: departmentId!);
              if (dialogContext.mounted) Navigator.of(dialogContext).pop();
              messenger.showSnackBar(
                const SnackBar(content: Text('Departamento asignado al grupo')),
              );
            } catch (e) {
              setState(() => saving = false);
              messenger.showSnackBar(
                SnackBar(
                  content: Text(
                    e is ApiException ? e.message : 'No se pudo asignar el departamento.',
                  ),
                ),
              );
            }
          }

          return Dialog(
            insetPadding: const EdgeInsets.all(24),
            backgroundColor: Theme.of(dialogContext).colorScheme.surface,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: BorderSide(color: Theme.of(dialogContext).colorScheme.outline),
            ),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 460),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Asignar a "${group.name}"',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 16),
                    DropdownButtonFormField<String>(
                      key: const Key('assign_department'),
                      isExpanded: true,
                      decoration: const InputDecoration(hintText: 'Selecciona un departamento'),
                      items: [
                        for (final department in departments)
                          DropdownMenuItem(
                            value: department.id,
                            child: Text(department.name),
                          ),
                      ],
                      onChanged:
                          saving ? null : (value) => setState(() => departmentId = value),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed:
                              saving ? null : () => Navigator.of(dialogContext).maybePop(),
                          child: const Text('Cancelar'),
                        ),
                        const SizedBox(width: 8),
                        _SaveButton(saving: saving, onPressed: submit),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    },
  );
}
