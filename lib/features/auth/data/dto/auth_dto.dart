import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_dto.freezed.dart';
part 'auth_dto.g.dart';

/// Respuesta de `/auth/login` y `/auth/2fa/verify` (campo `data` del envelope).
@freezed
abstract class AuthDto with _$AuthDto {
  const factory AuthDto({
    @JsonKey(name: 'access_token') String? accessToken,
    @JsonKey(name: 'expires_in') int? expiresIn,
    @JsonKey(name: 'requires_2fa') @Default(false) bool requires2Fa,
    @JsonKey(name: 'temp_token') String? tempToken,
    @JsonKey(name: 'token_type') String? tokenType,
  }) = _AuthDto;

  factory AuthDto.fromJson(Map<String, dynamic> json) => _$AuthDtoFromJson(json);
}
