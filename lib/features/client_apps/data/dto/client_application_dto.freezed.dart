// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'client_application_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ClientApplicationDto {

 String? get id; String? get name;@JsonKey(name: 'client_id') String? get clientId;@JsonKey(name: 'client_secret') String? get clientSecret; List<String> get scopes;@JsonKey(name: 'is_active') bool get isActive;@JsonKey(name: 'client_type') String? get clientType;@JsonKey(name: 'application_scope') String? get applicationScope;@JsonKey(name: 'tenant_id') String? get tenantId;@JsonKey(name: 'created_at') String? get createdAt;
/// Create a copy of ClientApplicationDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClientApplicationDtoCopyWith<ClientApplicationDto> get copyWith => _$ClientApplicationDtoCopyWithImpl<ClientApplicationDto>(this as ClientApplicationDto, _$identity);

  /// Serializes this ClientApplicationDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ClientApplicationDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClientApplicationDto&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.clientId, _this.clientId) || other.clientId == _this.clientId)&&(identical(other.clientSecret, _this.clientSecret) || other.clientSecret == _this.clientSecret)&&const DeepCollectionEquality().equals(other.scopes, _this.scopes)&&(identical(other.isActive, _this.isActive) || other.isActive == _this.isActive)&&(identical(other.clientType, _this.clientType) || other.clientType == _this.clientType)&&(identical(other.applicationScope, _this.applicationScope) || other.applicationScope == _this.applicationScope)&&(identical(other.tenantId, _this.tenantId) || other.tenantId == _this.tenantId)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ClientApplicationDto;
  return Object.hash(runtimeType,_this.id,_this.name,_this.clientId,_this.clientSecret,const DeepCollectionEquality().hash(_this.scopes),_this.isActive,_this.clientType,_this.applicationScope,_this.tenantId,_this.createdAt);
}

@override
String toString() {
  final _this = this as ClientApplicationDto;
  return 'ClientApplicationDto(id: ${_this.id}, name: ${_this.name}, clientId: ${_this.clientId}, clientSecret: ${_this.clientSecret}, scopes: ${_this.scopes}, isActive: ${_this.isActive}, clientType: ${_this.clientType}, applicationScope: ${_this.applicationScope}, tenantId: ${_this.tenantId}, createdAt: ${_this.createdAt})';
}


}

/// @nodoc
abstract mixin class $ClientApplicationDtoCopyWith<$Res>  {
  factory $ClientApplicationDtoCopyWith(ClientApplicationDto value, $Res Function(ClientApplicationDto) _then) = _$ClientApplicationDtoCopyWithImpl;
@useResult
$Res call({
 String? id, String? name,@JsonKey(name: 'client_id') String? clientId,@JsonKey(name: 'client_secret') String? clientSecret, List<String> scopes,@JsonKey(name: 'is_active') bool isActive,@JsonKey(name: 'client_type') String? clientType,@JsonKey(name: 'application_scope') String? applicationScope,@JsonKey(name: 'tenant_id') String? tenantId,@JsonKey(name: 'created_at') String? createdAt
});




}
/// @nodoc
class _$ClientApplicationDtoCopyWithImpl<$Res>
    implements $ClientApplicationDtoCopyWith<$Res> {
  _$ClientApplicationDtoCopyWithImpl(this._self, this._then);

  final ClientApplicationDto _self;
  final $Res Function(ClientApplicationDto) _then;

/// Create a copy of ClientApplicationDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = freezed,Object? clientId = freezed,Object? clientSecret = freezed,Object? scopes = null,Object? isActive = null,Object? clientType = freezed,Object? applicationScope = freezed,Object? tenantId = freezed,Object? createdAt = freezed,}) {
  return _then(ClientApplicationDto(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,clientId: freezed == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as String?,clientSecret: freezed == clientSecret ? _self.clientSecret : clientSecret // ignore: cast_nullable_to_non_nullable
as String?,scopes: null == scopes ? _self.scopes : scopes // ignore: cast_nullable_to_non_nullable
as List<String>,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,clientType: freezed == clientType ? _self.clientType : clientType // ignore: cast_nullable_to_non_nullable
as String?,applicationScope: freezed == applicationScope ? _self.applicationScope : applicationScope // ignore: cast_nullable_to_non_nullable
as String?,tenantId: freezed == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ClientApplicationDto].
extension ClientApplicationDtoPatterns on ClientApplicationDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ClientApplicationDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ClientApplicationDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ClientApplicationDto value)  $default,){
final _that = this;
switch (_that) {
case _ClientApplicationDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ClientApplicationDto value)?  $default,){
final _that = this;
switch (_that) {
case _ClientApplicationDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String? name, @JsonKey(name: 'client_id')  String? clientId, @JsonKey(name: 'client_secret')  String? clientSecret,  List<String> scopes, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'client_type')  String? clientType, @JsonKey(name: 'application_scope')  String? applicationScope, @JsonKey(name: 'tenant_id')  String? tenantId, @JsonKey(name: 'created_at')  String? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ClientApplicationDto() when $default != null:
return $default(_that.id,_that.name,_that.clientId,_that.clientSecret,_that.scopes,_that.isActive,_that.clientType,_that.applicationScope,_that.tenantId,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String? name, @JsonKey(name: 'client_id')  String? clientId, @JsonKey(name: 'client_secret')  String? clientSecret,  List<String> scopes, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'client_type')  String? clientType, @JsonKey(name: 'application_scope')  String? applicationScope, @JsonKey(name: 'tenant_id')  String? tenantId, @JsonKey(name: 'created_at')  String? createdAt)  $default,) {final _that = this;
switch (_that) {
case _ClientApplicationDto():
return $default(_that.id,_that.name,_that.clientId,_that.clientSecret,_that.scopes,_that.isActive,_that.clientType,_that.applicationScope,_that.tenantId,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String? name, @JsonKey(name: 'client_id')  String? clientId, @JsonKey(name: 'client_secret')  String? clientSecret,  List<String> scopes, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'client_type')  String? clientType, @JsonKey(name: 'application_scope')  String? applicationScope, @JsonKey(name: 'tenant_id')  String? tenantId, @JsonKey(name: 'created_at')  String? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _ClientApplicationDto() when $default != null:
return $default(_that.id,_that.name,_that.clientId,_that.clientSecret,_that.scopes,_that.isActive,_that.clientType,_that.applicationScope,_that.tenantId,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ClientApplicationDto implements ClientApplicationDto {
  const _ClientApplicationDto({this.id, this.name, @JsonKey(name: 'client_id') this.clientId, @JsonKey(name: 'client_secret') this.clientSecret,  List<String> scopes = const <String>[], @JsonKey(name: 'is_active') this.isActive = true, @JsonKey(name: 'client_type') this.clientType, @JsonKey(name: 'application_scope') this.applicationScope, @JsonKey(name: 'tenant_id') this.tenantId, @JsonKey(name: 'created_at') this.createdAt}): _scopes = scopes;
  factory _ClientApplicationDto.fromJson(Map<String, dynamic> json) => _$ClientApplicationDtoFromJson(json);

@override final  String? id;
@override final  String? name;
@override@JsonKey(name: 'client_id') final  String? clientId;
@override@JsonKey(name: 'client_secret') final  String? clientSecret;
 final  List<String> _scopes;
@override@JsonKey() List<String> get scopes {
  if (_scopes is EqualUnmodifiableListView) return _scopes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_scopes);
}

@override@JsonKey(name: 'is_active') final  bool isActive;
@override@JsonKey(name: 'client_type') final  String? clientType;
@override@JsonKey(name: 'application_scope') final  String? applicationScope;
@override@JsonKey(name: 'tenant_id') final  String? tenantId;
@override@JsonKey(name: 'created_at') final  String? createdAt;

/// Create a copy of ClientApplicationDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClientApplicationDtoCopyWith<_ClientApplicationDto> get copyWith => __$ClientApplicationDtoCopyWithImpl<_ClientApplicationDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ClientApplicationDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClientApplicationDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.clientId, clientId) || other.clientId == clientId)&&(identical(other.clientSecret, clientSecret) || other.clientSecret == clientSecret)&&const DeepCollectionEquality().equals(other.scopes, _scopes)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.clientType, clientType) || other.clientType == clientType)&&(identical(other.applicationScope, applicationScope) || other.applicationScope == applicationScope)&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,clientId,clientSecret,const DeepCollectionEquality().hash(_scopes),isActive,clientType,applicationScope,tenantId,createdAt);
}

@override
String toString() {
    return 'ClientApplicationDto(id: $id, name: $name, clientId: $clientId, clientSecret: $clientSecret, scopes: $scopes, isActive: $isActive, clientType: $clientType, applicationScope: $applicationScope, tenantId: $tenantId, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$ClientApplicationDtoCopyWith<$Res> implements $ClientApplicationDtoCopyWith<$Res> {
  factory _$ClientApplicationDtoCopyWith(_ClientApplicationDto value, $Res Function(_ClientApplicationDto) _then) = __$ClientApplicationDtoCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? name,@JsonKey(name: 'client_id') String? clientId,@JsonKey(name: 'client_secret') String? clientSecret, List<String> scopes,@JsonKey(name: 'is_active') bool isActive,@JsonKey(name: 'client_type') String? clientType,@JsonKey(name: 'application_scope') String? applicationScope,@JsonKey(name: 'tenant_id') String? tenantId,@JsonKey(name: 'created_at') String? createdAt
});




}
/// @nodoc
class __$ClientApplicationDtoCopyWithImpl<$Res>
    implements _$ClientApplicationDtoCopyWith<$Res> {
  __$ClientApplicationDtoCopyWithImpl(this._self, this._then);

  final _ClientApplicationDto _self;
  final $Res Function(_ClientApplicationDto) _then;

/// Create a copy of ClientApplicationDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = freezed,Object? clientId = freezed,Object? clientSecret = freezed,Object? scopes = null,Object? isActive = null,Object? clientType = freezed,Object? applicationScope = freezed,Object? tenantId = freezed,Object? createdAt = freezed,}) {
  return _then(_ClientApplicationDto(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,clientId: freezed == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as String?,clientSecret: freezed == clientSecret ? _self.clientSecret : clientSecret // ignore: cast_nullable_to_non_nullable
as String?,scopes: null == scopes ? _self._scopes : scopes // ignore: cast_nullable_to_non_nullable
as List<String>,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,clientType: freezed == clientType ? _self.clientType : clientType // ignore: cast_nullable_to_non_nullable
as String?,applicationScope: freezed == applicationScope ? _self.applicationScope : applicationScope // ignore: cast_nullable_to_non_nullable
as String?,tenantId: freezed == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$CreateClientApplicationRequestDto {

 String get name; List<String> get scopes;
/// Create a copy of CreateClientApplicationRequestDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateClientApplicationRequestDtoCopyWith<CreateClientApplicationRequestDto> get copyWith => _$CreateClientApplicationRequestDtoCopyWithImpl<CreateClientApplicationRequestDto>(this as CreateClientApplicationRequestDto, _$identity);

  /// Serializes this CreateClientApplicationRequestDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as CreateClientApplicationRequestDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateClientApplicationRequestDto&&(identical(other.name, _this.name) || other.name == _this.name)&&const DeepCollectionEquality().equals(other.scopes, _this.scopes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as CreateClientApplicationRequestDto;
  return Object.hash(runtimeType,_this.name,const DeepCollectionEquality().hash(_this.scopes));
}

@override
String toString() {
  final _this = this as CreateClientApplicationRequestDto;
  return 'CreateClientApplicationRequestDto(name: ${_this.name}, scopes: ${_this.scopes})';
}


}

/// @nodoc
abstract mixin class $CreateClientApplicationRequestDtoCopyWith<$Res>  {
  factory $CreateClientApplicationRequestDtoCopyWith(CreateClientApplicationRequestDto value, $Res Function(CreateClientApplicationRequestDto) _then) = _$CreateClientApplicationRequestDtoCopyWithImpl;
@useResult
$Res call({
 String name, List<String> scopes
});




}
/// @nodoc
class _$CreateClientApplicationRequestDtoCopyWithImpl<$Res>
    implements $CreateClientApplicationRequestDtoCopyWith<$Res> {
  _$CreateClientApplicationRequestDtoCopyWithImpl(this._self, this._then);

  final CreateClientApplicationRequestDto _self;
  final $Res Function(CreateClientApplicationRequestDto) _then;

/// Create a copy of CreateClientApplicationRequestDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? scopes = null,}) {
  return _then(CreateClientApplicationRequestDto(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,scopes: null == scopes ? _self.scopes : scopes // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateClientApplicationRequestDto].
extension CreateClientApplicationRequestDtoPatterns on CreateClientApplicationRequestDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateClientApplicationRequestDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateClientApplicationRequestDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateClientApplicationRequestDto value)  $default,){
final _that = this;
switch (_that) {
case _CreateClientApplicationRequestDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateClientApplicationRequestDto value)?  $default,){
final _that = this;
switch (_that) {
case _CreateClientApplicationRequestDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  List<String> scopes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateClientApplicationRequestDto() when $default != null:
return $default(_that.name,_that.scopes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  List<String> scopes)  $default,) {final _that = this;
switch (_that) {
case _CreateClientApplicationRequestDto():
return $default(_that.name,_that.scopes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  List<String> scopes)?  $default,) {final _that = this;
switch (_that) {
case _CreateClientApplicationRequestDto() when $default != null:
return $default(_that.name,_that.scopes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateClientApplicationRequestDto implements CreateClientApplicationRequestDto {
  const _CreateClientApplicationRequestDto({required this.name, required  List<String> scopes}): _scopes = scopes;
  factory _CreateClientApplicationRequestDto.fromJson(Map<String, dynamic> json) => _$CreateClientApplicationRequestDtoFromJson(json);

@override final  String name;
 final  List<String> _scopes;
@override List<String> get scopes {
  if (_scopes is EqualUnmodifiableListView) return _scopes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_scopes);
}


/// Create a copy of CreateClientApplicationRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateClientApplicationRequestDtoCopyWith<_CreateClientApplicationRequestDto> get copyWith => __$CreateClientApplicationRequestDtoCopyWithImpl<_CreateClientApplicationRequestDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateClientApplicationRequestDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateClientApplicationRequestDto&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other.scopes, _scopes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,name,const DeepCollectionEquality().hash(_scopes));
}

@override
String toString() {
    return 'CreateClientApplicationRequestDto(name: $name, scopes: $scopes)';
}


}

/// @nodoc
abstract mixin class _$CreateClientApplicationRequestDtoCopyWith<$Res> implements $CreateClientApplicationRequestDtoCopyWith<$Res> {
  factory _$CreateClientApplicationRequestDtoCopyWith(_CreateClientApplicationRequestDto value, $Res Function(_CreateClientApplicationRequestDto) _then) = __$CreateClientApplicationRequestDtoCopyWithImpl;
@override @useResult
$Res call({
 String name, List<String> scopes
});




}
/// @nodoc
class __$CreateClientApplicationRequestDtoCopyWithImpl<$Res>
    implements _$CreateClientApplicationRequestDtoCopyWith<$Res> {
  __$CreateClientApplicationRequestDtoCopyWithImpl(this._self, this._then);

  final _CreateClientApplicationRequestDto _self;
  final $Res Function(_CreateClientApplicationRequestDto) _then;

/// Create a copy of CreateClientApplicationRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? scopes = null,}) {
  return _then(_CreateClientApplicationRequestDto(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,scopes: null == scopes ? _self._scopes : scopes // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
