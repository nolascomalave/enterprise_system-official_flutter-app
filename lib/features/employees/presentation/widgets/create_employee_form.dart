import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../core/network/api_exception.dart';
import '../../../parties/domain/entities/party.dart';
import '../../../../core/i18n/l10n_ext.dart';
import '../../domain/entities/employee.dart';
import '../../domain/repositories/employees_repository.dart';
import '../providers/employees_notifier.dart';
import '../providers/employees_providers.dart';

/// Formato `YYYY-MM-DD` requerido por el backend.
String formatIsoDate(DateTime date) {
  final year = date.year.toString().padLeft(4, '0');
  final month = date.month.toString().padLeft(2, '0');
  final day = date.day.toString().padLeft(2, '0');
  return '$year-$month-$day';
}

/// Formulario de alta de empleado (modal V5).
String _employeeStatusLabel(BuildContext context, EmployeeStatus status) =>
    switch (status) {
      EmployeeStatus.active => context.l10n.statusActive,
      EmployeeStatus.onLeave => context.l10n.statusOnLeave,
      EmployeeStatus.terminated => context.l10n.statusTerminated,
    };

class CreateEmployeeForm extends StatefulWidget {
  const CreateEmployeeForm({
    super.key,
    required this.parties,
    required this.jobs,
    required this.departments,
    required this.onSubmit,
  });

  final List<Party> parties;
  final List<Job> jobs;
  final List<Department> departments;

  /// Devuelve un mensaje de error o `null` si el guardado fue exitoso.
  final Future<String?> Function(CreateEmployeeParams params) onSubmit;

  @override
  State<CreateEmployeeForm> createState() => _CreateEmployeeFormState();
}

class _CreateEmployeeFormState extends State<CreateEmployeeForm> {
  final _formKey = GlobalKey<FormState>();
  final _codeController = TextEditingController();
  final _hireDateController = TextEditingController();

  String? _partyId;
  String? _jobId;
  String? _departmentId;
  EmployeeStatus _status = EmployeeStatus.active;
  bool _saving = false;
  String? _error;

  @override
  void dispose() {
    _codeController.dispose();
    _hireDateController.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(1950),
      lastDate: DateTime(now.year + 1, 12, 31),
    );
    if (picked != null) {
      setState(() => _hireDateController.text = formatIsoDate(picked));
    }
  }

  Future<void> _submit() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    setState(() {
      _saving = true;
      _error = null;
    });

    final error = await widget.onSubmit(
      CreateEmployeeParams(
        partyId: _partyId!,
        employeeCode: _codeController.text.trim(),
        hireDate: _hireDateController.text,
        jobId: _jobId!,
        departmentId: _departmentId!,
        status: _status,
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
          _Label(context.l10n.partyPersonLabel),
          const SizedBox(height: 6),
          DropdownButtonFormField<String>(
            key: const Key('employee_party'),
            isExpanded: true,
            decoration: InputDecoration(hintText: context.l10n.selectPerson),
            items: [
              for (final party in widget.parties)
                DropdownMenuItem(
                  value: party.id,
                  child: Text(party.displayName),
                ),
            ],
            onChanged: _saving
                ? null
                : (value) => setState(() => _partyId = value),
            validator: (value) => value == null ? context.l10n.required : null,
          ),
          const SizedBox(height: 16),

          _Label(context.l10n.employeeCode),
          const SizedBox(height: 6),
          TextFormField(
            key: const Key('employee_code'),
            controller: _codeController,
            enabled: !_saving,
            decoration: const InputDecoration(hintText: 'EMP-0001'),
            validator: (value) => (value == null || value.trim().isEmpty)
                ? context.l10n.required
                : null,
          ),
          const SizedBox(height: 16),

          _Label(context.l10n.jobTitle),
          const SizedBox(height: 6),
          DropdownButtonFormField<String>(
            key: const Key('employee_job'),
            isExpanded: true,
            decoration: InputDecoration(hintText: context.l10n.selectJob),
            items: [
              for (final job in widget.jobs)
                DropdownMenuItem(value: job.id, child: Text(job.title)),
            ],
            onChanged: _saving
                ? null
                : (value) => setState(() => _jobId = value),
            validator: (value) => value == null ? context.l10n.required : null,
          ),
          const SizedBox(height: 16),

          _Label(context.l10n.departmentLabel),
          const SizedBox(height: 6),
          DropdownButtonFormField<String>(
            key: const Key('employee_department'),
            isExpanded: true,
            decoration: InputDecoration(
              hintText: context.l10n.selectDepartment,
            ),
            items: [
              for (final department in widget.departments)
                DropdownMenuItem(
                  value: department.id,
                  child: Text(department.name),
                ),
            ],
            onChanged: _saving
                ? null
                : (value) => setState(() => _departmentId = value),
            validator: (value) => value == null ? context.l10n.required : null,
          ),
          const SizedBox(height: 16),

          _Label(context.l10n.hireDate),
          const SizedBox(height: 6),
          TextFormField(
            key: const Key('hire_date'),
            controller: _hireDateController,
            readOnly: true,
            enabled: !_saving,
            onTap: _pickDate,
            decoration: const InputDecoration(
              hintText: 'YYYY-MM-DD',
              suffixIcon: Icon(Icons.calendar_today_outlined, size: 18),
            ),
            validator: (value) =>
                (value == null || value.isEmpty) ? context.l10n.required : null,
          ),
          const SizedBox(height: 16),

          _Label(context.l10n.statusLabel),
          const SizedBox(height: 6),
          DropdownButtonFormField<EmployeeStatus>(
            key: const Key('employee_status'),
            initialValue: EmployeeStatus.active,
            isExpanded: true,
            items: [
              for (final status in EmployeeStatus.values)
                DropdownMenuItem(
                  value: status,
                  child: Text(_employeeStatusLabel(context, status)),
                ),
            ],
            onChanged: _saving
                ? null
                : (value) => setState(() => _status = value ?? _status),
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

/// Abre el modal de alta de empleado (carga parties/jobs/departments).
Future<void> showCreateEmployeeDialog(BuildContext context, WidgetRef ref) {
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
          child: Consumer(
            builder: (context, dref, _) {
              final partiesAsync = dref.watch(individualPartiesProvider);
              final jobsAsync = dref.watch(jobsProvider);
              final departmentsAsync = dref.watch(departmentOptionsProvider);

              final isLoading =
                  partiesAsync.isLoading ||
                  jobsAsync.isLoading ||
                  departmentsAsync.isLoading;
              final hasError =
                  partiesAsync.hasError ||
                  jobsAsync.hasError ||
                  departmentsAsync.hasError;

              Widget content;
              if (isLoading) {
                content = const Padding(
                  padding: EdgeInsets.all(32),
                  child: Center(
                    child: SizedBox(
                      width: 22,
                      height: 22,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                  ),
                );
              } else if (hasError) {
                content = Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(l10n.catalogsError),
                      const SizedBox(height: 10),
                      TextButton(
                        onPressed: () {
                          dref.invalidate(individualPartiesProvider);
                          dref.invalidate(jobsProvider);
                          dref.invalidate(departmentOptionsProvider);
                        },
                        child: Text(l10n.retry),
                      ),
                    ],
                  ),
                );
              } else {
                content = CreateEmployeeForm(
                  parties: partiesAsync.value ?? const [],
                  jobs: jobsAsync.value ?? const [],
                  departments: departmentsAsync.value ?? const [],
                  onSubmit: (params) async {
                    try {
                      await dref
                          .read(employeesProvider.notifier)
                          .createEmployee(params);
                      if (dialogContext.mounted) {
                        Navigator.of(dialogContext).pop();
                      }
                      messenger.showSnackBar(
                        SnackBar(content: Text(l10n.employeeCreated)),
                      );
                      return null;
                    } catch (error) {
                      return error is ApiException
                          ? error.message
                          : l10n.couldNotCreateEmployee;
                    }
                  },
                );
              }

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
                            l10n.newEmployee,
                            style: Theme.of(context).textTheme.titleLarge
                                ?.copyWith(fontWeight: FontWeight.w600),
                          ),
                        ),
                        IconButton(
                          tooltip: l10n.close,
                          onPressed: () =>
                              Navigator.of(dialogContext).maybePop(),
                          icon: const Icon(Icons.close_rounded, size: 20),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    content,
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
