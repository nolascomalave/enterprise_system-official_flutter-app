// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'departments_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Lista plana de departamentos (el árbol se deriva con buildDepartmentTree).

@ProviderFor(DepartmentsNotifier)
final departmentsProvider = DepartmentsNotifierProvider._();

/// Lista plana de departamentos (el árbol se deriva con buildDepartmentTree).
final class DepartmentsNotifierProvider
    extends $AsyncNotifierProvider<DepartmentsNotifier, List<Department>> {
  /// Lista plana de departamentos (el árbol se deriva con buildDepartmentTree).
  DepartmentsNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'departmentsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$departmentsNotifierHash();

  @$internal
  @override
  DepartmentsNotifier create() => DepartmentsNotifier();
}

String _$departmentsNotifierHash() =>
    r'bf532638c19da8a23728a43b44fe3f883f9da8b6';

/// Lista plana de departamentos (el árbol se deriva con buildDepartmentTree).

abstract class _$DepartmentsNotifier extends $AsyncNotifier<List<Department>> {
  FutureOr<List<Department>> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<List<Department>>, List<Department>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Department>>, List<Department>>,
              AsyncValue<List<Department>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
