// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'department_detail_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Detalle de un departamento.
///
/// El backend aún no expone `GET /departments/{id}`: se filtra el listado
/// en memoria reutilizando la caché de [departmentsProvider].

@ProviderFor(DepartmentDetailNotifier)
final departmentDetailProvider = DepartmentDetailNotifierFamily._();

/// Detalle de un departamento.
///
/// El backend aún no expone `GET /departments/{id}`: se filtra el listado
/// en memoria reutilizando la caché de [departmentsProvider].
final class DepartmentDetailNotifierProvider
    extends $AsyncNotifierProvider<DepartmentDetailNotifier, Department> {
  /// Detalle de un departamento.
  ///
  /// El backend aún no expone `GET /departments/{id}`: se filtra el listado
  /// en memoria reutilizando la caché de [departmentsProvider].
  DepartmentDetailNotifierProvider._({
    required DepartmentDetailNotifierFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'departmentDetailProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$departmentDetailNotifierHash();

  @override
  String toString() {
    return r'departmentDetailProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  DepartmentDetailNotifier create() => DepartmentDetailNotifier();

  @override
  bool operator ==(Object other) {
    return other is DepartmentDetailNotifierProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$departmentDetailNotifierHash() =>
    r'57586f2861706cb6a7541b51a73629875ca5db16';

/// Detalle de un departamento.
///
/// El backend aún no expone `GET /departments/{id}`: se filtra el listado
/// en memoria reutilizando la caché de [departmentsProvider].

final class DepartmentDetailNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          DepartmentDetailNotifier,
          AsyncValue<Department>,
          Department,
          FutureOr<Department>,
          String
        > {
  DepartmentDetailNotifierFamily._()
    : super(
        retry: null,
        name: r'departmentDetailProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Detalle de un departamento.
  ///
  /// El backend aún no expone `GET /departments/{id}`: se filtra el listado
  /// en memoria reutilizando la caché de [departmentsProvider].

  DepartmentDetailNotifierProvider call(String departmentId) =>
      DepartmentDetailNotifierProvider._(argument: departmentId, from: this);

  @override
  String toString() => r'departmentDetailProvider';
}

/// Detalle de un departamento.
///
/// El backend aún no expone `GET /departments/{id}`: se filtra el listado
/// en memoria reutilizando la caché de [departmentsProvider].

abstract class _$DepartmentDetailNotifier extends $AsyncNotifier<Department> {
  late final _$args = ref.$arg as String;
  String get departmentId => _$args;

  FutureOr<Department> build(String departmentId);
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<Department>, Department>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<Department>, Department>,
              AsyncValue<Department>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, () => build(_$args));
  }
}
