import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../core/i18n/l10n_ext.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/ui/skeleton.dart';
import '../../../parties/domain/entities/party.dart';
import '../../../parties/domain/entities/party_detail.dart';
import '../../../parties/presentation/providers/party_detail_notifier.dart';
import '../../domain/entities/employee.dart';
import '../../domain/errors/employee_not_found_exception.dart';
import '../providers/employee_detail_notifier.dart';
import '../providers/employees_providers.dart';

/// Detalle de un empleado: información laboral, asignaciones y contactos.
class EmployeeDetailPage extends ConsumerWidget {
  const EmployeeDetailPage({super.key, required this.employeeId});

  final String employeeId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final employeeAsync = ref.watch(employeeDetailProvider(employeeId));
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          tooltip: context.l10n.back,
          onPressed: () {
            if (context.canPop()) {
              context.pop();
            } else {
              context.go('/employees');
            }
          },
          icon: const Icon(Icons.arrow_back_rounded, size: 20),
        ),
        title: Text(context.l10n.employeeDetailTitle),
      ),
      body: employeeAsync.when(
        loading: () => const _EmployeeDetailSkeleton(),
        error: (error, _) => Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                error is EmployeeNotFoundException
                    ? context.l10n.employeeNotFound
                    : context.l10n.employeeDetailError,
                style: theme.textTheme.bodyMedium,
              ),
              const SizedBox(height: 8),
              TextButton(
                onPressed: () =>
                    ref.invalidate(employeeDetailProvider(employeeId)),
                child: Text(context.l10n.retry),
              ),
            ],
          ),
        ),
        data: (employee) => _EmployeeDetailBody(employee: employee),
      ),
    );
  }
}

class _EmployeeDetailBody extends ConsumerWidget {
  const _EmployeeDetailBody({required this.employee});

  final Employee employee;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final parties = ref.watch(individualPartiesProvider).value ?? const [];
    final jobs = ref.watch(jobsProvider).value ?? const [];
    final departments = ref.watch(departmentOptionsProvider).value ?? const [];
    final partyDetailAsync = ref.watch(partyDetailProvider(employee.partyId));

    final party = _findParty(parties, employee.partyId);
    final manager = employee.managerPartyId == null
        ? null
        : _findParty(parties, employee.managerPartyId!);
    final displayName =
        party?.displayName ??
        partyDetailAsync.value?.displayName ??
        employee.employeeCode;
    final jobTitle = _jobTitle(jobs, employee.jobId);
    final departmentName = _departmentName(departments, employee.departmentId);
    final managerName = manager?.displayName;

    return DefaultTabController(
      length: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _DetailHeader(employee: employee, displayName: displayName),
          TabBar(
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            tabs: [
              Tab(text: context.l10n.tabEmployment),
              Tab(text: context.l10n.tabAssignments),
              Tab(text: context.l10n.tabContactsEmployee),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                _EmploymentTab(
                  jobTitle: jobTitle,
                  departmentName: departmentName,
                  hireDate: employee.hireDate,
                  managerName: managerName,
                ),
                const _AssignmentsTab(),
                _ContactsTab(partyDetailAsync: partyDetailAsync),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DetailHeader extends StatelessWidget {
  const _DetailHeader({required this.employee, required this.displayName});

  final Employee employee;
  final String displayName;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final secondary = isDark
        ? AppColors.darkTextSecondary
        : AppColors.lightTextSecondary;
    final statusColor = _statusColor(employee.status);

    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 20, 24, 20),
      child: Row(
        children: [
          Container(
            width: 68,
            height: 68,
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
              _initials(displayName),
              style: const TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  displayName,
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
                      employee.employeeCode,
                      style: TextStyle(fontSize: 12.5, color: secondary),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 9,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: statusColor.withValues(alpha: 0.10),
                        borderRadius: BorderRadius.circular(999),
                        border: Border.all(
                          color: statusColor.withValues(alpha: 0.2),
                        ),
                      ),
                      child: Text(
                        _statusLabel(context, employee.status),
                        style: TextStyle(
                          fontSize: 10.5,
                          fontWeight: FontWeight.w600,
                          color: statusColor,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  'ID: ${employee.partyId}',
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

class _EmploymentTab extends StatelessWidget {
  const _EmploymentTab({
    required this.jobTitle,
    required this.departmentName,
    required this.hireDate,
    required this.managerName,
  });

  final String? jobTitle;
  final String? departmentName;
  final String hireDate;
  final String? managerName;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 120),
      children: [
        _InfoCard(
          children: [
            _InfoRow(
              label: context.l10n.jobTitle,
              value: jobTitle ?? context.l10n.notAvailable,
            ),
            const SizedBox(height: 12),
            _InfoRow(
              label: context.l10n.departmentLabel,
              value: departmentName ?? context.l10n.notAvailable,
            ),
            const SizedBox(height: 12),
            _InfoRow(
              label: context.l10n.hireDate,
              value: hireDate.isEmpty ? context.l10n.notAvailable : hireDate,
            ),
            const SizedBox(height: 12),
            _InfoRow(
              label: context.l10n.managerLabel,
              value: managerName ?? context.l10n.notAvailable,
            ),
          ],
        ),
      ],
    );
  }
}

class _AssignmentsTab extends StatelessWidget {
  const _AssignmentsTab();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.timeline_rounded,
              size: 34,
              color: theme.textTheme.bodySmall?.color,
            ),
            const SizedBox(height: 10),
            Text(
              context.l10n.assignmentsUnavailable,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}

class _ContactsTab extends StatelessWidget {
  const _ContactsTab({required this.partyDetailAsync});

  final AsyncValue<PartyDetail> partyDetailAsync;

  @override
  Widget build(BuildContext context) {
    return partyDetailAsync.when(
      loading: () => const _ContactsSkeleton(),
      error: (error, _) => _EmptyContacts(),
      data: (detail) => detail.contacts.isEmpty
          ? _EmptyContacts()
          : ListView.separated(
              padding: const EdgeInsets.fromLTRB(24, 16, 24, 120),
              itemCount: detail.contacts.length,
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemBuilder: (context, index) =>
                  _ContactCard(contact: detail.contacts[index]),
            ),
    );
  }
}

class _ContactCard extends StatelessWidget {
  const _ContactCard({required this.contact});

  final PartyContact contact;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final secondary = isDark
        ? AppColors.darkTextSecondary
        : AppColors.lightTextSecondary;

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSurface : AppColors.lightSurface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: theme.colorScheme.outline),
      ),
      child: Row(
        children: [
          Icon(
            contact.isPhone
                ? Icons.phone_outlined
                : contact.isEmail
                ? Icons.mail_outline_rounded
                : Icons.contact_mail_outlined,
            size: 18,
            color: AppColors.indigo,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  contact.value,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  contact.type,
                  style: TextStyle(fontSize: 11, color: secondary),
                ),
              ],
            ),
          ),
          if (contact.isPrimary)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              decoration: BoxDecoration(
                color: AppColors.indigo.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(999),
              ),
              child: Text(
                context.l10n.primary,
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: AppColors.indigo,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _EmptyContacts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.alternate_email_rounded,
            size: 32,
            color: theme.textTheme.bodySmall?.color,
          ),
          const SizedBox(height: 10),
          Text(context.l10n.noContacts, style: theme.textTheme.bodyMedium),
        ],
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

class _EmployeeDetailSkeleton extends StatelessWidget {
  const _EmployeeDetailSkeleton();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(24),
      children: const [
        Row(
          children: [
            SkeletonBox(width: 68, height: 68, borderRadius: 34),
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

class _ContactsSkeleton extends StatelessWidget {
  const _ContactsSkeleton();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(24),
      itemCount: 3,
      separatorBuilder: (context, index) => const SizedBox(height: 10),
      itemBuilder: (context, index) =>
          const SkeletonBox(height: 58, borderRadius: 12),
    );
  }
}

Party? _findParty(List<Party> parties, String id) {
  for (final party in parties) {
    if (party.id == id) return party;
  }
  return null;
}

String? _jobTitle(List<Job> jobs, String id) {
  for (final job in jobs) {
    if (job.id == id) return job.title;
  }
  return null;
}

String? _departmentName(List<Department> departments, String id) {
  for (final department in departments) {
    if (department.id == id) return department.name;
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

Color _statusColor(EmployeeStatus status) => switch (status) {
  EmployeeStatus.active => AppColors.success,
  EmployeeStatus.onLeave => AppColors.warning,
  EmployeeStatus.terminated => AppColors.danger,
};

String _statusLabel(BuildContext context, EmployeeStatus status) =>
    switch (status) {
      EmployeeStatus.active => context.l10n.statusActive,
      EmployeeStatus.onLeave => context.l10n.statusOnLeave,
      EmployeeStatus.terminated => context.l10n.statusTerminated,
    };
