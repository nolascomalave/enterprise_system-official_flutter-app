import 'package:freezed_annotation/freezed_annotation.dart';

part 'verify_two_factor_request_dto.freezed.dart';
part 'verify_two_factor_request_dto.g.dart';

/// Body de `POST /auth/2fa/verify`.
@freezed
abstract class VerifyTwoFactorRequestDto with _$VerifyTwoFactorRequestDto {
  const factory VerifyTwoFactorRequestDto({
    @JsonKey(name: 'temp_token') required String tempToken,
    required String code,
  }) = _VerifyTwoFactorRequestDto;

  factory VerifyTwoFactorRequestDto.fromJson(Map<String, dynamic> json) =>
      _$VerifyTwoFactorRequestDtoFromJson(json);
}
