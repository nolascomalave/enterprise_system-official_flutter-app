// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verify_two_factor_request_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VerifyTwoFactorRequestDto {

@JsonKey(name: 'temp_token') String get tempToken; String get code;
/// Create a copy of VerifyTwoFactorRequestDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VerifyTwoFactorRequestDtoCopyWith<VerifyTwoFactorRequestDto> get copyWith => _$VerifyTwoFactorRequestDtoCopyWithImpl<VerifyTwoFactorRequestDto>(this as VerifyTwoFactorRequestDto, _$identity);

  /// Serializes this VerifyTwoFactorRequestDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as VerifyTwoFactorRequestDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VerifyTwoFactorRequestDto&&(identical(other.tempToken, _this.tempToken) || other.tempToken == _this.tempToken)&&(identical(other.code, _this.code) || other.code == _this.code));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as VerifyTwoFactorRequestDto;
  return Object.hash(runtimeType,_this.tempToken,_this.code);
}

@override
String toString() {
  final _this = this as VerifyTwoFactorRequestDto;
  return 'VerifyTwoFactorRequestDto(tempToken: ${_this.tempToken}, code: ${_this.code})';
}


}

/// @nodoc
abstract mixin class $VerifyTwoFactorRequestDtoCopyWith<$Res>  {
  factory $VerifyTwoFactorRequestDtoCopyWith(VerifyTwoFactorRequestDto value, $Res Function(VerifyTwoFactorRequestDto) _then) = _$VerifyTwoFactorRequestDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'temp_token') String tempToken, String code
});




}
/// @nodoc
class _$VerifyTwoFactorRequestDtoCopyWithImpl<$Res>
    implements $VerifyTwoFactorRequestDtoCopyWith<$Res> {
  _$VerifyTwoFactorRequestDtoCopyWithImpl(this._self, this._then);

  final VerifyTwoFactorRequestDto _self;
  final $Res Function(VerifyTwoFactorRequestDto) _then;

/// Create a copy of VerifyTwoFactorRequestDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tempToken = null,Object? code = null,}) {
  return _then(VerifyTwoFactorRequestDto(
tempToken: null == tempToken ? _self.tempToken : tempToken // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [VerifyTwoFactorRequestDto].
extension VerifyTwoFactorRequestDtoPatterns on VerifyTwoFactorRequestDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VerifyTwoFactorRequestDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VerifyTwoFactorRequestDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VerifyTwoFactorRequestDto value)  $default,){
final _that = this;
switch (_that) {
case _VerifyTwoFactorRequestDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VerifyTwoFactorRequestDto value)?  $default,){
final _that = this;
switch (_that) {
case _VerifyTwoFactorRequestDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'temp_token')  String tempToken,  String code)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VerifyTwoFactorRequestDto() when $default != null:
return $default(_that.tempToken,_that.code);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'temp_token')  String tempToken,  String code)  $default,) {final _that = this;
switch (_that) {
case _VerifyTwoFactorRequestDto():
return $default(_that.tempToken,_that.code);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'temp_token')  String tempToken,  String code)?  $default,) {final _that = this;
switch (_that) {
case _VerifyTwoFactorRequestDto() when $default != null:
return $default(_that.tempToken,_that.code);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VerifyTwoFactorRequestDto implements VerifyTwoFactorRequestDto {
  const _VerifyTwoFactorRequestDto({@JsonKey(name: 'temp_token') required this.tempToken, required this.code});
  factory _VerifyTwoFactorRequestDto.fromJson(Map<String, dynamic> json) => _$VerifyTwoFactorRequestDtoFromJson(json);

@override@JsonKey(name: 'temp_token') final  String tempToken;
@override final  String code;

/// Create a copy of VerifyTwoFactorRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VerifyTwoFactorRequestDtoCopyWith<_VerifyTwoFactorRequestDto> get copyWith => __$VerifyTwoFactorRequestDtoCopyWithImpl<_VerifyTwoFactorRequestDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VerifyTwoFactorRequestDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _VerifyTwoFactorRequestDto&&(identical(other.tempToken, tempToken) || other.tempToken == tempToken)&&(identical(other.code, code) || other.code == code));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,tempToken,code);
}

@override
String toString() {
    return 'VerifyTwoFactorRequestDto(tempToken: $tempToken, code: $code)';
}


}

/// @nodoc
abstract mixin class _$VerifyTwoFactorRequestDtoCopyWith<$Res> implements $VerifyTwoFactorRequestDtoCopyWith<$Res> {
  factory _$VerifyTwoFactorRequestDtoCopyWith(_VerifyTwoFactorRequestDto value, $Res Function(_VerifyTwoFactorRequestDto) _then) = __$VerifyTwoFactorRequestDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'temp_token') String tempToken, String code
});




}
/// @nodoc
class __$VerifyTwoFactorRequestDtoCopyWithImpl<$Res>
    implements _$VerifyTwoFactorRequestDtoCopyWith<$Res> {
  __$VerifyTwoFactorRequestDtoCopyWithImpl(this._self, this._then);

  final _VerifyTwoFactorRequestDto _self;
  final $Res Function(_VerifyTwoFactorRequestDto) _then;

/// Create a copy of VerifyTwoFactorRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tempToken = null,Object? code = null,}) {
  return _then(_VerifyTwoFactorRequestDto(
tempToken: null == tempToken ? _self.tempToken : tempToken // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
