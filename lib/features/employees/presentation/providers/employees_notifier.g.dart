// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employees_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Lista de empleados + creación (refresca al crear).

@ProviderFor(EmployeesNotifier)
final employeesProvider = EmployeesNotifierProvider._();

/// Lista de empleados + creación (refresca al crear).
final class EmployeesNotifierProvider
    extends $AsyncNotifierProvider<EmployeesNotifier, List<Employee>> {
  /// Lista de empleados + creación (refresca al crear).
  EmployeesNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'employeesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$employeesNotifierHash();

  @$internal
  @override
  EmployeesNotifier create() => EmployeesNotifier();
}

String _$employeesNotifierHash() => r'31a6f417bf932bb9a20587dca272c22b3c8088e6';

/// Lista de empleados + creación (refresca al crear).

abstract class _$EmployeesNotifier extends $AsyncNotifier<List<Employee>> {
  FutureOr<List<Employee>> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<Employee>>, List<Employee>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Employee>>, List<Employee>>,
              AsyncValue<List<Employee>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
