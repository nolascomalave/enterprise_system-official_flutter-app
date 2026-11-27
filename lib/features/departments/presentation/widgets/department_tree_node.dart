import 'package:material_ui/material_ui.dart';

import '../../../../core/i18n/l10n_ext.dart';
import '../../domain/entities/department.dart';

/// Colores V5 por tipo de unidad.
Color unitTypeColor(DepartmentUnitType type) => switch (type) {
  DepartmentUnitType.division => const Color(0xFF6366F1),
  DepartmentUnitType.branch => const Color(0xFFF59E0B),
  DepartmentUnitType.office => const Color(0xFF10B981),
  DepartmentUnitType.department => const Color(0xFF0EA5E9),
};

class UnitTypeBadge extends StatelessWidget {
  const UnitTypeBadge({super.key, required this.type});

  final DepartmentUnitType type;

  @override
  Widget build(BuildContext context) {
    final color = unitTypeColor(type);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: color.withValues(alpha: 0.25)),
      ),
      child: Text(
        switch (type) {
          DepartmentUnitType.division => context.l10n.unitDivision,
          DepartmentUnitType.branch => context.l10n.unitBranch,
          DepartmentUnitType.office => context.l10n.unitOffice,
          DepartmentUnitType.department => context.l10n.unitDepartment,
        },
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w600,
          color: color,
        ),
      ),
    );
  }
}

/// Nodo recursivo de la jerarquía de departamentos (ExpansionTile V5).
class DepartmentTreeNode extends StatelessWidget {
  const DepartmentTreeNode({
    super.key,
    required this.node,
    required this.onCreateChild,
    this.onOpen,
    this.level = 0,
  });

  final DepartmentNode node;
  final ValueChanged<Department> onCreateChild;
  final ValueChanged<Department>? onOpen;
  final int level;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final department = node.department;
    final secondary = isDark
        ? const Color(0xFFA1A1AA)
        : const Color(0xFF71717A);
    final color = unitTypeColor(department.unitType);

    final title = Row(
      children: [
        Flexible(
          child: InkWell(
            onTap: onOpen == null ? null : () => onOpen!(department),
            borderRadius: BorderRadius.circular(6),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Text(
                department.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 13.5,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        UnitTypeBadge(type: department.unitType),
        const SizedBox(width: 4),
        IconButton(
          key: ValueKey('add-child-${department.id}'),
          tooltip: context.l10n.newSubDepartment,
          onPressed: () => onCreateChild(department),
          icon: const Icon(Icons.add_rounded, size: 16),
          visualDensity: VisualDensity.compact,
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
        ),
      ],
    );

    final subtitle = Text(
      department.code,
      style: TextStyle(fontSize: 11, color: secondary),
    );

    final leading = Container(
      width: 32,
      height: 32,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(Icons.account_tree_outlined, size: 16, color: color),
    );

    final padding = EdgeInsets.only(left: 8.0 * level);

    if (node.children.isEmpty) {
      return Padding(
        padding: padding,
        child: ListTile(
          dense: true,
          leading: leading,
          title: title,
          subtitle: subtitle,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        ),
      );
    }

    return Padding(
      padding: padding,
      child: ExpansionTile(
        shape: const Border(),
        collapsedShape: const Border(),
        backgroundColor: Colors.transparent,
        collapsedBackgroundColor: Colors.transparent,
        tilePadding: const EdgeInsets.symmetric(horizontal: 16),
        childrenPadding: const EdgeInsets.only(left: 8),
        leading: leading,
        title: title,
        subtitle: subtitle,
        children: [
          for (final child in node.children)
            DepartmentTreeNode(
              node: child,
              onCreateChild: onCreateChild,
              onOpen: onOpen,
              level: level + 1,
            ),
        ],
      ),
    );
  }
}
