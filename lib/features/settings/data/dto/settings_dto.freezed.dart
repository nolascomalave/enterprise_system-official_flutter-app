// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UpdateMfaPreferencesRequestDto {

 bool get enabled;@JsonKey(includeIfNull: false) String? get method;@JsonKey(name: 'otp_code', includeIfNull: false) String? get otpCode;
/// Create a copy of UpdateMfaPreferencesRequestDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateMfaPreferencesRequestDtoCopyWith<UpdateMfaPreferencesRequestDto> get copyWith => _$UpdateMfaPreferencesRequestDtoCopyWithImpl<UpdateMfaPreferencesRequestDto>(this as UpdateMfaPreferencesRequestDto, _$identity);

  /// Serializes this UpdateMfaPreferencesRequestDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as UpdateMfaPreferencesRequestDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateMfaPreferencesRequestDto&&(identical(other.enabled, _this.enabled) || other.enabled == _this.enabled)&&(identical(other.method, _this.method) || other.method == _this.method)&&(identical(other.otpCode, _this.otpCode) || other.otpCode == _this.otpCode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as UpdateMfaPreferencesRequestDto;
  return Object.hash(runtimeType,_this.enabled,_this.method,_this.otpCode);
}

@override
String toString() {
  final _this = this as UpdateMfaPreferencesRequestDto;
  return 'UpdateMfaPreferencesRequestDto(enabled: ${_this.enabled}, method: ${_this.method}, otpCode: ${_this.otpCode})';
}


}

/// @nodoc
abstract mixin class $UpdateMfaPreferencesRequestDtoCopyWith<$Res>  {
  factory $UpdateMfaPreferencesRequestDtoCopyWith(UpdateMfaPreferencesRequestDto value, $Res Function(UpdateMfaPreferencesRequestDto) _then) = _$UpdateMfaPreferencesRequestDtoCopyWithImpl;
@useResult
$Res call({
 bool enabled,@JsonKey(includeIfNull: false) String? method,@JsonKey(name: 'otp_code', includeIfNull: false) String? otpCode
});




}
/// @nodoc
class _$UpdateMfaPreferencesRequestDtoCopyWithImpl<$Res>
    implements $UpdateMfaPreferencesRequestDtoCopyWith<$Res> {
  _$UpdateMfaPreferencesRequestDtoCopyWithImpl(this._self, this._then);

  final UpdateMfaPreferencesRequestDto _self;
  final $Res Function(UpdateMfaPreferencesRequestDto) _then;

/// Create a copy of UpdateMfaPreferencesRequestDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? enabled = null,Object? method = freezed,Object? otpCode = freezed,}) {
  return _then(UpdateMfaPreferencesRequestDto(
enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,method: freezed == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String?,otpCode: freezed == otpCode ? _self.otpCode : otpCode // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [UpdateMfaPreferencesRequestDto].
extension UpdateMfaPreferencesRequestDtoPatterns on UpdateMfaPreferencesRequestDto {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdateMfaPreferencesRequestDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdateMfaPreferencesRequestDto() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdateMfaPreferencesRequestDto value)  $default,){
final _that = this;
switch (_that) {
case _UpdateMfaPreferencesRequestDto():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdateMfaPreferencesRequestDto value)?  $default,){
final _that = this;
switch (_that) {
case _UpdateMfaPreferencesRequestDto() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool enabled, @JsonKey(includeIfNull: false)  String? method, @JsonKey(name: 'otp_code', includeIfNull: false)  String? otpCode)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateMfaPreferencesRequestDto() when $default != null:
return $default(_that.enabled,_that.method,_that.otpCode);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool enabled, @JsonKey(includeIfNull: false)  String? method, @JsonKey(name: 'otp_code', includeIfNull: false)  String? otpCode)  $default,) {final _that = this;
switch (_that) {
case _UpdateMfaPreferencesRequestDto():
return $default(_that.enabled,_that.method,_that.otpCode);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool enabled, @JsonKey(includeIfNull: false)  String? method, @JsonKey(name: 'otp_code', includeIfNull: false)  String? otpCode)?  $default,) {final _that = this;
switch (_that) {
case _UpdateMfaPreferencesRequestDto() when $default != null:
return $default(_that.enabled,_that.method,_that.otpCode);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UpdateMfaPreferencesRequestDto implements UpdateMfaPreferencesRequestDto {
  const _UpdateMfaPreferencesRequestDto({required this.enabled, @JsonKey(includeIfNull: false) this.method, @JsonKey(name: 'otp_code', includeIfNull: false) this.otpCode});
  factory _UpdateMfaPreferencesRequestDto.fromJson(Map<String, dynamic> json) => _$UpdateMfaPreferencesRequestDtoFromJson(json);

@override final  bool enabled;
@override@JsonKey(includeIfNull: false) final  String? method;
@override@JsonKey(name: 'otp_code', includeIfNull: false) final  String? otpCode;

/// Create a copy of UpdateMfaPreferencesRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateMfaPreferencesRequestDtoCopyWith<_UpdateMfaPreferencesRequestDto> get copyWith => __$UpdateMfaPreferencesRequestDtoCopyWithImpl<_UpdateMfaPreferencesRequestDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateMfaPreferencesRequestDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateMfaPreferencesRequestDto&&(identical(other.enabled, enabled) || other.enabled == enabled)&&(identical(other.method, method) || other.method == method)&&(identical(other.otpCode, otpCode) || other.otpCode == otpCode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,enabled,method,otpCode);
}

@override
String toString() {
    return 'UpdateMfaPreferencesRequestDto(enabled: $enabled, method: $method, otpCode: $otpCode)';
}


}

/// @nodoc
abstract mixin class _$UpdateMfaPreferencesRequestDtoCopyWith<$Res> implements $UpdateMfaPreferencesRequestDtoCopyWith<$Res> {
  factory _$UpdateMfaPreferencesRequestDtoCopyWith(_UpdateMfaPreferencesRequestDto value, $Res Function(_UpdateMfaPreferencesRequestDto) _then) = __$UpdateMfaPreferencesRequestDtoCopyWithImpl;
@override @useResult
$Res call({
 bool enabled,@JsonKey(includeIfNull: false) String? method,@JsonKey(name: 'otp_code', includeIfNull: false) String? otpCode
});




}
/// @nodoc
class __$UpdateMfaPreferencesRequestDtoCopyWithImpl<$Res>
    implements _$UpdateMfaPreferencesRequestDtoCopyWith<$Res> {
  __$UpdateMfaPreferencesRequestDtoCopyWithImpl(this._self, this._then);

  final _UpdateMfaPreferencesRequestDto _self;
  final $Res Function(_UpdateMfaPreferencesRequestDto) _then;

/// Create a copy of UpdateMfaPreferencesRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? enabled = null,Object? method = freezed,Object? otpCode = freezed,}) {
  return _then(_UpdateMfaPreferencesRequestDto(
enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,method: freezed == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String?,otpCode: freezed == otpCode ? _self.otpCode : otpCode // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$TotpSetupResponseDto {

@JsonKey(name: 'otpauth_url') String? get otpauthUrl; String? get secret;
/// Create a copy of TotpSetupResponseDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TotpSetupResponseDtoCopyWith<TotpSetupResponseDto> get copyWith => _$TotpSetupResponseDtoCopyWithImpl<TotpSetupResponseDto>(this as TotpSetupResponseDto, _$identity);

  /// Serializes this TotpSetupResponseDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as TotpSetupResponseDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TotpSetupResponseDto&&(identical(other.otpauthUrl, _this.otpauthUrl) || other.otpauthUrl == _this.otpauthUrl)&&(identical(other.secret, _this.secret) || other.secret == _this.secret));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as TotpSetupResponseDto;
  return Object.hash(runtimeType,_this.otpauthUrl,_this.secret);
}

@override
String toString() {
  final _this = this as TotpSetupResponseDto;
  return 'TotpSetupResponseDto(otpauthUrl: ${_this.otpauthUrl}, secret: ${_this.secret})';
}


}

/// @nodoc
abstract mixin class $TotpSetupResponseDtoCopyWith<$Res>  {
  factory $TotpSetupResponseDtoCopyWith(TotpSetupResponseDto value, $Res Function(TotpSetupResponseDto) _then) = _$TotpSetupResponseDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'otpauth_url') String? otpauthUrl, String? secret
});




}
/// @nodoc
class _$TotpSetupResponseDtoCopyWithImpl<$Res>
    implements $TotpSetupResponseDtoCopyWith<$Res> {
  _$TotpSetupResponseDtoCopyWithImpl(this._self, this._then);

  final TotpSetupResponseDto _self;
  final $Res Function(TotpSetupResponseDto) _then;

/// Create a copy of TotpSetupResponseDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? otpauthUrl = freezed,Object? secret = freezed,}) {
  return _then(TotpSetupResponseDto(
otpauthUrl: freezed == otpauthUrl ? _self.otpauthUrl : otpauthUrl // ignore: cast_nullable_to_non_nullable
as String?,secret: freezed == secret ? _self.secret : secret // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TotpSetupResponseDto].
extension TotpSetupResponseDtoPatterns on TotpSetupResponseDto {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TotpSetupResponseDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TotpSetupResponseDto() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TotpSetupResponseDto value)  $default,){
final _that = this;
switch (_that) {
case _TotpSetupResponseDto():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TotpSetupResponseDto value)?  $default,){
final _that = this;
switch (_that) {
case _TotpSetupResponseDto() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'otpauth_url')  String? otpauthUrl,  String? secret)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TotpSetupResponseDto() when $default != null:
return $default(_that.otpauthUrl,_that.secret);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'otpauth_url')  String? otpauthUrl,  String? secret)  $default,) {final _that = this;
switch (_that) {
case _TotpSetupResponseDto():
return $default(_that.otpauthUrl,_that.secret);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'otpauth_url')  String? otpauthUrl,  String? secret)?  $default,) {final _that = this;
switch (_that) {
case _TotpSetupResponseDto() when $default != null:
return $default(_that.otpauthUrl,_that.secret);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TotpSetupResponseDto implements TotpSetupResponseDto {
  const _TotpSetupResponseDto({@JsonKey(name: 'otpauth_url') this.otpauthUrl, this.secret});
  factory _TotpSetupResponseDto.fromJson(Map<String, dynamic> json) => _$TotpSetupResponseDtoFromJson(json);

@override@JsonKey(name: 'otpauth_url') final  String? otpauthUrl;
@override final  String? secret;

/// Create a copy of TotpSetupResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TotpSetupResponseDtoCopyWith<_TotpSetupResponseDto> get copyWith => __$TotpSetupResponseDtoCopyWithImpl<_TotpSetupResponseDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TotpSetupResponseDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TotpSetupResponseDto&&(identical(other.otpauthUrl, otpauthUrl) || other.otpauthUrl == otpauthUrl)&&(identical(other.secret, secret) || other.secret == secret));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,otpauthUrl,secret);
}

@override
String toString() {
    return 'TotpSetupResponseDto(otpauthUrl: $otpauthUrl, secret: $secret)';
}


}

/// @nodoc
abstract mixin class _$TotpSetupResponseDtoCopyWith<$Res> implements $TotpSetupResponseDtoCopyWith<$Res> {
  factory _$TotpSetupResponseDtoCopyWith(_TotpSetupResponseDto value, $Res Function(_TotpSetupResponseDto) _then) = __$TotpSetupResponseDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'otpauth_url') String? otpauthUrl, String? secret
});




}
/// @nodoc
class __$TotpSetupResponseDtoCopyWithImpl<$Res>
    implements _$TotpSetupResponseDtoCopyWith<$Res> {
  __$TotpSetupResponseDtoCopyWithImpl(this._self, this._then);

  final _TotpSetupResponseDto _self;
  final $Res Function(_TotpSetupResponseDto) _then;

/// Create a copy of TotpSetupResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? otpauthUrl = freezed,Object? secret = freezed,}) {
  return _then(_TotpSetupResponseDto(
otpauthUrl: freezed == otpauthUrl ? _self.otpauthUrl : otpauthUrl // ignore: cast_nullable_to_non_nullable
as String?,secret: freezed == secret ? _self.secret : secret // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$VerifyTotpRequestDto {

 String get code;
/// Create a copy of VerifyTotpRequestDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VerifyTotpRequestDtoCopyWith<VerifyTotpRequestDto> get copyWith => _$VerifyTotpRequestDtoCopyWithImpl<VerifyTotpRequestDto>(this as VerifyTotpRequestDto, _$identity);

  /// Serializes this VerifyTotpRequestDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as VerifyTotpRequestDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VerifyTotpRequestDto&&(identical(other.code, _this.code) || other.code == _this.code));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as VerifyTotpRequestDto;
  return Object.hash(runtimeType,_this.code);
}

@override
String toString() {
  final _this = this as VerifyTotpRequestDto;
  return 'VerifyTotpRequestDto(code: ${_this.code})';
}


}

/// @nodoc
abstract mixin class $VerifyTotpRequestDtoCopyWith<$Res>  {
  factory $VerifyTotpRequestDtoCopyWith(VerifyTotpRequestDto value, $Res Function(VerifyTotpRequestDto) _then) = _$VerifyTotpRequestDtoCopyWithImpl;
@useResult
$Res call({
 String code
});




}
/// @nodoc
class _$VerifyTotpRequestDtoCopyWithImpl<$Res>
    implements $VerifyTotpRequestDtoCopyWith<$Res> {
  _$VerifyTotpRequestDtoCopyWithImpl(this._self, this._then);

  final VerifyTotpRequestDto _self;
  final $Res Function(VerifyTotpRequestDto) _then;

/// Create a copy of VerifyTotpRequestDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? code = null,}) {
  return _then(VerifyTotpRequestDto(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [VerifyTotpRequestDto].
extension VerifyTotpRequestDtoPatterns on VerifyTotpRequestDto {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VerifyTotpRequestDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VerifyTotpRequestDto() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VerifyTotpRequestDto value)  $default,){
final _that = this;
switch (_that) {
case _VerifyTotpRequestDto():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VerifyTotpRequestDto value)?  $default,){
final _that = this;
switch (_that) {
case _VerifyTotpRequestDto() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String code)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VerifyTotpRequestDto() when $default != null:
return $default(_that.code);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String code)  $default,) {final _that = this;
switch (_that) {
case _VerifyTotpRequestDto():
return $default(_that.code);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String code)?  $default,) {final _that = this;
switch (_that) {
case _VerifyTotpRequestDto() when $default != null:
return $default(_that.code);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VerifyTotpRequestDto implements VerifyTotpRequestDto {
  const _VerifyTotpRequestDto({required this.code});
  factory _VerifyTotpRequestDto.fromJson(Map<String, dynamic> json) => _$VerifyTotpRequestDtoFromJson(json);

@override final  String code;

/// Create a copy of VerifyTotpRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VerifyTotpRequestDtoCopyWith<_VerifyTotpRequestDto> get copyWith => __$VerifyTotpRequestDtoCopyWithImpl<_VerifyTotpRequestDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VerifyTotpRequestDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _VerifyTotpRequestDto&&(identical(other.code, code) || other.code == code));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,code);
}

@override
String toString() {
    return 'VerifyTotpRequestDto(code: $code)';
}


}

/// @nodoc
abstract mixin class _$VerifyTotpRequestDtoCopyWith<$Res> implements $VerifyTotpRequestDtoCopyWith<$Res> {
  factory _$VerifyTotpRequestDtoCopyWith(_VerifyTotpRequestDto value, $Res Function(_VerifyTotpRequestDto) _then) = __$VerifyTotpRequestDtoCopyWithImpl;
@override @useResult
$Res call({
 String code
});




}
/// @nodoc
class __$VerifyTotpRequestDtoCopyWithImpl<$Res>
    implements _$VerifyTotpRequestDtoCopyWith<$Res> {
  __$VerifyTotpRequestDtoCopyWithImpl(this._self, this._then);

  final _VerifyTotpRequestDto _self;
  final $Res Function(_VerifyTotpRequestDto) _then;

/// Create a copy of VerifyTotpRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? code = null,}) {
  return _then(_VerifyTotpRequestDto(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$TotpVerifyResponseDto {

@JsonKey(name: 'backup_codes') List<String> get backupCodes;
/// Create a copy of TotpVerifyResponseDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TotpVerifyResponseDtoCopyWith<TotpVerifyResponseDto> get copyWith => _$TotpVerifyResponseDtoCopyWithImpl<TotpVerifyResponseDto>(this as TotpVerifyResponseDto, _$identity);

  /// Serializes this TotpVerifyResponseDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as TotpVerifyResponseDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TotpVerifyResponseDto&&const DeepCollectionEquality().equals(other.backupCodes, _this.backupCodes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as TotpVerifyResponseDto;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.backupCodes));
}

@override
String toString() {
  final _this = this as TotpVerifyResponseDto;
  return 'TotpVerifyResponseDto(backupCodes: ${_this.backupCodes})';
}


}

/// @nodoc
abstract mixin class $TotpVerifyResponseDtoCopyWith<$Res>  {
  factory $TotpVerifyResponseDtoCopyWith(TotpVerifyResponseDto value, $Res Function(TotpVerifyResponseDto) _then) = _$TotpVerifyResponseDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'backup_codes') List<String> backupCodes
});




}
/// @nodoc
class _$TotpVerifyResponseDtoCopyWithImpl<$Res>
    implements $TotpVerifyResponseDtoCopyWith<$Res> {
  _$TotpVerifyResponseDtoCopyWithImpl(this._self, this._then);

  final TotpVerifyResponseDto _self;
  final $Res Function(TotpVerifyResponseDto) _then;

/// Create a copy of TotpVerifyResponseDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? backupCodes = null,}) {
  return _then(TotpVerifyResponseDto(
backupCodes: null == backupCodes ? _self.backupCodes : backupCodes // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [TotpVerifyResponseDto].
extension TotpVerifyResponseDtoPatterns on TotpVerifyResponseDto {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TotpVerifyResponseDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TotpVerifyResponseDto() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TotpVerifyResponseDto value)  $default,){
final _that = this;
switch (_that) {
case _TotpVerifyResponseDto():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TotpVerifyResponseDto value)?  $default,){
final _that = this;
switch (_that) {
case _TotpVerifyResponseDto() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'backup_codes')  List<String> backupCodes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TotpVerifyResponseDto() when $default != null:
return $default(_that.backupCodes);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'backup_codes')  List<String> backupCodes)  $default,) {final _that = this;
switch (_that) {
case _TotpVerifyResponseDto():
return $default(_that.backupCodes);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'backup_codes')  List<String> backupCodes)?  $default,) {final _that = this;
switch (_that) {
case _TotpVerifyResponseDto() when $default != null:
return $default(_that.backupCodes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TotpVerifyResponseDto implements TotpVerifyResponseDto {
  const _TotpVerifyResponseDto({@JsonKey(name: 'backup_codes')  List<String> backupCodes = const <String>[]}): _backupCodes = backupCodes;
  factory _TotpVerifyResponseDto.fromJson(Map<String, dynamic> json) => _$TotpVerifyResponseDtoFromJson(json);

 final  List<String> _backupCodes;
@override@JsonKey(name: 'backup_codes') List<String> get backupCodes {
  if (_backupCodes is EqualUnmodifiableListView) return _backupCodes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_backupCodes);
}


/// Create a copy of TotpVerifyResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TotpVerifyResponseDtoCopyWith<_TotpVerifyResponseDto> get copyWith => __$TotpVerifyResponseDtoCopyWithImpl<_TotpVerifyResponseDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TotpVerifyResponseDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TotpVerifyResponseDto&&const DeepCollectionEquality().equals(other.backupCodes, _backupCodes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_backupCodes));
}

@override
String toString() {
    return 'TotpVerifyResponseDto(backupCodes: $backupCodes)';
}


}

/// @nodoc
abstract mixin class _$TotpVerifyResponseDtoCopyWith<$Res> implements $TotpVerifyResponseDtoCopyWith<$Res> {
  factory _$TotpVerifyResponseDtoCopyWith(_TotpVerifyResponseDto value, $Res Function(_TotpVerifyResponseDto) _then) = __$TotpVerifyResponseDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'backup_codes') List<String> backupCodes
});




}
/// @nodoc
class __$TotpVerifyResponseDtoCopyWithImpl<$Res>
    implements _$TotpVerifyResponseDtoCopyWith<$Res> {
  __$TotpVerifyResponseDtoCopyWithImpl(this._self, this._then);

  final _TotpVerifyResponseDto _self;
  final $Res Function(_TotpVerifyResponseDto) _then;

/// Create a copy of TotpVerifyResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? backupCodes = null,}) {
  return _then(_TotpVerifyResponseDto(
backupCodes: null == backupCodes ? _self._backupCodes : backupCodes // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}


/// @nodoc
mixin _$RequestSecurityCodeRequestDto {

 String get action;
/// Create a copy of RequestSecurityCodeRequestDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RequestSecurityCodeRequestDtoCopyWith<RequestSecurityCodeRequestDto> get copyWith => _$RequestSecurityCodeRequestDtoCopyWithImpl<RequestSecurityCodeRequestDto>(this as RequestSecurityCodeRequestDto, _$identity);

  /// Serializes this RequestSecurityCodeRequestDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as RequestSecurityCodeRequestDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RequestSecurityCodeRequestDto&&(identical(other.action, _this.action) || other.action == _this.action));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as RequestSecurityCodeRequestDto;
  return Object.hash(runtimeType,_this.action);
}

@override
String toString() {
  final _this = this as RequestSecurityCodeRequestDto;
  return 'RequestSecurityCodeRequestDto(action: ${_this.action})';
}


}

/// @nodoc
abstract mixin class $RequestSecurityCodeRequestDtoCopyWith<$Res>  {
  factory $RequestSecurityCodeRequestDtoCopyWith(RequestSecurityCodeRequestDto value, $Res Function(RequestSecurityCodeRequestDto) _then) = _$RequestSecurityCodeRequestDtoCopyWithImpl;
@useResult
$Res call({
 String action
});




}
/// @nodoc
class _$RequestSecurityCodeRequestDtoCopyWithImpl<$Res>
    implements $RequestSecurityCodeRequestDtoCopyWith<$Res> {
  _$RequestSecurityCodeRequestDtoCopyWithImpl(this._self, this._then);

  final RequestSecurityCodeRequestDto _self;
  final $Res Function(RequestSecurityCodeRequestDto) _then;

/// Create a copy of RequestSecurityCodeRequestDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? action = null,}) {
  return _then(RequestSecurityCodeRequestDto(
action: null == action ? _self.action : action // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [RequestSecurityCodeRequestDto].
extension RequestSecurityCodeRequestDtoPatterns on RequestSecurityCodeRequestDto {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RequestSecurityCodeRequestDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RequestSecurityCodeRequestDto() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RequestSecurityCodeRequestDto value)  $default,){
final _that = this;
switch (_that) {
case _RequestSecurityCodeRequestDto():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RequestSecurityCodeRequestDto value)?  $default,){
final _that = this;
switch (_that) {
case _RequestSecurityCodeRequestDto() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String action)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RequestSecurityCodeRequestDto() when $default != null:
return $default(_that.action);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String action)  $default,) {final _that = this;
switch (_that) {
case _RequestSecurityCodeRequestDto():
return $default(_that.action);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String action)?  $default,) {final _that = this;
switch (_that) {
case _RequestSecurityCodeRequestDto() when $default != null:
return $default(_that.action);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RequestSecurityCodeRequestDto implements RequestSecurityCodeRequestDto {
  const _RequestSecurityCodeRequestDto({required this.action});
  factory _RequestSecurityCodeRequestDto.fromJson(Map<String, dynamic> json) => _$RequestSecurityCodeRequestDtoFromJson(json);

@override final  String action;

/// Create a copy of RequestSecurityCodeRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RequestSecurityCodeRequestDtoCopyWith<_RequestSecurityCodeRequestDto> get copyWith => __$RequestSecurityCodeRequestDtoCopyWithImpl<_RequestSecurityCodeRequestDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RequestSecurityCodeRequestDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _RequestSecurityCodeRequestDto&&(identical(other.action, action) || other.action == action));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,action);
}

@override
String toString() {
    return 'RequestSecurityCodeRequestDto(action: $action)';
}


}

/// @nodoc
abstract mixin class _$RequestSecurityCodeRequestDtoCopyWith<$Res> implements $RequestSecurityCodeRequestDtoCopyWith<$Res> {
  factory _$RequestSecurityCodeRequestDtoCopyWith(_RequestSecurityCodeRequestDto value, $Res Function(_RequestSecurityCodeRequestDto) _then) = __$RequestSecurityCodeRequestDtoCopyWithImpl;
@override @useResult
$Res call({
 String action
});




}
/// @nodoc
class __$RequestSecurityCodeRequestDtoCopyWithImpl<$Res>
    implements _$RequestSecurityCodeRequestDtoCopyWith<$Res> {
  __$RequestSecurityCodeRequestDtoCopyWithImpl(this._self, this._then);

  final _RequestSecurityCodeRequestDto _self;
  final $Res Function(_RequestSecurityCodeRequestDto) _then;

/// Create a copy of RequestSecurityCodeRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? action = null,}) {
  return _then(_RequestSecurityCodeRequestDto(
action: null == action ? _self.action : action // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
