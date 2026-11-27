// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_detail_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Detalle de un empleado por su party ID.

@ProviderFor(EmployeeDetailNotifier)
final employeeDetailProvider = EmployeeDetailNotifierFamily._();

/// Detalle de un empleado por su party ID.
final class EmployeeDetailNotifierProvider
    extends $AsyncNotifierProvider<EmployeeDetailNotifier, Employee> {
  /// Detalle de un empleado por su party ID.
  EmployeeDetailNotifierProvider._({
    required EmployeeDetailNotifierFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'employeeDetailProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$employeeDetailNotifierHash();

  @override
  String toString() {
    return r'employeeDetailProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  EmployeeDetailNotifier create() => EmployeeDetailNotifier();

  @override
  bool operator ==(Object other) {
    return other is EmployeeDetailNotifierProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$employeeDetailNotifierHash() =>
    r'a25d3229a61a1a3d30b6003f999b6c0deb788725';

/// Detalle de un empleado por su party ID.

final class EmployeeDetailNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          EmployeeDetailNotifier,
          AsyncValue<Employee>,
          Employee,
          FutureOr<Employee>,
          String
        > {
  EmployeeDetailNotifierFamily._()
    : super(
        retry: null,
        name: r'employeeDetailProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Detalle de un empleado por su party ID.

  EmployeeDetailNotifierProvider call(String employeeId) =>
      EmployeeDetailNotifierProvider._(argument: employeeId, from: this);

  @override
  String toString() => r'employeeDetailProvider';
}

/// Detalle de un empleado por su party ID.

abstract class _$EmployeeDetailNotifier extends $AsyncNotifier<Employee> {
  late final _$args = ref.$arg as String;
  String get employeeId => _$args;

  FutureOr<Employee> build(String employeeId);
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<Employee>, Employee>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<Employee>, Employee>,
              AsyncValue<Employee>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, () => build(_$args));
  }
}
