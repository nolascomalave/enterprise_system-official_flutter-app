// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_two_factor_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VerifyTwoFactorRequestDto _$VerifyTwoFactorRequestDtoFromJson(
  Map<String, dynamic> json,
) => _VerifyTwoFactorRequestDto(
  tempToken: json['temp_token'] as String,
  code: json['code'] as String,
);

Map<String, dynamic> _$VerifyTwoFactorRequestDtoToJson(
  _VerifyTwoFactorRequestDto instance,
) => <String, dynamic>{'temp_token': instance.tempToken, 'code': instance.code};
