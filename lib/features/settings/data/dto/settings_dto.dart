import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings_dto.freezed.dart';
part 'settings_dto.g.dart';

/// Body de `PUT /auth/mfa-preferences`.
@freezed
abstract class UpdateMfaPreferencesRequestDto
    with _$UpdateMfaPreferencesRequestDto {
  const factory UpdateMfaPreferencesRequestDto({
    required bool enabled,
    @JsonKey(includeIfNull: false) String? method,
    @JsonKey(name: 'otp_code', includeIfNull: false) String? otpCode,
  }) = _UpdateMfaPreferencesRequestDto;

  factory UpdateMfaPreferencesRequestDto.fromJson(Map<String, dynamic> json) =>
      _$UpdateMfaPreferencesRequestDtoFromJson(json);
}

/// Respuesta de `POST /auth/totp/setup`.
@freezed
abstract class TotpSetupResponseDto with _$TotpSetupResponseDto {
  const factory TotpSetupResponseDto({
    @JsonKey(name: 'otpauth_url') String? otpauthUrl,
    String? secret,
  }) = _TotpSetupResponseDto;

  factory TotpSetupResponseDto.fromJson(Map<String, dynamic> json) =>
      _$TotpSetupResponseDtoFromJson(json);
}

/// Body de `POST /auth/totp/verify`.
@freezed
abstract class VerifyTotpRequestDto with _$VerifyTotpRequestDto {
  const factory VerifyTotpRequestDto({required String code}) =
      _VerifyTotpRequestDto;

  factory VerifyTotpRequestDto.fromJson(Map<String, dynamic> json) =>
      _$VerifyTotpRequestDtoFromJson(json);
}

/// Respuesta de `POST /auth/totp/verify`.
@freezed
abstract class TotpVerifyResponseDto with _$TotpVerifyResponseDto {
  const factory TotpVerifyResponseDto({
    @JsonKey(name: 'backup_codes') @Default(<String>[]) List<String> backupCodes,
  }) = _TotpVerifyResponseDto;

  factory TotpVerifyResponseDto.fromJson(Map<String, dynamic> json) =>
      _$TotpVerifyResponseDtoFromJson(json);
}

/// Body de `POST /auth/request-otp`.
@freezed
abstract class RequestSecurityCodeRequestDto
    with _$RequestSecurityCodeRequestDto {
  const factory RequestSecurityCodeRequestDto({required String action}) =
      _RequestSecurityCodeRequestDto;

  factory RequestSecurityCodeRequestDto.fromJson(Map<String, dynamic> json) =>
      _$RequestSecurityCodeRequestDtoFromJson(json);
}
