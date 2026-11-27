// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'department_detail_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Detalle del departamento y sus grupos corporativos reales.
///
/// Ambos endpoints se lanzan en paralelo.

@ProviderFor(DepartmentDetailNotifier)
final departmentDetailProvider = DepartmentDetailNotifierFamily._();

/// Detalle del departamento y sus grupos corporativos reales.
///
/// Ambos endpoints se lanzan en paralelo.
final class DepartmentDetailNotifierProvider
    extends $AsyncNotifierProvider<DepartmentDetailNotifier, DepartmentDetail> {
  /// Detalle del departamento y sus grupos corporativos reales.
  ///
  /// Ambos endpoints se lanzan en paralelo.
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
    r'8afcd6ada59f64a5ff0c39a65246bd2d4446c94a';

/// Detalle del departamento y sus grupos corporativos reales.
///
/// Ambos endpoints se lanzan en paralelo.

final class DepartmentDetailNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          DepartmentDetailNotifier,
          AsyncValue<DepartmentDetail>,
          DepartmentDetail,
          FutureOr<DepartmentDetail>,
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

  /// Detalle del departamento y sus grupos corporativos reales.
  ///
  /// Ambos endpoints se lanzan en paralelo.

  DepartmentDetailNotifierProvider call(String departmentId) =>
      DepartmentDetailNotifierProvider._(argument: departmentId, from: this);

  @override
  String toString() => r'departmentDetailProvider';
}

/// Detalle del departamento y sus grupos corporativos reales.
///
/// Ambos endpoints se lanzan en paralelo.

abstract class _$DepartmentDetailNotifier
    extends $AsyncNotifier<DepartmentDetail> {
  late final _$args = ref.$arg as String;
  String get departmentId => _$args;

  FutureOr<DepartmentDetail> build(String departmentId);
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<DepartmentDetail>, DepartmentDetail>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<DepartmentDetail>, DepartmentDetail>,
              AsyncValue<DepartmentDetail>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, () => build(_$args));
  }
}
