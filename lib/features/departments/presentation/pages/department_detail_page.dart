import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../core/i18n/l10n_ext.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/ui/skeleton.dart';
import '../../../employees/domain/entities/employee.dart' hide Department;
import '../../../employees/presentation/providers/employees_notifier.dart';
import '../../../employees/presentation/providers/employees_providers.dart';
import '../../../parties/domain/entities/party.dart';
import '../../domain/entities/corporate_group.dart';
import '../../domain/entities/department.dart';
import '../../domain/errors/department_not_found_exception.dart';
import '../providers/corporate_groups_notifier.dart';
import '../providers/department_detail_notifier.dart';
import '../providers/departments_notifier.dart';
import '../widgets/department_tree_node.dart';

/// Detalle de un departamento: información, sub-departamentos y empleados.
class DepartmentDetailPage extends ConsumerWidget {
  const DepartmentDetailPage({super.key, required this.departmentId});

  final String departmentId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final departmentAsync = ref.watch(departmentDetailProvider(departmentId));
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          tooltip: context.l10n.back,
          onPressed: () {
            if (context.canPop()) {
              context.pop();
            } else {
              context.go('/departments');
            }
          },
          icon: const Icon(Icons.arrow_back_rounded, size: 20),
        ),
        title: Text(context.l10n.departmentDetailTitle),
      ),
      body: departmentAsync.when(
        loading: () => const _DepartmentDetailSkeleton(),
        error: (error, _) => Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                error is DepartmentNotFoundException
                    ? context.l10n.departmentNotFound
                    : context.l10n.departmentDetailError,
                style: theme.textTheme.bodyMedium,
              ),
              const SizedBox(height: 8),
              TextButton(
                onPressed: () {
                  ref.invalidate(departmentsProvider);
                  ref.invalidate(departmentDetailProvider(departmentId));
                },
                child: Text(context.l10n.retry),
              ),
            ],
          ),
        ),
        data: (department) => _DepartmentDetailBody(department: department),
      ),
    );
  }
}

class _DepartmentDetailBody extends ConsumerWidget {
  const _DepartmentDetailBody({required this.department});

  final Department department;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final departmentsAsync = ref.watch(departmentsProvider);
    final employeesAsync = ref.watch(employeesProvider);
    final jobs = ref.watch(jobsProvider).value ?? const [];
    final parties = ref.watch(individualPartiesProvider).value ?? const [];
    final groupsAsync = ref.watch(corporateGroupsProvider);
    final assignments = ref.watch(groupAssignmentsProvider);

    final managerName = _partyName(parties, department.managerPartyId);

    return DefaultTabController(
      length: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _DetailHeader(department: department),
          TabBar(
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            tabs: [
              Tab(text: context.l10n.tabGeneral),
              Tab(text: context.l10n.tabSubdepartments),
              Tab(text: context.l10n.tabEmployees),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                _GeneralTab(
                  managerName: managerName,
                  createdAt: department.createdAt,
                  groupsAsync: groupsAsync,
                  assignments: assignments,
                  departmentId: department.id,
                ),
                _SubdepartmentsTab(
                  departmentsAsync: departmentsAsync,
                  parentDepartmentId: department.id,
                ),
                _EmployeesTab(
                  employeesAsync: employeesAsync,
                  departmentId: department.id,
                  parties: parties,
                  jobs: jobs,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DetailHeader extends StatelessWidget {
  const _DetailHeader({required this.department});

  final Department department;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final secondary = isDark
        ? AppColors.darkTextSecondary
        : AppColors.lightTextSecondary;
    final color = unitTypeColor(department.unitType);

    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 20, 24, 20),
      child: Row(
        children: [
          Container(
            width: 68,
            height: 68,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [color, AppColors.indigo],
              ),
              boxShadow: [
                BoxShadow(
                  color: color.withValues(alpha: 0.25),
                  blurRadius: 16,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: const Icon(
              Icons.account_tree_rounded,
              size: 30,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  department.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    letterSpacing: -0.6,
                  ),
                ),
                const SizedBox(height: 6),
                Wrap(
                  spacing: 8,
                  runSpacing: 6,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text(
                      department.code,
                      style: TextStyle(fontSize: 12.5, color: secondary),
                    ),
                    UnitTypeBadge(type: department.unitType),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  'ID: ${department.id}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 11, color: secondary),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _GeneralTab extends StatelessWidget {
  const _GeneralTab({
    required this.managerName,
    required this.createdAt,
    required this.groupsAsync,
    required this.assignments,
    required this.departmentId,
  });

  final String? managerName;
  final String? createdAt;
  final AsyncValue<List<CorporateGroup>> groupsAsync;
  final Map<String, Set<String>> assignments;
  final String departmentId;

  @override
  Widget build(BuildContext context) {
    final created = createdAt != null && createdAt!.length >= 10
        ? createdAt!.substring(0, 10)
        : null;

    return ListView(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 120),
      children: [
        _InfoCard(
          children: [
            _InfoRow(
              label: context.l10n.managerLabel,
              value: managerName ?? context.l10n.notAvailable,
            ),
            const SizedBox(height: 12),
            _InfoRow(
              label: context.l10n.createdAt,
              value: created ?? context.l10n.notAvailable,
            ),
            const SizedBox(height: 16),
            Text(
              context.l10n.corporateGroups,
              style: Theme.of(context).textTheme.titleSmall
                  ?.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),
            if (groupsAsync.isLoading)
              const SkeletonBox(height: 28, borderRadius: 999)
            else
              _GroupsWrap(
                groups: groupsAsync.value ?? const [],
                assignments: assignments,
                departmentId: departmentId,
              ),
          ],
        ),
      ],
    );
  }
}

class _GroupsWrap extends StatelessWidget {
  const _GroupsWrap({
    required this.groups,
    required this.assignments,
    required this.departmentId,
  });

  final List<CorporateGroup> groups;
  final Map<String, Set<String>> assignments;
  final String departmentId;

  @override
  Widget build(BuildContext context) {
    final assigned = [
      for (final group in groups)
        if (assignments[group.id]?.contains(departmentId) ?? false) group,
    ];
    final secondary = Theme.of(context).brightness == Brightness.dark
        ? AppColors.darkTextSecondary
        : AppColors.lightTextSecondary;
    if (assigned.isEmpty) {
      return Text(
        context.l10n.noCorporateGroup,
        style: TextStyle(fontSize: 12, color: secondary),
      );
    }
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        for (final group in assigned)
          Chip(
            label: Text(group.name),
            visualDensity: VisualDensity.compact,
            avatar: const Icon(Icons.hub_outlined, size: 14),
          ),
      ],
    );
  }
}

class _SubdepartmentsTab extends StatelessWidget {
  const _SubdepartmentsTab({
    required this.departmentsAsync,
    required this.parentDepartmentId,
  });

  final AsyncValue<List<Department>> departmentsAsync;
  final String parentDepartmentId;

  @override
  Widget build(BuildContext context) {
    return departmentsAsync.when(
      loading: () => const _ListSkeleton(),
      error: (error, _) => _EmptyState(
        icon: Icons.account_tree_outlined,
        message: context.l10n.departmentsError,
      ),
      data: (departments) {
        final children =
            departments
                .where(
                  (department) =>
                      department.parentDepartmentId == parentDepartmentId,
                )
                .toList()
              ..sort((a, b) => a.name.compareTo(b.name));
        if (children.isEmpty) {
          return _EmptyState(
            icon: Icons.account_tree_outlined,
            message: context.l10n.noSubdepartments,
          );
        }
        return ListView.separated(
          padding: const EdgeInsets.fromLTRB(24, 16, 24, 120),
          itemCount: children.length,
          separatorBuilder: (context, index) => const SizedBox(height: 10),
          itemBuilder: (context, index) =>
              _ChildDepartmentRow(department: children[index]),
        );
      },
    );
  }
}

class _ChildDepartmentRow extends StatelessWidget {
  const _ChildDepartmentRow({required this.department});

  final Department department;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final secondary = isDark
        ? AppColors.darkTextSecondary
        : AppColors.lightTextSecondary;
    final color = unitTypeColor(department.unitType);

    return InkWell(
      key: Key('department_child_${department.id}'),
      borderRadius: BorderRadius.circular(12),
      onTap: () => context.go('/departments/${department.id}'),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: isDark ? AppColors.darkSurface : AppColors.lightSurface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: theme.colorScheme.outline),
        ),
        child: Row(
          children: [
            Container(
              width: 34,
              height: 34,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.10),
                borderRadius: BorderRadius.circular(9),
              ),
              child: Icon(Icons.account_tree_outlined, size: 17, color: color),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    department.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    department.code,
                    style: TextStyle(fontSize: 11, color: secondary),
                  ),
                ],
              ),
            ),
            UnitTypeBadge(type: department.unitType),
            const SizedBox(width: 6),
            Icon(Icons.chevron_right_rounded, size: 18, color: secondary),
          ],
        ),
      ),
    );
  }
}

class _EmployeesTab extends StatelessWidget {
  const _EmployeesTab({
    required this.employeesAsync,
    required this.departmentId,
    required this.parties,
    required this.jobs,
  });

  final AsyncValue<List<Employee>> employeesAsync;
  final String departmentId;
  final List<Party> parties;
  final List<Job> jobs;

  @override
  Widget build(BuildContext context) {
    return employeesAsync.when(
      loading: () => const _ListSkeleton(),
      error: (error, _) => _EmptyState(
        icon: Icons.badge_outlined,
        message: context.l10n.employeesError,
      ),
      data: (employees) {
        final assigned =
            employees
                .where((employee) => employee.departmentId == departmentId)
                .toList()
              ..sort((a, b) {
                final nameA = _partyName(parties, a.partyId) ?? a.partyId;
                final nameB = _partyName(parties, b.partyId) ?? b.partyId;
                return nameA.compareTo(nameB);
              });
        if (assigned.isEmpty) {
          return _EmptyState(
            icon: Icons.badge_outlined,
            message: context.l10n.noDepartmentEmployees,
          );
        }
        return ListView.separated(
          padding: const EdgeInsets.fromLTRB(24, 16, 24, 120),
          itemCount: assigned.length,
          separatorBuilder: (context, index) => const SizedBox(height: 10),
          itemBuilder: (context, index) {
            final employee = assigned[index];
            final name =
                _partyName(parties, employee.partyId) ??
                'Party ${employee.partyId}';
            return _EmployeeRow(
              employee: employee,
              name: name,
              jobTitle: _jobTitle(jobs, employee.jobId),
            );
          },
        );
      },
    );
  }
}

class _EmployeeRow extends StatelessWidget {
  const _EmployeeRow({
    required this.employee,
    required this.name,
    required this.jobTitle,
  });

  final Employee employee;
  final String name;
  final String? jobTitle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final secondary = isDark
        ? AppColors.darkTextSecondary
        : AppColors.lightTextSecondary;

    return InkWell(
      key: Key('department_employee_${employee.partyId}'),
      borderRadius: BorderRadius.circular(12),
      onTap: () => context.go('/employees/${employee.partyId}'),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isDark ? AppColors.darkSurface : AppColors.lightSurface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: theme.colorScheme.outline),
        ),
        child: Row(
          children: [
            Container(
              width: 38,
              height: 38,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFF0EA5E9), AppColors.indigo],
                ),
              ),
              child: Text(
                _initials(name),
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
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
                    jobTitle == null
                        ? employee.employeeCode
                        : '${employee.employeeCode} · $jobTitle',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 11, color: secondary),
                  ),
                ],
              ),
            ),
            Icon(Icons.chevron_right_rounded, size: 18, color: secondary),
          ],
        ),
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  const _InfoCard({required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSurface : AppColors.lightSurface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: theme.colorScheme.outline),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final secondary = isDark
        ? AppColors.darkTextSecondary
        : AppColors.lightTextSecondary;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 150,
          child: Text(
            label,
            style: TextStyle(fontSize: 12.5, color: secondary),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState({required this.icon, required this.message});

  final IconData icon;
  final String message;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 32, color: theme.textTheme.bodySmall?.color),
          const SizedBox(height: 10),
          Text(message, style: theme.textTheme.bodyMedium),
        ],
      ),
    );
  }
}

class _ListSkeleton extends StatelessWidget {
  const _ListSkeleton();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(24),
      itemCount: 3,
      separatorBuilder: (context, index) => const SizedBox(height: 10),
      itemBuilder: (context, index) =>
          const SkeletonBox(height: 66, borderRadius: 12),
    );
  }
}

class _DepartmentDetailSkeleton extends StatelessWidget {
  const _DepartmentDetailSkeleton();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(24),
      children: const [
        Row(
          children: [
            SkeletonBox(width: 68, height: 68, borderRadius: 18),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SkeletonBox(width: 180, height: 18),
                  SizedBox(height: 8),
                  SkeletonBox(width: 100, height: 12),
                  SizedBox(height: 8),
                  SkeletonBox(width: 140, height: 10),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 24),
        SkeletonBox(height: 36, borderRadius: 10),
        SizedBox(height: 24),
        SkeletonBox(height: 220, borderRadius: 12),
      ],
    );
  }
}

String? _partyName(List<Party> parties, String? id) {
  if (id == null) return null;
  for (final party in parties) {
    if (party.id == id) return party.displayName;
  }
  return null;
}

String? _jobTitle(List<Job> jobs, String id) {
  for (final job in jobs) {
    if (job.id == id) return job.title;
  }
  return null;
}

String _initials(String name) {
  final parts = name
      .trim()
      .split(RegExp(r'\s+'))
      .where((part) => part.isNotEmpty)
      .toList();
  if (parts.isEmpty) return '?';
  if (parts.length == 1) {
    final single = parts.first;
    return (single.length >= 2 ? single.substring(0, 2) : single).toUpperCase();
  }
  return '${parts.first.substring(0, 1)}${parts[1].substring(0, 1)}'
      .toUpperCase();
}
