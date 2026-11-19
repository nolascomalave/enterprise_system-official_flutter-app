// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UpdateMfaPreferencesRequestDto _$UpdateMfaPreferencesRequestDtoFromJson(
  Map<String, dynamic> json,
) => _UpdateMfaPreferencesRequestDto(
  enabled: json['enabled'] as bool,
  method: json['method'] as String?,
  otpCode: json['otp_code'] as String?,
);

Map<String, dynamic> _$UpdateMfaPreferencesRequestDtoToJson(
  _UpdateMfaPreferencesRequestDto instance,
) => <String, dynamic>{
  'enabled': instance.enabled,
  'method': ?instance.method,
  'otp_code': ?instance.otpCode,
};

_TotpSetupResponseDto _$TotpSetupResponseDtoFromJson(
  Map<String, dynamic> json,
) => _TotpSetupResponseDto(
  otpauthUrl: json['otpauth_url'] as String?,
  secret: json['secret'] as String?,
);

Map<String, dynamic> _$TotpSetupResponseDtoToJson(
  _TotpSetupResponseDto instance,
) => <String, dynamic>{
  'otpauth_url': instance.otpauthUrl,
  'secret': instance.secret,
};

_VerifyTotpRequestDto _$VerifyTotpRequestDtoFromJson(
  Map<String, dynamic> json,
) => _VerifyTotpRequestDto(code: json['code'] as String);

Map<String, dynamic> _$VerifyTotpRequestDtoToJson(
  _VerifyTotpRequestDto instance,
) => <String, dynamic>{'code': instance.code};

_TotpVerifyResponseDto _$TotpVerifyResponseDtoFromJson(
  Map<String, dynamic> json,
) => _TotpVerifyResponseDto(
  backupCodes:
      (json['backup_codes'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const <String>[],
);

Map<String, dynamic> _$TotpVerifyResponseDtoToJson(
  _TotpVerifyResponseDto instance,
) => <String, dynamic>{'backup_codes': instance.backupCodes};

_RequestSecurityCodeRequestDto _$RequestSecurityCodeRequestDtoFromJson(
  Map<String, dynamic> json,
) => _RequestSecurityCodeRequestDto(action: json['action'] as String);

Map<String, dynamic> _$RequestSecurityCodeRequestDtoToJson(
  _RequestSecurityCodeRequestDto instance,
) => <String, dynamic>{'action': instance.action};
