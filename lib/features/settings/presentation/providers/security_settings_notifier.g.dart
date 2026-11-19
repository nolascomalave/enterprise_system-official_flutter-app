// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'security_settings_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Estado y acciones de configuración de seguridad (MFA).

@ProviderFor(SecuritySettingsNotifier)
final securitySettingsProvider = SecuritySettingsNotifierProvider._();

/// Estado y acciones de configuración de seguridad (MFA).
final class SecuritySettingsNotifierProvider
    extends $NotifierProvider<SecuritySettingsNotifier, SecuritySettings> {
  /// Estado y acciones de configuración de seguridad (MFA).
  SecuritySettingsNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'securitySettingsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$securitySettingsNotifierHash();

  @$internal
  @override
  SecuritySettingsNotifier create() => SecuritySettingsNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SecuritySettings value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SecuritySettings>(value),
    );
  }
}

String _$securitySettingsNotifierHash() =>
    r'f3476b093f99682d4e1fcb0239f539b475642f82';

/// Estado y acciones de configuración de seguridad (MFA).

abstract class _$SecuritySettingsNotifier extends $Notifier<SecuritySettings> {
  SecuritySettings build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<SecuritySettings, SecuritySettings>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<SecuritySettings, SecuritySettings>,
              SecuritySettings,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
