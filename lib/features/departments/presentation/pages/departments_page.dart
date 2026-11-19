import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../core/theme/app_colors.dart';
import '../../domain/entities/corporate_group.dart';
import '../../domain/entities/department.dart';
import '../providers/corporate_groups_notifier.dart';
import '../providers/departments_notifier.dart';
import '../widgets/department_dialogs.dart';
import '../widgets/department_tree_node.dart';

enum DepartmentsTab { hierarchy, groups }

/// Departamentos + Grupos Corporativos (V5).
class DepartmentsPage extends ConsumerStatefulWidget {
  const DepartmentsPage({super.key});

  @override
  ConsumerState<DepartmentsPage> createState() => _DepartmentsPageState();
}

class _DepartmentsPageState extends ConsumerState<DepartmentsPage> {
  DepartmentsTab _tab = DepartmentsTab.hierarchy;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final actionButton = _GradientAction(
      label: _tab == DepartmentsTab.hierarchy ? 'Nuevo Departamento' : 'Nuevo Grupo',
      icon: Icons.add_rounded,
      onTap: () {
        if (_tab == DepartmentsTab.hierarchy) {
          showCreateDepartmentDialog(context, ref);
        } else {
          showCreateCorporateGroupDialog(context, ref);
        }
      },
    );

    return SafeArea(
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1120),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 24, 24, 120),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Departamentos',
                            style: theme.textTheme.headlineSmall?.copyWith(
                              fontWeight: FontWeight.w600,
                              letterSpacing: -0.6,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            'Estructura organizativa de Acme Corporation',
                            style: TextStyle(
                              fontSize: 13,
                              color: isDark
                                  ? AppColors.darkTextSecondary
                                  : AppColors.lightTextSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    actionButton,
                  ],
                ),
                const SizedBox(height: 16),
                SegmentedButton<DepartmentsTab>(
                  segments: const [
                    ButtonSegment(
                      value: DepartmentsTab.hierarchy,
                      label: Text('Jerarquía'),
                      icon: Icon(Icons.account_tree_outlined, size: 16),
                    ),
                    ButtonSegment(
                      value: DepartmentsTab.groups,
                      label: Text('Grupos corporativos'),
                      icon: Icon(Icons.hub_outlined, size: 16),
                    ),
                  ],
                  selected: {_tab},
                  showSelectedIcon: false,
                  onSelectionChanged: (selection) =>
                      setState(() => _tab = selection.first),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: _tab == DepartmentsTab.hierarchy
                      ? const _HierarchyView()
                      : const _CorporateGroupsView(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _GradientAction extends StatelessWidget {
  const _GradientAction({
    required this.label,
    required this.icon,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Material(
        color: Colors.transparent,
        child: Ink(
          height: 42,
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [AppColors.indigo, AppColors.violet]),
          ),
          child: InkWell(
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(icon, size: 17, color: Colors.white),
                  const SizedBox(width: 6),
                  Text(
                    label,
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
  }
}

class _HierarchyView extends ConsumerWidget {
  const _HierarchyView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final treeAsync = ref.watch(departmentTreeProvider);
    final theme = Theme.of(context);

    return treeAsync.when(
      loading: () => const Center(
        child: SizedBox(
          width: 22,
          height: 22,
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
      ),
      error: (error, _) => Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('No se pudieron cargar los departamentos'),
            const SizedBox(height: 8),
            TextButton(
              onPressed: () => ref.invalidate(departmentsProvider),
              child: const Text('Reintentar'),
            ),
          ],
        ),
      ),
      data: (tree) {
        if (tree.isEmpty) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Aún no hay departamentos', style: theme.textTheme.bodyMedium),
                const SizedBox(height: 4),
                Text('Crea el primero con "Nuevo Departamento"',
                    style: theme.textTheme.bodySmall),
              ],
            ),
          );
        }
        return Container(
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: theme.colorScheme.outline),
          ),
          child: ListView(
            padding: const EdgeInsets.symmetric(vertical: 8),
            children: [
              for (final node in tree)
                DepartmentTreeNode(
                  node: node,
                  onCreateChild: (department) => showCreateDepartmentDialog(
                    context,
                    ref,
                    parentId: department.id,
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}

class _CorporateGroupsView extends ConsumerWidget {
  const _CorporateGroupsView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final groupsAsync = ref.watch(corporateGroupsProvider);
    final theme = Theme.of(context);

    return groupsAsync.when(
      loading: () => const Center(
        child: SizedBox(
          width: 22,
          height: 22,
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
      ),
      error: (error, _) => Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('No se pudieron cargar los grupos corporativos'),
            const SizedBox(height: 8),
            TextButton(
              onPressed: () => ref.invalidate(corporateGroupsProvider),
              child: const Text('Reintentar'),
            ),
          ],
        ),
      ),
      data: (groups) {
        if (groups.isEmpty) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Aún no hay grupos corporativos',
                    style: theme.textTheme.bodyMedium),
                const SizedBox(height: 4),
                Text('Crea el primero con "Nuevo Grupo"', style: theme.textTheme.bodySmall),
              ],
            ),
          );
        }
        return ListView.separated(
          itemCount: groups.length,
          separatorBuilder: (context, index) => const SizedBox(height: 12),
          itemBuilder: (context, index) => _CorporateGroupCard(group: groups[index]),
        );
      },
    );
  }
}

class _CorporateGroupCard extends ConsumerWidget {
  const _CorporateGroupCard({required this.group});

  final CorporateGroup group;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final assignments = ref.watch(groupAssignmentsProvider);
    final departments = ref.watch(departmentsProvider).value ?? const [];
    final assignedIds = assignments[group.id] ?? const <String>{};
    final assignedDepartments = departments
        .where((department) => assignedIds.contains(department.id))
        .toList();

    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: theme.colorScheme.outline),
      ),
      child: ExpansionTile(
        shape: const Border(),
        collapsedShape: const Border(),
        backgroundColor: Colors.transparent,
        collapsedBackgroundColor: Colors.transparent,
        tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
        leading: Container(
          width: 34,
          height: 34,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.indigo.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(9),
          ),
          child: const Icon(Icons.hub_outlined, size: 17, color: AppColors.indigo),
        ),
        title: Row(
          children: [
            Expanded(
              child: Text(
                group.name,
                style: const TextStyle(fontSize: 13.5, fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              decoration: BoxDecoration(
                color: AppColors.indigo.withValues(alpha: 0.10),
                borderRadius: BorderRadius.circular(999),
              ),
              child: Text(
                '${assignedIds.length} dpto${assignedIds.length == 1 ? '' : 's'}',
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: AppColors.indigo,
                ),
              ),
            ),
          ],
        ),
        subtitle: group.description == null || group.description!.isEmpty
            ? null
            : Text(
                group.description!,
                style: const TextStyle(fontSize: 11, color: Color(0xFF71717A)),
              ),
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (assignedDepartments.isEmpty)
                  Text(
                    'Sin departamentos asignados en esta sesión',
                    style: theme.textTheme.bodySmall,
                  )
                else
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      for (final Department department in assignedDepartments)
                        Container(
                          padding:
                              const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                            color: theme.colorScheme.surfaceContainerHighest,
                            borderRadius: BorderRadius.circular(999),
                            border: Border.all(color: theme.colorScheme.outline),
                          ),
                          child: Text(
                            department.name,
                            style: const TextStyle(fontSize: 11),
                          ),
                        ),
                    ],
                  ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton.icon(
                    onPressed: () =>
                        showAssignDepartmentDialog(context, ref, group),
                    icon: const Icon(Icons.add_link_rounded, size: 16),
                    label: const Text('Asignar departamento'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
