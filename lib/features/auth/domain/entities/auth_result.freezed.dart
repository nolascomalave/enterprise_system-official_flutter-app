// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthResult {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthResult);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'AuthResult()';
}


}

/// @nodoc
class $AuthResultCopyWith<$Res>  {
$AuthResultCopyWith(AuthResult _, $Res Function(AuthResult) __);
}


/// Adds pattern-matching-related methods to [AuthResult].
extension AuthResultPatterns on AuthResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AuthSuccess value)?  success,TResult Function( AuthRequiresTwoFactor value)?  requiresTwoFactor,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AuthSuccess() when success != null:
return success(_that);case AuthRequiresTwoFactor() when requiresTwoFactor != null:
return requiresTwoFactor(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AuthSuccess value)  success,required TResult Function( AuthRequiresTwoFactor value)  requiresTwoFactor,}){
final _that = this;
switch (_that) {
case AuthSuccess():
return success(_that);case AuthRequiresTwoFactor():
return requiresTwoFactor(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AuthSuccess value)?  success,TResult? Function( AuthRequiresTwoFactor value)?  requiresTwoFactor,}){
final _that = this;
switch (_that) {
case AuthSuccess() when success != null:
return success(_that);case AuthRequiresTwoFactor() when requiresTwoFactor != null:
return requiresTwoFactor(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( AuthSession session)?  success,TResult Function( String tempToken)?  requiresTwoFactor,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AuthSuccess() when success != null:
return success(_that.session);case AuthRequiresTwoFactor() when requiresTwoFactor != null:
return requiresTwoFactor(_that.tempToken);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( AuthSession session)  success,required TResult Function( String tempToken)  requiresTwoFactor,}) {final _that = this;
switch (_that) {
case AuthSuccess():
return success(_that.session);case AuthRequiresTwoFactor():
return requiresTwoFactor(_that.tempToken);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( AuthSession session)?  success,TResult? Function( String tempToken)?  requiresTwoFactor,}) {final _that = this;
switch (_that) {
case AuthSuccess() when success != null:
return success(_that.session);case AuthRequiresTwoFactor() when requiresTwoFactor != null:
return requiresTwoFactor(_that.tempToken);case _:
  return null;

}
}

}

/// @nodoc


class AuthSuccess implements AuthResult {
  const AuthSuccess(this.session);
  

 final  AuthSession session;

/// Create a copy of AuthResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthSuccessCopyWith<AuthSuccess> get copyWith => _$AuthSuccessCopyWithImpl<AuthSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthSuccess&&(identical(other.session, session) || other.session == session));
}


@override
int get hashCode {
    return Object.hash(runtimeType,session);
}

@override
String toString() {
    return 'AuthResult.success(session: $session)';
}


}

/// @nodoc
abstract mixin class $AuthSuccessCopyWith<$Res> implements $AuthResultCopyWith<$Res> {
  factory $AuthSuccessCopyWith(AuthSuccess value, $Res Function(AuthSuccess) _then) = _$AuthSuccessCopyWithImpl;
@useResult
$Res call({
 AuthSession session
});




}
/// @nodoc
class _$AuthSuccessCopyWithImpl<$Res>
    implements $AuthSuccessCopyWith<$Res> {
  _$AuthSuccessCopyWithImpl(this._self, this._then);

  final AuthSuccess _self;
  final $Res Function(AuthSuccess) _then;

/// Create a copy of AuthResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? session = null,}) {
  return _then(AuthSuccess(
null == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as AuthSession,
  ));
}


}

/// @nodoc


class AuthRequiresTwoFactor implements AuthResult {
  const AuthRequiresTwoFactor(this.tempToken);
  

 final  String tempToken;

/// Create a copy of AuthResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthRequiresTwoFactorCopyWith<AuthRequiresTwoFactor> get copyWith => _$AuthRequiresTwoFactorCopyWithImpl<AuthRequiresTwoFactor>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthRequiresTwoFactor&&(identical(other.tempToken, tempToken) || other.tempToken == tempToken));
}


@override
int get hashCode {
    return Object.hash(runtimeType,tempToken);
}

@override
String toString() {
    return 'AuthResult.requiresTwoFactor(tempToken: $tempToken)';
}


}

/// @nodoc
abstract mixin class $AuthRequiresTwoFactorCopyWith<$Res> implements $AuthResultCopyWith<$Res> {
  factory $AuthRequiresTwoFactorCopyWith(AuthRequiresTwoFactor value, $Res Function(AuthRequiresTwoFactor) _then) = _$AuthRequiresTwoFactorCopyWithImpl;
@useResult
$Res call({
 String tempToken
});




}
/// @nodoc
class _$AuthRequiresTwoFactorCopyWithImpl<$Res>
    implements $AuthRequiresTwoFactorCopyWith<$Res> {
  _$AuthRequiresTwoFactorCopyWithImpl(this._self, this._then);

  final AuthRequiresTwoFactor _self;
  final $Res Function(AuthRequiresTwoFactor) _then;

/// Create a copy of AuthResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? tempToken = null,}) {
  return _then(AuthRequiresTwoFactor(
null == tempToken ? _self.tempToken : tempToken // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
