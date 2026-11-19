// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'department_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DepartmentDto {

 String? get id; String? get name; String? get code;@JsonKey(name: 'unit_type') String? get unitType;@JsonKey(name: 'parent_department_id') String? get parentDepartmentId;@JsonKey(name: 'manager_party_id') String? get managerPartyId;@JsonKey(name: 'tenant_id') String? get tenantId;@JsonKey(name: 'created_at') String? get createdAt;@JsonKey(name: 'updated_at') String? get updatedAt;
/// Create a copy of DepartmentDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DepartmentDtoCopyWith<DepartmentDto> get copyWith => _$DepartmentDtoCopyWithImpl<DepartmentDto>(this as DepartmentDto, _$identity);

  /// Serializes this DepartmentDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as DepartmentDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DepartmentDto&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.code, _this.code) || other.code == _this.code)&&(identical(other.unitType, _this.unitType) || other.unitType == _this.unitType)&&(identical(other.parentDepartmentId, _this.parentDepartmentId) || other.parentDepartmentId == _this.parentDepartmentId)&&(identical(other.managerPartyId, _this.managerPartyId) || other.managerPartyId == _this.managerPartyId)&&(identical(other.tenantId, _this.tenantId) || other.tenantId == _this.tenantId)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as DepartmentDto;
  return Object.hash(runtimeType,_this.id,_this.name,_this.code,_this.unitType,_this.parentDepartmentId,_this.managerPartyId,_this.tenantId,_this.createdAt,_this.updatedAt);
}

@override
String toString() {
  final _this = this as DepartmentDto;
  return 'DepartmentDto(id: ${_this.id}, name: ${_this.name}, code: ${_this.code}, unitType: ${_this.unitType}, parentDepartmentId: ${_this.parentDepartmentId}, managerPartyId: ${_this.managerPartyId}, tenantId: ${_this.tenantId}, createdAt: ${_this.createdAt}, updatedAt: ${_this.updatedAt})';
}


}

/// @nodoc
abstract mixin class $DepartmentDtoCopyWith<$Res>  {
  factory $DepartmentDtoCopyWith(DepartmentDto value, $Res Function(DepartmentDto) _then) = _$DepartmentDtoCopyWithImpl;
@useResult
$Res call({
 String? id, String? name, String? code,@JsonKey(name: 'unit_type') String? unitType,@JsonKey(name: 'parent_department_id') String? parentDepartmentId,@JsonKey(name: 'manager_party_id') String? managerPartyId,@JsonKey(name: 'tenant_id') String? tenantId,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt
});




}
/// @nodoc
class _$DepartmentDtoCopyWithImpl<$Res>
    implements $DepartmentDtoCopyWith<$Res> {
  _$DepartmentDtoCopyWithImpl(this._self, this._then);

  final DepartmentDto _self;
  final $Res Function(DepartmentDto) _then;

/// Create a copy of DepartmentDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = freezed,Object? code = freezed,Object? unitType = freezed,Object? parentDepartmentId = freezed,Object? managerPartyId = freezed,Object? tenantId = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(DepartmentDto(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,unitType: freezed == unitType ? _self.unitType : unitType // ignore: cast_nullable_to_non_nullable
as String?,parentDepartmentId: freezed == parentDepartmentId ? _self.parentDepartmentId : parentDepartmentId // ignore: cast_nullable_to_non_nullable
as String?,managerPartyId: freezed == managerPartyId ? _self.managerPartyId : managerPartyId // ignore: cast_nullable_to_non_nullable
as String?,tenantId: freezed == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [DepartmentDto].
extension DepartmentDtoPatterns on DepartmentDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DepartmentDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DepartmentDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DepartmentDto value)  $default,){
final _that = this;
switch (_that) {
case _DepartmentDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DepartmentDto value)?  $default,){
final _that = this;
switch (_that) {
case _DepartmentDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String? name,  String? code, @JsonKey(name: 'unit_type')  String? unitType, @JsonKey(name: 'parent_department_id')  String? parentDepartmentId, @JsonKey(name: 'manager_party_id')  String? managerPartyId, @JsonKey(name: 'tenant_id')  String? tenantId, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DepartmentDto() when $default != null:
return $default(_that.id,_that.name,_that.code,_that.unitType,_that.parentDepartmentId,_that.managerPartyId,_that.tenantId,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String? name,  String? code, @JsonKey(name: 'unit_type')  String? unitType, @JsonKey(name: 'parent_department_id')  String? parentDepartmentId, @JsonKey(name: 'manager_party_id')  String? managerPartyId, @JsonKey(name: 'tenant_id')  String? tenantId, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _DepartmentDto():
return $default(_that.id,_that.name,_that.code,_that.unitType,_that.parentDepartmentId,_that.managerPartyId,_that.tenantId,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String? name,  String? code, @JsonKey(name: 'unit_type')  String? unitType, @JsonKey(name: 'parent_department_id')  String? parentDepartmentId, @JsonKey(name: 'manager_party_id')  String? managerPartyId, @JsonKey(name: 'tenant_id')  String? tenantId, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _DepartmentDto() when $default != null:
return $default(_that.id,_that.name,_that.code,_that.unitType,_that.parentDepartmentId,_that.managerPartyId,_that.tenantId,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DepartmentDto implements DepartmentDto {
  const _DepartmentDto({this.id, this.name, this.code, @JsonKey(name: 'unit_type') this.unitType, @JsonKey(name: 'parent_department_id') this.parentDepartmentId, @JsonKey(name: 'manager_party_id') this.managerPartyId, @JsonKey(name: 'tenant_id') this.tenantId, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt});
  factory _DepartmentDto.fromJson(Map<String, dynamic> json) => _$DepartmentDtoFromJson(json);

@override final  String? id;
@override final  String? name;
@override final  String? code;
@override@JsonKey(name: 'unit_type') final  String? unitType;
@override@JsonKey(name: 'parent_department_id') final  String? parentDepartmentId;
@override@JsonKey(name: 'manager_party_id') final  String? managerPartyId;
@override@JsonKey(name: 'tenant_id') final  String? tenantId;
@override@JsonKey(name: 'created_at') final  String? createdAt;
@override@JsonKey(name: 'updated_at') final  String? updatedAt;

/// Create a copy of DepartmentDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DepartmentDtoCopyWith<_DepartmentDto> get copyWith => __$DepartmentDtoCopyWithImpl<_DepartmentDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DepartmentDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _DepartmentDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.code, code) || other.code == code)&&(identical(other.unitType, unitType) || other.unitType == unitType)&&(identical(other.parentDepartmentId, parentDepartmentId) || other.parentDepartmentId == parentDepartmentId)&&(identical(other.managerPartyId, managerPartyId) || other.managerPartyId == managerPartyId)&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,code,unitType,parentDepartmentId,managerPartyId,tenantId,createdAt,updatedAt);
}

@override
String toString() {
    return 'DepartmentDto(id: $id, name: $name, code: $code, unitType: $unitType, parentDepartmentId: $parentDepartmentId, managerPartyId: $managerPartyId, tenantId: $tenantId, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$DepartmentDtoCopyWith<$Res> implements $DepartmentDtoCopyWith<$Res> {
  factory _$DepartmentDtoCopyWith(_DepartmentDto value, $Res Function(_DepartmentDto) _then) = __$DepartmentDtoCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? name, String? code,@JsonKey(name: 'unit_type') String? unitType,@JsonKey(name: 'parent_department_id') String? parentDepartmentId,@JsonKey(name: 'manager_party_id') String? managerPartyId,@JsonKey(name: 'tenant_id') String? tenantId,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt
});




}
/// @nodoc
class __$DepartmentDtoCopyWithImpl<$Res>
    implements _$DepartmentDtoCopyWith<$Res> {
  __$DepartmentDtoCopyWithImpl(this._self, this._then);

  final _DepartmentDto _self;
  final $Res Function(_DepartmentDto) _then;

/// Create a copy of DepartmentDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = freezed,Object? code = freezed,Object? unitType = freezed,Object? parentDepartmentId = freezed,Object? managerPartyId = freezed,Object? tenantId = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_DepartmentDto(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,unitType: freezed == unitType ? _self.unitType : unitType // ignore: cast_nullable_to_non_nullable
as String?,parentDepartmentId: freezed == parentDepartmentId ? _self.parentDepartmentId : parentDepartmentId // ignore: cast_nullable_to_non_nullable
as String?,managerPartyId: freezed == managerPartyId ? _self.managerPartyId : managerPartyId // ignore: cast_nullable_to_non_nullable
as String?,tenantId: freezed == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$CreateDepartmentRequestDto {

 String get name; String get code;@JsonKey(name: 'unit_type') String get unitType;@JsonKey(name: 'parent_department_id', includeIfNull: false) String? get parentDepartmentId;@JsonKey(name: 'manager_party_id', includeIfNull: false) String? get managerPartyId;
/// Create a copy of CreateDepartmentRequestDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateDepartmentRequestDtoCopyWith<CreateDepartmentRequestDto> get copyWith => _$CreateDepartmentRequestDtoCopyWithImpl<CreateDepartmentRequestDto>(this as CreateDepartmentRequestDto, _$identity);

  /// Serializes this CreateDepartmentRequestDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as CreateDepartmentRequestDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateDepartmentRequestDto&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.code, _this.code) || other.code == _this.code)&&(identical(other.unitType, _this.unitType) || other.unitType == _this.unitType)&&(identical(other.parentDepartmentId, _this.parentDepartmentId) || other.parentDepartmentId == _this.parentDepartmentId)&&(identical(other.managerPartyId, _this.managerPartyId) || other.managerPartyId == _this.managerPartyId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as CreateDepartmentRequestDto;
  return Object.hash(runtimeType,_this.name,_this.code,_this.unitType,_this.parentDepartmentId,_this.managerPartyId);
}

@override
String toString() {
  final _this = this as CreateDepartmentRequestDto;
  return 'CreateDepartmentRequestDto(name: ${_this.name}, code: ${_this.code}, unitType: ${_this.unitType}, parentDepartmentId: ${_this.parentDepartmentId}, managerPartyId: ${_this.managerPartyId})';
}


}

/// @nodoc
abstract mixin class $CreateDepartmentRequestDtoCopyWith<$Res>  {
  factory $CreateDepartmentRequestDtoCopyWith(CreateDepartmentRequestDto value, $Res Function(CreateDepartmentRequestDto) _then) = _$CreateDepartmentRequestDtoCopyWithImpl;
@useResult
$Res call({
 String name, String code,@JsonKey(name: 'unit_type') String unitType,@JsonKey(name: 'parent_department_id', includeIfNull: false) String? parentDepartmentId,@JsonKey(name: 'manager_party_id', includeIfNull: false) String? managerPartyId
});




}
/// @nodoc
class _$CreateDepartmentRequestDtoCopyWithImpl<$Res>
    implements $CreateDepartmentRequestDtoCopyWith<$Res> {
  _$CreateDepartmentRequestDtoCopyWithImpl(this._self, this._then);

  final CreateDepartmentRequestDto _self;
  final $Res Function(CreateDepartmentRequestDto) _then;

/// Create a copy of CreateDepartmentRequestDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? code = null,Object? unitType = null,Object? parentDepartmentId = freezed,Object? managerPartyId = freezed,}) {
  return _then(CreateDepartmentRequestDto(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,unitType: null == unitType ? _self.unitType : unitType // ignore: cast_nullable_to_non_nullable
as String,parentDepartmentId: freezed == parentDepartmentId ? _self.parentDepartmentId : parentDepartmentId // ignore: cast_nullable_to_non_nullable
as String?,managerPartyId: freezed == managerPartyId ? _self.managerPartyId : managerPartyId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateDepartmentRequestDto].
extension CreateDepartmentRequestDtoPatterns on CreateDepartmentRequestDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateDepartmentRequestDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateDepartmentRequestDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateDepartmentRequestDto value)  $default,){
final _that = this;
switch (_that) {
case _CreateDepartmentRequestDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateDepartmentRequestDto value)?  $default,){
final _that = this;
switch (_that) {
case _CreateDepartmentRequestDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String code, @JsonKey(name: 'unit_type')  String unitType, @JsonKey(name: 'parent_department_id', includeIfNull: false)  String? parentDepartmentId, @JsonKey(name: 'manager_party_id', includeIfNull: false)  String? managerPartyId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateDepartmentRequestDto() when $default != null:
return $default(_that.name,_that.code,_that.unitType,_that.parentDepartmentId,_that.managerPartyId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String code, @JsonKey(name: 'unit_type')  String unitType, @JsonKey(name: 'parent_department_id', includeIfNull: false)  String? parentDepartmentId, @JsonKey(name: 'manager_party_id', includeIfNull: false)  String? managerPartyId)  $default,) {final _that = this;
switch (_that) {
case _CreateDepartmentRequestDto():
return $default(_that.name,_that.code,_that.unitType,_that.parentDepartmentId,_that.managerPartyId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String code, @JsonKey(name: 'unit_type')  String unitType, @JsonKey(name: 'parent_department_id', includeIfNull: false)  String? parentDepartmentId, @JsonKey(name: 'manager_party_id', includeIfNull: false)  String? managerPartyId)?  $default,) {final _that = this;
switch (_that) {
case _CreateDepartmentRequestDto() when $default != null:
return $default(_that.name,_that.code,_that.unitType,_that.parentDepartmentId,_that.managerPartyId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateDepartmentRequestDto implements CreateDepartmentRequestDto {
  const _CreateDepartmentRequestDto({required this.name, required this.code, @JsonKey(name: 'unit_type') required this.unitType, @JsonKey(name: 'parent_department_id', includeIfNull: false) this.parentDepartmentId, @JsonKey(name: 'manager_party_id', includeIfNull: false) this.managerPartyId});
  factory _CreateDepartmentRequestDto.fromJson(Map<String, dynamic> json) => _$CreateDepartmentRequestDtoFromJson(json);

@override final  String name;
@override final  String code;
@override@JsonKey(name: 'unit_type') final  String unitType;
@override@JsonKey(name: 'parent_department_id', includeIfNull: false) final  String? parentDepartmentId;
@override@JsonKey(name: 'manager_party_id', includeIfNull: false) final  String? managerPartyId;

/// Create a copy of CreateDepartmentRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateDepartmentRequestDtoCopyWith<_CreateDepartmentRequestDto> get copyWith => __$CreateDepartmentRequestDtoCopyWithImpl<_CreateDepartmentRequestDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateDepartmentRequestDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateDepartmentRequestDto&&(identical(other.name, name) || other.name == name)&&(identical(other.code, code) || other.code == code)&&(identical(other.unitType, unitType) || other.unitType == unitType)&&(identical(other.parentDepartmentId, parentDepartmentId) || other.parentDepartmentId == parentDepartmentId)&&(identical(other.managerPartyId, managerPartyId) || other.managerPartyId == managerPartyId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,name,code,unitType,parentDepartmentId,managerPartyId);
}

@override
String toString() {
    return 'CreateDepartmentRequestDto(name: $name, code: $code, unitType: $unitType, parentDepartmentId: $parentDepartmentId, managerPartyId: $managerPartyId)';
}


}

/// @nodoc
abstract mixin class _$CreateDepartmentRequestDtoCopyWith<$Res> implements $CreateDepartmentRequestDtoCopyWith<$Res> {
  factory _$CreateDepartmentRequestDtoCopyWith(_CreateDepartmentRequestDto value, $Res Function(_CreateDepartmentRequestDto) _then) = __$CreateDepartmentRequestDtoCopyWithImpl;
@override @useResult
$Res call({
 String name, String code,@JsonKey(name: 'unit_type') String unitType,@JsonKey(name: 'parent_department_id', includeIfNull: false) String? parentDepartmentId,@JsonKey(name: 'manager_party_id', includeIfNull: false) String? managerPartyId
});




}
/// @nodoc
class __$CreateDepartmentRequestDtoCopyWithImpl<$Res>
    implements _$CreateDepartmentRequestDtoCopyWith<$Res> {
  __$CreateDepartmentRequestDtoCopyWithImpl(this._self, this._then);

  final _CreateDepartmentRequestDto _self;
  final $Res Function(_CreateDepartmentRequestDto) _then;

/// Create a copy of CreateDepartmentRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? code = null,Object? unitType = null,Object? parentDepartmentId = freezed,Object? managerPartyId = freezed,}) {
  return _then(_CreateDepartmentRequestDto(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,unitType: null == unitType ? _self.unitType : unitType // ignore: cast_nullable_to_non_nullable
as String,parentDepartmentId: freezed == parentDepartmentId ? _self.parentDepartmentId : parentDepartmentId // ignore: cast_nullable_to_non_nullable
as String?,managerPartyId: freezed == managerPartyId ? _self.managerPartyId : managerPartyId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
