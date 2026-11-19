// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuthDto _$AuthDtoFromJson(Map<String, dynamic> json) => _AuthDto(
  accessToken: json['access_token'] as String?,
  expiresIn: (json['expires_in'] as num?)?.toInt(),
  requires2Fa: json['requires_2fa'] as bool? ?? false,
  tempToken: json['temp_token'] as String?,
  tokenType: json['token_type'] as String?,
);

Map<String, dynamic> _$AuthDtoToJson(_AuthDto instance) => <String, dynamic>{
  'access_token': instance.accessToken,
  'expires_in': instance.expiresIn,
  'requires_2fa': instance.requires2Fa,
  'temp_token': instance.tempToken,
  'token_type': instance.tokenType,
};
