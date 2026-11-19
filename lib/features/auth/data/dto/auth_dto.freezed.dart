// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AuthDto {

@JsonKey(name: 'access_token') String? get accessToken;@JsonKey(name: 'expires_in') int? get expiresIn;@JsonKey(name: 'requires_2fa') bool get requires2Fa;@JsonKey(name: 'temp_token') String? get tempToken;@JsonKey(name: 'token_type') String? get tokenType;
/// Create a copy of AuthDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthDtoCopyWith<AuthDto> get copyWith => _$AuthDtoCopyWithImpl<AuthDto>(this as AuthDto, _$identity);

  /// Serializes this AuthDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as AuthDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthDto&&(identical(other.accessToken, _this.accessToken) || other.accessToken == _this.accessToken)&&(identical(other.expiresIn, _this.expiresIn) || other.expiresIn == _this.expiresIn)&&(identical(other.requires2Fa, _this.requires2Fa) || other.requires2Fa == _this.requires2Fa)&&(identical(other.tempToken, _this.tempToken) || other.tempToken == _this.tempToken)&&(identical(other.tokenType, _this.tokenType) || other.tokenType == _this.tokenType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as AuthDto;
  return Object.hash(runtimeType,_this.accessToken,_this.expiresIn,_this.requires2Fa,_this.tempToken,_this.tokenType);
}

@override
String toString() {
  final _this = this as AuthDto;
  return 'AuthDto(accessToken: ${_this.accessToken}, expiresIn: ${_this.expiresIn}, requires2Fa: ${_this.requires2Fa}, tempToken: ${_this.tempToken}, tokenType: ${_this.tokenType})';
}


}

/// @nodoc
abstract mixin class $AuthDtoCopyWith<$Res>  {
  factory $AuthDtoCopyWith(AuthDto value, $Res Function(AuthDto) _then) = _$AuthDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'access_token') String? accessToken,@JsonKey(name: 'expires_in') int? expiresIn,@JsonKey(name: 'requires_2fa') bool requires2Fa,@JsonKey(name: 'temp_token') String? tempToken,@JsonKey(name: 'token_type') String? tokenType
});




}
/// @nodoc
class _$AuthDtoCopyWithImpl<$Res>
    implements $AuthDtoCopyWith<$Res> {
  _$AuthDtoCopyWithImpl(this._self, this._then);

  final AuthDto _self;
  final $Res Function(AuthDto) _then;

/// Create a copy of AuthDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? accessToken = freezed,Object? expiresIn = freezed,Object? requires2Fa = null,Object? tempToken = freezed,Object? tokenType = freezed,}) {
  return _then(AuthDto(
accessToken: freezed == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String?,expiresIn: freezed == expiresIn ? _self.expiresIn : expiresIn // ignore: cast_nullable_to_non_nullable
as int?,requires2Fa: null == requires2Fa ? _self.requires2Fa : requires2Fa // ignore: cast_nullable_to_non_nullable
as bool,tempToken: freezed == tempToken ? _self.tempToken : tempToken // ignore: cast_nullable_to_non_nullable
as String?,tokenType: freezed == tokenType ? _self.tokenType : tokenType // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AuthDto].
extension AuthDtoPatterns on AuthDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthDto value)  $default,){
final _that = this;
switch (_that) {
case _AuthDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthDto value)?  $default,){
final _that = this;
switch (_that) {
case _AuthDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'access_token')  String? accessToken, @JsonKey(name: 'expires_in')  int? expiresIn, @JsonKey(name: 'requires_2fa')  bool requires2Fa, @JsonKey(name: 'temp_token')  String? tempToken, @JsonKey(name: 'token_type')  String? tokenType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthDto() when $default != null:
return $default(_that.accessToken,_that.expiresIn,_that.requires2Fa,_that.tempToken,_that.tokenType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'access_token')  String? accessToken, @JsonKey(name: 'expires_in')  int? expiresIn, @JsonKey(name: 'requires_2fa')  bool requires2Fa, @JsonKey(name: 'temp_token')  String? tempToken, @JsonKey(name: 'token_type')  String? tokenType)  $default,) {final _that = this;
switch (_that) {
case _AuthDto():
return $default(_that.accessToken,_that.expiresIn,_that.requires2Fa,_that.tempToken,_that.tokenType);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'access_token')  String? accessToken, @JsonKey(name: 'expires_in')  int? expiresIn, @JsonKey(name: 'requires_2fa')  bool requires2Fa, @JsonKey(name: 'temp_token')  String? tempToken, @JsonKey(name: 'token_type')  String? tokenType)?  $default,) {final _that = this;
switch (_that) {
case _AuthDto() when $default != null:
return $default(_that.accessToken,_that.expiresIn,_that.requires2Fa,_that.tempToken,_that.tokenType);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AuthDto implements AuthDto {
  const _AuthDto({@JsonKey(name: 'access_token') this.accessToken, @JsonKey(name: 'expires_in') this.expiresIn, @JsonKey(name: 'requires_2fa') this.requires2Fa = false, @JsonKey(name: 'temp_token') this.tempToken, @JsonKey(name: 'token_type') this.tokenType});
  factory _AuthDto.fromJson(Map<String, dynamic> json) => _$AuthDtoFromJson(json);

@override@JsonKey(name: 'access_token') final  String? accessToken;
@override@JsonKey(name: 'expires_in') final  int? expiresIn;
@override@JsonKey(name: 'requires_2fa') final  bool requires2Fa;
@override@JsonKey(name: 'temp_token') final  String? tempToken;
@override@JsonKey(name: 'token_type') final  String? tokenType;

/// Create a copy of AuthDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthDtoCopyWith<_AuthDto> get copyWith => __$AuthDtoCopyWithImpl<_AuthDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AuthDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthDto&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.expiresIn, expiresIn) || other.expiresIn == expiresIn)&&(identical(other.requires2Fa, requires2Fa) || other.requires2Fa == requires2Fa)&&(identical(other.tempToken, tempToken) || other.tempToken == tempToken)&&(identical(other.tokenType, tokenType) || other.tokenType == tokenType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,accessToken,expiresIn,requires2Fa,tempToken,tokenType);
}

@override
String toString() {
    return 'AuthDto(accessToken: $accessToken, expiresIn: $expiresIn, requires2Fa: $requires2Fa, tempToken: $tempToken, tokenType: $tokenType)';
}


}

/// @nodoc
abstract mixin class _$AuthDtoCopyWith<$Res> implements $AuthDtoCopyWith<$Res> {
  factory _$AuthDtoCopyWith(_AuthDto value, $Res Function(_AuthDto) _then) = __$AuthDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'access_token') String? accessToken,@JsonKey(name: 'expires_in') int? expiresIn,@JsonKey(name: 'requires_2fa') bool requires2Fa,@JsonKey(name: 'temp_token') String? tempToken,@JsonKey(name: 'token_type') String? tokenType
});




}
/// @nodoc
class __$AuthDtoCopyWithImpl<$Res>
    implements _$AuthDtoCopyWith<$Res> {
  __$AuthDtoCopyWithImpl(this._self, this._then);

  final _AuthDto _self;
  final $Res Function(_AuthDto) _then;

/// Create a copy of AuthDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? accessToken = freezed,Object? expiresIn = freezed,Object? requires2Fa = null,Object? tempToken = freezed,Object? tokenType = freezed,}) {
  return _then(_AuthDto(
accessToken: freezed == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String?,expiresIn: freezed == expiresIn ? _self.expiresIn : expiresIn // ignore: cast_nullable_to_non_nullable
as int?,requires2Fa: null == requires2Fa ? _self.requires2Fa : requires2Fa // ignore: cast_nullable_to_non_nullable
as bool,tempToken: freezed == tempToken ? _self.tempToken : tempToken // ignore: cast_nullable_to_non_nullable
as String?,tokenType: freezed == tokenType ? _self.tokenType : tokenType // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
