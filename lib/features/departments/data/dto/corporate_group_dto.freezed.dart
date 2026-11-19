// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'corporate_group_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CorporateGroupDto {

 String? get id; String? get name; String? get description;@JsonKey(name: 'tenant_id') String? get tenantId;@JsonKey(name: 'created_at') String? get createdAt;@JsonKey(name: 'updated_at') String? get updatedAt;
/// Create a copy of CorporateGroupDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CorporateGroupDtoCopyWith<CorporateGroupDto> get copyWith => _$CorporateGroupDtoCopyWithImpl<CorporateGroupDto>(this as CorporateGroupDto, _$identity);

  /// Serializes this CorporateGroupDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as CorporateGroupDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CorporateGroupDto&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.description, _this.description) || other.description == _this.description)&&(identical(other.tenantId, _this.tenantId) || other.tenantId == _this.tenantId)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as CorporateGroupDto;
  return Object.hash(runtimeType,_this.id,_this.name,_this.description,_this.tenantId,_this.createdAt,_this.updatedAt);
}

@override
String toString() {
  final _this = this as CorporateGroupDto;
  return 'CorporateGroupDto(id: ${_this.id}, name: ${_this.name}, description: ${_this.description}, tenantId: ${_this.tenantId}, createdAt: ${_this.createdAt}, updatedAt: ${_this.updatedAt})';
}


}

/// @nodoc
abstract mixin class $CorporateGroupDtoCopyWith<$Res>  {
  factory $CorporateGroupDtoCopyWith(CorporateGroupDto value, $Res Function(CorporateGroupDto) _then) = _$CorporateGroupDtoCopyWithImpl;
@useResult
$Res call({
 String? id, String? name, String? description,@JsonKey(name: 'tenant_id') String? tenantId,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt
});




}
/// @nodoc
class _$CorporateGroupDtoCopyWithImpl<$Res>
    implements $CorporateGroupDtoCopyWith<$Res> {
  _$CorporateGroupDtoCopyWithImpl(this._self, this._then);

  final CorporateGroupDto _self;
  final $Res Function(CorporateGroupDto) _then;

/// Create a copy of CorporateGroupDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = freezed,Object? description = freezed,Object? tenantId = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(CorporateGroupDto(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,tenantId: freezed == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CorporateGroupDto].
extension CorporateGroupDtoPatterns on CorporateGroupDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CorporateGroupDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CorporateGroupDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CorporateGroupDto value)  $default,){
final _that = this;
switch (_that) {
case _CorporateGroupDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CorporateGroupDto value)?  $default,){
final _that = this;
switch (_that) {
case _CorporateGroupDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String? name,  String? description, @JsonKey(name: 'tenant_id')  String? tenantId, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CorporateGroupDto() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.tenantId,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String? name,  String? description, @JsonKey(name: 'tenant_id')  String? tenantId, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _CorporateGroupDto():
return $default(_that.id,_that.name,_that.description,_that.tenantId,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String? name,  String? description, @JsonKey(name: 'tenant_id')  String? tenantId, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _CorporateGroupDto() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.tenantId,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CorporateGroupDto implements CorporateGroupDto {
  const _CorporateGroupDto({this.id, this.name, this.description, @JsonKey(name: 'tenant_id') this.tenantId, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt});
  factory _CorporateGroupDto.fromJson(Map<String, dynamic> json) => _$CorporateGroupDtoFromJson(json);

@override final  String? id;
@override final  String? name;
@override final  String? description;
@override@JsonKey(name: 'tenant_id') final  String? tenantId;
@override@JsonKey(name: 'created_at') final  String? createdAt;
@override@JsonKey(name: 'updated_at') final  String? updatedAt;

/// Create a copy of CorporateGroupDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CorporateGroupDtoCopyWith<_CorporateGroupDto> get copyWith => __$CorporateGroupDtoCopyWithImpl<_CorporateGroupDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CorporateGroupDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CorporateGroupDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,description,tenantId,createdAt,updatedAt);
}

@override
String toString() {
    return 'CorporateGroupDto(id: $id, name: $name, description: $description, tenantId: $tenantId, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$CorporateGroupDtoCopyWith<$Res> implements $CorporateGroupDtoCopyWith<$Res> {
  factory _$CorporateGroupDtoCopyWith(_CorporateGroupDto value, $Res Function(_CorporateGroupDto) _then) = __$CorporateGroupDtoCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? name, String? description,@JsonKey(name: 'tenant_id') String? tenantId,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt
});




}
/// @nodoc
class __$CorporateGroupDtoCopyWithImpl<$Res>
    implements _$CorporateGroupDtoCopyWith<$Res> {
  __$CorporateGroupDtoCopyWithImpl(this._self, this._then);

  final _CorporateGroupDto _self;
  final $Res Function(_CorporateGroupDto) _then;

/// Create a copy of CorporateGroupDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = freezed,Object? description = freezed,Object? tenantId = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_CorporateGroupDto(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,tenantId: freezed == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$CreateCorporateGroupRequestDto {

 String get name;@JsonKey(includeIfNull: false) String? get description;
/// Create a copy of CreateCorporateGroupRequestDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateCorporateGroupRequestDtoCopyWith<CreateCorporateGroupRequestDto> get copyWith => _$CreateCorporateGroupRequestDtoCopyWithImpl<CreateCorporateGroupRequestDto>(this as CreateCorporateGroupRequestDto, _$identity);

  /// Serializes this CreateCorporateGroupRequestDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as CreateCorporateGroupRequestDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateCorporateGroupRequestDto&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.description, _this.description) || other.description == _this.description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as CreateCorporateGroupRequestDto;
  return Object.hash(runtimeType,_this.name,_this.description);
}

@override
String toString() {
  final _this = this as CreateCorporateGroupRequestDto;
  return 'CreateCorporateGroupRequestDto(name: ${_this.name}, description: ${_this.description})';
}


}

/// @nodoc
abstract mixin class $CreateCorporateGroupRequestDtoCopyWith<$Res>  {
  factory $CreateCorporateGroupRequestDtoCopyWith(CreateCorporateGroupRequestDto value, $Res Function(CreateCorporateGroupRequestDto) _then) = _$CreateCorporateGroupRequestDtoCopyWithImpl;
@useResult
$Res call({
 String name,@JsonKey(includeIfNull: false) String? description
});




}
/// @nodoc
class _$CreateCorporateGroupRequestDtoCopyWithImpl<$Res>
    implements $CreateCorporateGroupRequestDtoCopyWith<$Res> {
  _$CreateCorporateGroupRequestDtoCopyWithImpl(this._self, this._then);

  final CreateCorporateGroupRequestDto _self;
  final $Res Function(CreateCorporateGroupRequestDto) _then;

/// Create a copy of CreateCorporateGroupRequestDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? description = freezed,}) {
  return _then(CreateCorporateGroupRequestDto(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateCorporateGroupRequestDto].
extension CreateCorporateGroupRequestDtoPatterns on CreateCorporateGroupRequestDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateCorporateGroupRequestDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateCorporateGroupRequestDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateCorporateGroupRequestDto value)  $default,){
final _that = this;
switch (_that) {
case _CreateCorporateGroupRequestDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateCorporateGroupRequestDto value)?  $default,){
final _that = this;
switch (_that) {
case _CreateCorporateGroupRequestDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name, @JsonKey(includeIfNull: false)  String? description)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateCorporateGroupRequestDto() when $default != null:
return $default(_that.name,_that.description);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name, @JsonKey(includeIfNull: false)  String? description)  $default,) {final _that = this;
switch (_that) {
case _CreateCorporateGroupRequestDto():
return $default(_that.name,_that.description);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name, @JsonKey(includeIfNull: false)  String? description)?  $default,) {final _that = this;
switch (_that) {
case _CreateCorporateGroupRequestDto() when $default != null:
return $default(_that.name,_that.description);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateCorporateGroupRequestDto implements CreateCorporateGroupRequestDto {
  const _CreateCorporateGroupRequestDto({required this.name, @JsonKey(includeIfNull: false) this.description});
  factory _CreateCorporateGroupRequestDto.fromJson(Map<String, dynamic> json) => _$CreateCorporateGroupRequestDtoFromJson(json);

@override final  String name;
@override@JsonKey(includeIfNull: false) final  String? description;

/// Create a copy of CreateCorporateGroupRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateCorporateGroupRequestDtoCopyWith<_CreateCorporateGroupRequestDto> get copyWith => __$CreateCorporateGroupRequestDtoCopyWithImpl<_CreateCorporateGroupRequestDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateCorporateGroupRequestDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateCorporateGroupRequestDto&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,name,description);
}

@override
String toString() {
    return 'CreateCorporateGroupRequestDto(name: $name, description: $description)';
}


}

/// @nodoc
abstract mixin class _$CreateCorporateGroupRequestDtoCopyWith<$Res> implements $CreateCorporateGroupRequestDtoCopyWith<$Res> {
  factory _$CreateCorporateGroupRequestDtoCopyWith(_CreateCorporateGroupRequestDto value, $Res Function(_CreateCorporateGroupRequestDto) _then) = __$CreateCorporateGroupRequestDtoCopyWithImpl;
@override @useResult
$Res call({
 String name,@JsonKey(includeIfNull: false) String? description
});




}
/// @nodoc
class __$CreateCorporateGroupRequestDtoCopyWithImpl<$Res>
    implements _$CreateCorporateGroupRequestDtoCopyWith<$Res> {
  __$CreateCorporateGroupRequestDtoCopyWithImpl(this._self, this._then);

  final _CreateCorporateGroupRequestDto _self;
  final $Res Function(_CreateCorporateGroupRequestDto) _then;

/// Create a copy of CreateCorporateGroupRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? description = freezed,}) {
  return _then(_CreateCorporateGroupRequestDto(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$AssignDepartmentToGroupRequestDto {

@JsonKey(name: 'corporate_group_id') String get corporateGroupId;
/// Create a copy of AssignDepartmentToGroupRequestDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AssignDepartmentToGroupRequestDtoCopyWith<AssignDepartmentToGroupRequestDto> get copyWith => _$AssignDepartmentToGroupRequestDtoCopyWithImpl<AssignDepartmentToGroupRequestDto>(this as AssignDepartmentToGroupRequestDto, _$identity);

  /// Serializes this AssignDepartmentToGroupRequestDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as AssignDepartmentToGroupRequestDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AssignDepartmentToGroupRequestDto&&(identical(other.corporateGroupId, _this.corporateGroupId) || other.corporateGroupId == _this.corporateGroupId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as AssignDepartmentToGroupRequestDto;
  return Object.hash(runtimeType,_this.corporateGroupId);
}

@override
String toString() {
  final _this = this as AssignDepartmentToGroupRequestDto;
  return 'AssignDepartmentToGroupRequestDto(corporateGroupId: ${_this.corporateGroupId})';
}


}

/// @nodoc
abstract mixin class $AssignDepartmentToGroupRequestDtoCopyWith<$Res>  {
  factory $AssignDepartmentToGroupRequestDtoCopyWith(AssignDepartmentToGroupRequestDto value, $Res Function(AssignDepartmentToGroupRequestDto) _then) = _$AssignDepartmentToGroupRequestDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'corporate_group_id') String corporateGroupId
});




}
/// @nodoc
class _$AssignDepartmentToGroupRequestDtoCopyWithImpl<$Res>
    implements $AssignDepartmentToGroupRequestDtoCopyWith<$Res> {
  _$AssignDepartmentToGroupRequestDtoCopyWithImpl(this._self, this._then);

  final AssignDepartmentToGroupRequestDto _self;
  final $Res Function(AssignDepartmentToGroupRequestDto) _then;

/// Create a copy of AssignDepartmentToGroupRequestDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? corporateGroupId = null,}) {
  return _then(AssignDepartmentToGroupRequestDto(
corporateGroupId: null == corporateGroupId ? _self.corporateGroupId : corporateGroupId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AssignDepartmentToGroupRequestDto].
extension AssignDepartmentToGroupRequestDtoPatterns on AssignDepartmentToGroupRequestDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AssignDepartmentToGroupRequestDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AssignDepartmentToGroupRequestDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AssignDepartmentToGroupRequestDto value)  $default,){
final _that = this;
switch (_that) {
case _AssignDepartmentToGroupRequestDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AssignDepartmentToGroupRequestDto value)?  $default,){
final _that = this;
switch (_that) {
case _AssignDepartmentToGroupRequestDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'corporate_group_id')  String corporateGroupId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AssignDepartmentToGroupRequestDto() when $default != null:
return $default(_that.corporateGroupId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'corporate_group_id')  String corporateGroupId)  $default,) {final _that = this;
switch (_that) {
case _AssignDepartmentToGroupRequestDto():
return $default(_that.corporateGroupId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'corporate_group_id')  String corporateGroupId)?  $default,) {final _that = this;
switch (_that) {
case _AssignDepartmentToGroupRequestDto() when $default != null:
return $default(_that.corporateGroupId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AssignDepartmentToGroupRequestDto implements AssignDepartmentToGroupRequestDto {
  const _AssignDepartmentToGroupRequestDto({@JsonKey(name: 'corporate_group_id') required this.corporateGroupId});
  factory _AssignDepartmentToGroupRequestDto.fromJson(Map<String, dynamic> json) => _$AssignDepartmentToGroupRequestDtoFromJson(json);

@override@JsonKey(name: 'corporate_group_id') final  String corporateGroupId;

/// Create a copy of AssignDepartmentToGroupRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AssignDepartmentToGroupRequestDtoCopyWith<_AssignDepartmentToGroupRequestDto> get copyWith => __$AssignDepartmentToGroupRequestDtoCopyWithImpl<_AssignDepartmentToGroupRequestDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AssignDepartmentToGroupRequestDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AssignDepartmentToGroupRequestDto&&(identical(other.corporateGroupId, corporateGroupId) || other.corporateGroupId == corporateGroupId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,corporateGroupId);
}

@override
String toString() {
    return 'AssignDepartmentToGroupRequestDto(corporateGroupId: $corporateGroupId)';
}


}

/// @nodoc
abstract mixin class _$AssignDepartmentToGroupRequestDtoCopyWith<$Res> implements $AssignDepartmentToGroupRequestDtoCopyWith<$Res> {
  factory _$AssignDepartmentToGroupRequestDtoCopyWith(_AssignDepartmentToGroupRequestDto value, $Res Function(_AssignDepartmentToGroupRequestDto) _then) = __$AssignDepartmentToGroupRequestDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'corporate_group_id') String corporateGroupId
});




}
/// @nodoc
class __$AssignDepartmentToGroupRequestDtoCopyWithImpl<$Res>
    implements _$AssignDepartmentToGroupRequestDtoCopyWith<$Res> {
  __$AssignDepartmentToGroupRequestDtoCopyWithImpl(this._self, this._then);

  final _AssignDepartmentToGroupRequestDto _self;
  final $Res Function(_AssignDepartmentToGroupRequestDto) _then;

/// Create a copy of AssignDepartmentToGroupRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? corporateGroupId = null,}) {
  return _then(_AssignDepartmentToGroupRequestDto(
corporateGroupId: null == corporateGroupId ? _self.corporateGroupId : corporateGroupId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
