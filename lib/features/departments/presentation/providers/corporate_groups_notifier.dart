import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/network/api_exception.dart';
import '../../domain/entities/corporate_group.dart';
import 'department_providers.dart';

part 'corporate_groups_notifier.g.dart';

/// Grupos creados en esta sesión (fallback si `GET /corporate-groups`
/// no está disponible en el backend).
final localCorporateGroupsProvider =
    NotifierProvider<LocalCorporateGroups, List<CorporateGroup>>(
  LocalCorporateGroups.new,
);

class LocalCorporateGroups extends Notifier<List<CorporateGroup>> {
  @override
  List<CorporateGroup> build() => const [];

  void add(CorporateGroup group) => state = [...state, group];
}

/// Asignaciones departamento → grupo realizadas en esta sesión.
final groupAssignmentsProvider =
    NotifierProvider<GroupAssignments, Map<String, Set<String>>>(
  GroupAssignments.new,
);

class GroupAssignments extends Notifier<Map<String, Set<String>>> {
  @override
  Map<String, Set<String>> build() => const {};

  void add(String groupId, String departmentId) {
    final next = {
      for (final entry in state.entries) entry.key: {...entry.value},
    };
    next[groupId] = {...?next[groupId], departmentId};
    state = next;
  }
}

@riverpod
class CorporateGroupsNotifier extends _$CorporateGroupsNotifier {
  @override
  Future<List<CorporateGroup>> build() async {
    final useCase = await ref.watch(getCorporateGroupsUseCaseProvider.future);
    final local = ref.watch(localCorporateGroupsProvider);

    try {
      final remote = await useCase();
      final merged = [...remote];
      for (final group in local) {
        if (!merged.any((existing) => existing.id == group.id)) {
          merged.add(group);
        }
      }
      return merged;
    } on ApiException {
      // Backend sin GET /corporate-groups: mostramos los grupos locales.
      return List.of(local);
    }
  }

  Future<CorporateGroup> createGroup({
    required String name,
    String? description,
  }) async {
    final useCase = await ref.read(createCorporateGroupUseCaseProvider.future);
    final group = await useCase(name: name, description: description);
    ref.read(localCorporateGroupsProvider.notifier).add(group);
    ref.invalidateSelf();
    await future;
    return group;
  }

  Future<void> assignDepartment({
    required String groupId,
    required String departmentId,
  }) async {
    final useCase = await ref.read(assignDepartmentToGroupUseCaseProvider.future);
    await useCase(departmentId: departmentId, corporateGroupId: groupId);
    ref.read(groupAssignmentsProvider.notifier).add(groupId, departmentId);
  }

  Future<void> refresh() async {
    ref.invalidateSelf();
    await future;
  }
}
