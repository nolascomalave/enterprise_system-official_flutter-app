import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_preferences_dto.freezed.dart';
part 'user_preferences_dto.g.dart';

/// Preferencias de la app cliente (`GET/PUT /users/me/preferences`).
@freezed
abstract class UserPreferencesDto with _$UserPreferencesDto {
  const factory UserPreferencesDto({
    @Default(<String, dynamic>{}) Map<String, dynamic> preferences,
  }) = _UserPreferencesDto;

  factory UserPreferencesDto.fromJson(Map<String, dynamic> json) =>
      _$UserPreferencesDtoFromJson(json);
}
