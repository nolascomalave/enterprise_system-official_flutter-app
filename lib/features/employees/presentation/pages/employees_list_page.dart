import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/i18n/l10n_ext.dart';
import '../../domain/entities/employee.dart';
import '../providers/employees_notifier.dart';
import '../providers/employees_providers.dart';
import '../widgets/create_employee_form.dart';

/// Lista de Empleados — Data Grid V5 Premium.
class EmployeesListPage extends ConsumerStatefulWidget {
  const EmployeesListPage({super.key});

  @override
  ConsumerState<EmployeesListPage> createState() => _EmployeesListPageState();
}

class _EmployeesListPageState extends ConsumerState<EmployeesListPage> {
  final _searchController = TextEditingController();
  String _query = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final employeesAsync = ref.watch(employeesProvider);
    final parties = ref.watch(individualPartiesProvider).value ?? const [];
    final jobs = ref.watch(jobsProvider).value ?? const [];
    final departments = ref.watch(departmentOptionsProvider).value ?? const [];

    final partyNames = {
      for (final party in parties) party.id: party.displayName,
    };
    final jobTitles = {for (final job in jobs) job.id: job.title};
    final departmentNames = {
      for (final department in departments) department.id: department.name,
    };

    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return SafeArea(
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1120),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 24, 24, 120),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _Header(
                  searchController: _searchController,
                  onSearch: (value) => setState(() => _query = value),
                  onCreate: () => showCreateEmployeeDialog(context, ref),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: employeesAsync.when(
                    loading: () => const Center(
                      child: SizedBox(
                        width: 22,
                        height: 22,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                    ),
                    error: (error, _) => _ErrorState(
                      onRetry: () => ref.invalidate(employeesProvider),
                    ),
                    data: (employees) {
                      final q = _query.trim().toLowerCase();
                      final filtered = q.isEmpty
                          ? employees
                          : employees.where((employee) {
                              final name = partyNames[employee.partyId] ?? '';
                              final job = jobTitles[employee.jobId] ?? '';
                              final department =
                                  departmentNames[employee.departmentId] ?? '';
                              return name.toLowerCase().contains(q) ||
                                  employee.employeeCode.toLowerCase().contains(
                                    q,
                                  ) ||
                                  job.toLowerCase().contains(q) ||
                                  department.toLowerCase().contains(q) ||
                                  _employeeStatusLabel(
                                    context,
                                    employee.status,
                                  ).toLowerCase().contains(q);
                            }).toList();

                      return Container(
                        decoration: BoxDecoration(
                          color: isDark ? AppColors.darkSurface : Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: theme.colorScheme.outline),
                          boxShadow: isDark
                              ? AppShadows.premiumDark
                              : AppShadows.premiumLight,
                        ),
                        child: filtered.isEmpty
                            ? _EmptyState(query: _query)
                            : LayoutBuilder(
                                builder: (context, constraints) {
                                  if (constraints.maxWidth >= 760) {
                                    return _EmployeesTable(
                                      employees: filtered,
                                      partyNames: partyNames,
                                      jobTitles: jobTitles,
                                      departmentNames: departmentNames,
                                    );
                                  }
                                  return _EmployeesList(
                                    employees: filtered,
                                    partyNames: partyNames,
                                    jobTitles: jobTitles,
                                    departmentNames: departmentNames,
                                  );
                                },
                              ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({
    required this.searchController,
    required this.onSearch,
    required this.onCreate,
  });

  final TextEditingController searchController;
  final ValueChanged<String> onSearch;
  final VoidCallback onCreate;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth >= 760;

        final title = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.l10n.employeesTitle,
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w600,
                letterSpacing: -0.6,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              context.l10n.employeesSubtitle,
              style: TextStyle(
                fontSize: 13,
                color: isDark
                    ? AppColors.darkTextSecondary
                    : AppColors.lightTextSecondary,
              ),
            ),
          ],
        );

        final search = TextField(
          controller: searchController,
          onChanged: onSearch,
          style: const TextStyle(fontSize: 13),
          decoration: InputDecoration(
            isDense: true,
            hintText: context.l10n.employeesSearch,
            hintStyle: const TextStyle(fontSize: 13, color: Color(0xFF71717A)),
            prefixIcon: const Icon(
              Icons.search_rounded,
              size: 17,
              color: Color(0xFF71717A),
            ),
            prefixIconConstraints: const BoxConstraints(minWidth: 38),
            contentPadding: const EdgeInsets.symmetric(vertical: 12),
          ),
        );

        final createButton = ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Material(
            color: Colors.transparent,
            child: Ink(
              height: 42,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColors.indigo, AppColors.violet],
                ),
              ),
              child: InkWell(
                onTap: onCreate,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.add_rounded,
                        size: 17,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        context.l10n.newEmployee,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );

        if (!isWide) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              title,
              const SizedBox(height: 16),
              search,
              const SizedBox(height: 12),
              Align(alignment: Alignment.centerLeft, child: createButton),
            ],
          );
        }

        return Row(
          children: [
            Expanded(child: title),
            SizedBox(width: 240, child: search),
            const SizedBox(width: 12),
            createButton,
          ],
        );
      },
    );
  }
}

class _EmployeesTable extends StatelessWidget {
  const _EmployeesTable({
    required this.employees,
    required this.partyNames,
    required this.jobTitles,
    required this.departmentNames,
  });

  final List<Employee> employees;
  final Map<String, String> partyNames;
  final Map<String, String> jobTitles;
  final Map<String, String> departmentNames;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final secondary = isDark
        ? AppColors.darkTextSecondary
        : AppColors.lightTextSecondary;

    Widget headerCell(String label, int flex) => Expanded(
      flex: flex,
      child: Text(
        label,
        style: TextStyle(
          fontSize: 10.5,
          fontWeight: FontWeight.w600,
          letterSpacing: 1.2,
          color: secondary,
        ),
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          color: secondary.withValues(alpha: 0.03),
          child: Row(
            children: [
              headerCell(context.l10n.colEmployee, 5),
              headerCell(context.l10n.colCode, 3),
              headerCell(context.l10n.colJob, 4),
              headerCell(context.l10n.colDepartment, 4),
              headerCell(context.l10n.colStatus, 3),
            ],
          ),
        ),
        Divider(height: 1, color: theme.colorScheme.outline),
        Expanded(
          child: ListView.separated(
            itemCount: employees.length,
            separatorBuilder: (context, index) => Divider(
              height: 1,
              color: theme.colorScheme.outline.withValues(alpha: 0.5),
            ),
            itemBuilder: (context, index) {
              final employee = employees[index];
              final name =
                  partyNames[employee.partyId] ?? 'Party ${employee.partyId}';
              return InkWell(
                key: Key('employee_row_${employee.id}'),
                onTap: () => context.go('/employees/${employee.id}'),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 12,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 5,
                        child: Row(
                          children: [
                            _EmployeeAvatar(name: name),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                name,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Text(
                          employee.employeeCode,
                          style: TextStyle(fontSize: 12.5, color: secondary),
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Text(
                          jobTitles[employee.jobId] ?? '—',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 12.5, color: secondary),
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Text(
                          departmentNames[employee.departmentId] ?? '—',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 12.5, color: secondary),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: _EmployeeStatusBadge(status: employee.status),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _EmployeesList extends StatelessWidget {
  const _EmployeesList({
    required this.employees,
    required this.partyNames,
    required this.jobTitles,
    required this.departmentNames,
  });

  final List<Employee> employees;
  final Map<String, String> partyNames;
  final Map<String, String> jobTitles;
  final Map<String, String> departmentNames;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final secondary = isDark
        ? AppColors.darkTextSecondary
        : AppColors.lightTextSecondary;

    return ListView.separated(
      itemCount: employees.length,
      separatorBuilder: (context, index) => Divider(
        height: 1,
        color: theme.colorScheme.outline.withValues(alpha: 0.5),
      ),
      itemBuilder: (context, index) {
        final employee = employees[index];
        final name =
            partyNames[employee.partyId] ?? 'Party ${employee.partyId}';
        return InkWell(
          key: Key('employee_row_${employee.id}'),
          onTap: () => context.go('/employees/${employee.id}'),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                _EmployeeAvatar(name: name, size: 36),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        '${employee.employeeCode} · ${jobTitles[employee.jobId] ?? '—'} · ${departmentNames[employee.departmentId] ?? '—'}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 11, color: secondary),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                _EmployeeStatusBadge(status: employee.status),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _EmployeeAvatar extends StatelessWidget {
  const _EmployeeAvatar({required this.name, this.size = 32});

  final String name;
  final double size;

  String get _initials {
    final parts = name
        .trim()
        .split(RegExp(r'\s+'))
        .where((p) => p.isNotEmpty)
        .toList();
    if (parts.isEmpty) return '?';
    if (parts.length == 1) {
      final single = parts.first;
      return (single.length >= 2 ? single.substring(0, 2) : single)
          .toUpperCase();
    }
    return '${parts.first.substring(0, 1)}${parts[1].substring(0, 1)}'
        .toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [Color(0xFF6366F1), Color(0xFF9333EA)],
        ),
      ),
      child: Text(
        _initials,
        style: TextStyle(
          fontSize: size * 0.34,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
    );
  }
}

String _employeeStatusLabel(BuildContext context, EmployeeStatus status) =>
    switch (status) {
      EmployeeStatus.active => context.l10n.statusActive,
      EmployeeStatus.onLeave => context.l10n.statusOnLeave,
      EmployeeStatus.terminated => context.l10n.statusTerminated,
    };

class _EmployeeStatusBadge extends StatelessWidget {
  const _EmployeeStatusBadge({required this.status});

  final EmployeeStatus status;

  Color get _color => switch (status) {
    EmployeeStatus.active => AppColors.success,
    EmployeeStatus.onLeave => AppColors.warning,
    EmployeeStatus.terminated => AppColors.danger,
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: _color.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: _color.withValues(alpha: 0.2)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(shape: BoxShape.circle, color: _color),
          ),
          const SizedBox(width: 5),
          Text(
            _employeeStatusLabel(context, status),
            style: TextStyle(
              fontSize: 10.5,
              fontWeight: FontWeight.w500,
              color: _color,
            ),
          ),
        ],
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState({this.query});

  final String? query;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final secondary = theme.textTheme.bodySmall?.color;
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.badge_outlined, size: 36, color: secondary),
          const SizedBox(height: 10),
          Text(
            (query ?? '').isEmpty
                ? context.l10n.employeesEmpty
                : context.l10n.noResults(query!),
            style: theme.textTheme.bodyMedium,
          ),
          if ((query ?? '').isEmpty) ...[
            const SizedBox(height: 4),
            Text(
              context.l10n.employeesEmptyHint,
              style: theme.textTheme.bodySmall,
            ),
          ],
        ],
      ),
    );
  }
}

class _ErrorState extends StatelessWidget {
  const _ErrorState({required this.onRetry});

  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(context.l10n.employeesError),
          const SizedBox(height: 8),
          TextButton(onPressed: onRetry, child: Text(context.l10n.retry)),
        ],
      ),
    );
  }
}
