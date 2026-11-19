// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'party_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PersonProfileDto {

 String? get id;@JsonKey(name: 'party_id') String? get partyId;@JsonKey(name: 'first_name') String? get firstName;@JsonKey(name: 'middle_name') String? get middleName;@JsonKey(name: 'last_name') String? get lastName;@JsonKey(name: 'second_last_name') String? get secondLastName;@JsonKey(name: 'birth_date') String? get birthDate;@JsonKey(name: 'created_at') String? get createdAt;@JsonKey(name: 'updated_at') String? get updatedAt;
/// Create a copy of PersonProfileDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PersonProfileDtoCopyWith<PersonProfileDto> get copyWith => _$PersonProfileDtoCopyWithImpl<PersonProfileDto>(this as PersonProfileDto, _$identity);

  /// Serializes this PersonProfileDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as PersonProfileDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PersonProfileDto&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.partyId, _this.partyId) || other.partyId == _this.partyId)&&(identical(other.firstName, _this.firstName) || other.firstName == _this.firstName)&&(identical(other.middleName, _this.middleName) || other.middleName == _this.middleName)&&(identical(other.lastName, _this.lastName) || other.lastName == _this.lastName)&&(identical(other.secondLastName, _this.secondLastName) || other.secondLastName == _this.secondLastName)&&(identical(other.birthDate, _this.birthDate) || other.birthDate == _this.birthDate)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PersonProfileDto;
  return Object.hash(runtimeType,_this.id,_this.partyId,_this.firstName,_this.middleName,_this.lastName,_this.secondLastName,_this.birthDate,_this.createdAt,_this.updatedAt);
}

@override
String toString() {
  final _this = this as PersonProfileDto;
  return 'PersonProfileDto(id: ${_this.id}, partyId: ${_this.partyId}, firstName: ${_this.firstName}, middleName: ${_this.middleName}, lastName: ${_this.lastName}, secondLastName: ${_this.secondLastName}, birthDate: ${_this.birthDate}, createdAt: ${_this.createdAt}, updatedAt: ${_this.updatedAt})';
}


}

/// @nodoc
abstract mixin class $PersonProfileDtoCopyWith<$Res>  {
  factory $PersonProfileDtoCopyWith(PersonProfileDto value, $Res Function(PersonProfileDto) _then) = _$PersonProfileDtoCopyWithImpl;
@useResult
$Res call({
 String? id,@JsonKey(name: 'party_id') String? partyId,@JsonKey(name: 'first_name') String? firstName,@JsonKey(name: 'middle_name') String? middleName,@JsonKey(name: 'last_name') String? lastName,@JsonKey(name: 'second_last_name') String? secondLastName,@JsonKey(name: 'birth_date') String? birthDate,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt
});




}
/// @nodoc
class _$PersonProfileDtoCopyWithImpl<$Res>
    implements $PersonProfileDtoCopyWith<$Res> {
  _$PersonProfileDtoCopyWithImpl(this._self, this._then);

  final PersonProfileDto _self;
  final $Res Function(PersonProfileDto) _then;

/// Create a copy of PersonProfileDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? partyId = freezed,Object? firstName = freezed,Object? middleName = freezed,Object? lastName = freezed,Object? secondLastName = freezed,Object? birthDate = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(PersonProfileDto(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,partyId: freezed == partyId ? _self.partyId : partyId // ignore: cast_nullable_to_non_nullable
as String?,firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,middleName: freezed == middleName ? _self.middleName : middleName // ignore: cast_nullable_to_non_nullable
as String?,lastName: freezed == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String?,secondLastName: freezed == secondLastName ? _self.secondLastName : secondLastName // ignore: cast_nullable_to_non_nullable
as String?,birthDate: freezed == birthDate ? _self.birthDate : birthDate // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PersonProfileDto].
extension PersonProfileDtoPatterns on PersonProfileDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PersonProfileDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PersonProfileDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PersonProfileDto value)  $default,){
final _that = this;
switch (_that) {
case _PersonProfileDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PersonProfileDto value)?  $default,){
final _that = this;
switch (_that) {
case _PersonProfileDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'party_id')  String? partyId, @JsonKey(name: 'first_name')  String? firstName, @JsonKey(name: 'middle_name')  String? middleName, @JsonKey(name: 'last_name')  String? lastName, @JsonKey(name: 'second_last_name')  String? secondLastName, @JsonKey(name: 'birth_date')  String? birthDate, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PersonProfileDto() when $default != null:
return $default(_that.id,_that.partyId,_that.firstName,_that.middleName,_that.lastName,_that.secondLastName,_that.birthDate,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'party_id')  String? partyId, @JsonKey(name: 'first_name')  String? firstName, @JsonKey(name: 'middle_name')  String? middleName, @JsonKey(name: 'last_name')  String? lastName, @JsonKey(name: 'second_last_name')  String? secondLastName, @JsonKey(name: 'birth_date')  String? birthDate, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _PersonProfileDto():
return $default(_that.id,_that.partyId,_that.firstName,_that.middleName,_that.lastName,_that.secondLastName,_that.birthDate,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id, @JsonKey(name: 'party_id')  String? partyId, @JsonKey(name: 'first_name')  String? firstName, @JsonKey(name: 'middle_name')  String? middleName, @JsonKey(name: 'last_name')  String? lastName, @JsonKey(name: 'second_last_name')  String? secondLastName, @JsonKey(name: 'birth_date')  String? birthDate, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _PersonProfileDto() when $default != null:
return $default(_that.id,_that.partyId,_that.firstName,_that.middleName,_that.lastName,_that.secondLastName,_that.birthDate,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PersonProfileDto implements PersonProfileDto {
  const _PersonProfileDto({this.id, @JsonKey(name: 'party_id') this.partyId, @JsonKey(name: 'first_name') this.firstName, @JsonKey(name: 'middle_name') this.middleName, @JsonKey(name: 'last_name') this.lastName, @JsonKey(name: 'second_last_name') this.secondLastName, @JsonKey(name: 'birth_date') this.birthDate, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt});
  factory _PersonProfileDto.fromJson(Map<String, dynamic> json) => _$PersonProfileDtoFromJson(json);

@override final  String? id;
@override@JsonKey(name: 'party_id') final  String? partyId;
@override@JsonKey(name: 'first_name') final  String? firstName;
@override@JsonKey(name: 'middle_name') final  String? middleName;
@override@JsonKey(name: 'last_name') final  String? lastName;
@override@JsonKey(name: 'second_last_name') final  String? secondLastName;
@override@JsonKey(name: 'birth_date') final  String? birthDate;
@override@JsonKey(name: 'created_at') final  String? createdAt;
@override@JsonKey(name: 'updated_at') final  String? updatedAt;

/// Create a copy of PersonProfileDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PersonProfileDtoCopyWith<_PersonProfileDto> get copyWith => __$PersonProfileDtoCopyWithImpl<_PersonProfileDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PersonProfileDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PersonProfileDto&&(identical(other.id, id) || other.id == id)&&(identical(other.partyId, partyId) || other.partyId == partyId)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.middleName, middleName) || other.middleName == middleName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.secondLastName, secondLastName) || other.secondLastName == secondLastName)&&(identical(other.birthDate, birthDate) || other.birthDate == birthDate)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,partyId,firstName,middleName,lastName,secondLastName,birthDate,createdAt,updatedAt);
}

@override
String toString() {
    return 'PersonProfileDto(id: $id, partyId: $partyId, firstName: $firstName, middleName: $middleName, lastName: $lastName, secondLastName: $secondLastName, birthDate: $birthDate, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$PersonProfileDtoCopyWith<$Res> implements $PersonProfileDtoCopyWith<$Res> {
  factory _$PersonProfileDtoCopyWith(_PersonProfileDto value, $Res Function(_PersonProfileDto) _then) = __$PersonProfileDtoCopyWithImpl;
@override @useResult
$Res call({
 String? id,@JsonKey(name: 'party_id') String? partyId,@JsonKey(name: 'first_name') String? firstName,@JsonKey(name: 'middle_name') String? middleName,@JsonKey(name: 'last_name') String? lastName,@JsonKey(name: 'second_last_name') String? secondLastName,@JsonKey(name: 'birth_date') String? birthDate,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt
});




}
/// @nodoc
class __$PersonProfileDtoCopyWithImpl<$Res>
    implements _$PersonProfileDtoCopyWith<$Res> {
  __$PersonProfileDtoCopyWithImpl(this._self, this._then);

  final _PersonProfileDto _self;
  final $Res Function(_PersonProfileDto) _then;

/// Create a copy of PersonProfileDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? partyId = freezed,Object? firstName = freezed,Object? middleName = freezed,Object? lastName = freezed,Object? secondLastName = freezed,Object? birthDate = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_PersonProfileDto(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,partyId: freezed == partyId ? _self.partyId : partyId // ignore: cast_nullable_to_non_nullable
as String?,firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,middleName: freezed == middleName ? _self.middleName : middleName // ignore: cast_nullable_to_non_nullable
as String?,lastName: freezed == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String?,secondLastName: freezed == secondLastName ? _self.secondLastName : secondLastName // ignore: cast_nullable_to_non_nullable
as String?,birthDate: freezed == birthDate ? _self.birthDate : birthDate // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$OrganizationProfileDto {

 String? get id;@JsonKey(name: 'party_id') String? get partyId;@JsonKey(name: 'legal_name') String? get legalName;@JsonKey(name: 'trade_name') String? get tradeName;@JsonKey(name: 'tax_id') String? get taxId;@JsonKey(name: 'created_at') String? get createdAt;@JsonKey(name: 'updated_at') String? get updatedAt;
/// Create a copy of OrganizationProfileDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrganizationProfileDtoCopyWith<OrganizationProfileDto> get copyWith => _$OrganizationProfileDtoCopyWithImpl<OrganizationProfileDto>(this as OrganizationProfileDto, _$identity);

  /// Serializes this OrganizationProfileDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as OrganizationProfileDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrganizationProfileDto&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.partyId, _this.partyId) || other.partyId == _this.partyId)&&(identical(other.legalName, _this.legalName) || other.legalName == _this.legalName)&&(identical(other.tradeName, _this.tradeName) || other.tradeName == _this.tradeName)&&(identical(other.taxId, _this.taxId) || other.taxId == _this.taxId)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as OrganizationProfileDto;
  return Object.hash(runtimeType,_this.id,_this.partyId,_this.legalName,_this.tradeName,_this.taxId,_this.createdAt,_this.updatedAt);
}

@override
String toString() {
  final _this = this as OrganizationProfileDto;
  return 'OrganizationProfileDto(id: ${_this.id}, partyId: ${_this.partyId}, legalName: ${_this.legalName}, tradeName: ${_this.tradeName}, taxId: ${_this.taxId}, createdAt: ${_this.createdAt}, updatedAt: ${_this.updatedAt})';
}


}

/// @nodoc
abstract mixin class $OrganizationProfileDtoCopyWith<$Res>  {
  factory $OrganizationProfileDtoCopyWith(OrganizationProfileDto value, $Res Function(OrganizationProfileDto) _then) = _$OrganizationProfileDtoCopyWithImpl;
@useResult
$Res call({
 String? id,@JsonKey(name: 'party_id') String? partyId,@JsonKey(name: 'legal_name') String? legalName,@JsonKey(name: 'trade_name') String? tradeName,@JsonKey(name: 'tax_id') String? taxId,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt
});




}
/// @nodoc
class _$OrganizationProfileDtoCopyWithImpl<$Res>
    implements $OrganizationProfileDtoCopyWith<$Res> {
  _$OrganizationProfileDtoCopyWithImpl(this._self, this._then);

  final OrganizationProfileDto _self;
  final $Res Function(OrganizationProfileDto) _then;

/// Create a copy of OrganizationProfileDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? partyId = freezed,Object? legalName = freezed,Object? tradeName = freezed,Object? taxId = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(OrganizationProfileDto(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,partyId: freezed == partyId ? _self.partyId : partyId // ignore: cast_nullable_to_non_nullable
as String?,legalName: freezed == legalName ? _self.legalName : legalName // ignore: cast_nullable_to_non_nullable
as String?,tradeName: freezed == tradeName ? _self.tradeName : tradeName // ignore: cast_nullable_to_non_nullable
as String?,taxId: freezed == taxId ? _self.taxId : taxId // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [OrganizationProfileDto].
extension OrganizationProfileDtoPatterns on OrganizationProfileDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrganizationProfileDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrganizationProfileDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrganizationProfileDto value)  $default,){
final _that = this;
switch (_that) {
case _OrganizationProfileDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrganizationProfileDto value)?  $default,){
final _that = this;
switch (_that) {
case _OrganizationProfileDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'party_id')  String? partyId, @JsonKey(name: 'legal_name')  String? legalName, @JsonKey(name: 'trade_name')  String? tradeName, @JsonKey(name: 'tax_id')  String? taxId, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrganizationProfileDto() when $default != null:
return $default(_that.id,_that.partyId,_that.legalName,_that.tradeName,_that.taxId,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'party_id')  String? partyId, @JsonKey(name: 'legal_name')  String? legalName, @JsonKey(name: 'trade_name')  String? tradeName, @JsonKey(name: 'tax_id')  String? taxId, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _OrganizationProfileDto():
return $default(_that.id,_that.partyId,_that.legalName,_that.tradeName,_that.taxId,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id, @JsonKey(name: 'party_id')  String? partyId, @JsonKey(name: 'legal_name')  String? legalName, @JsonKey(name: 'trade_name')  String? tradeName, @JsonKey(name: 'tax_id')  String? taxId, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _OrganizationProfileDto() when $default != null:
return $default(_that.id,_that.partyId,_that.legalName,_that.tradeName,_that.taxId,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrganizationProfileDto implements OrganizationProfileDto {
  const _OrganizationProfileDto({this.id, @JsonKey(name: 'party_id') this.partyId, @JsonKey(name: 'legal_name') this.legalName, @JsonKey(name: 'trade_name') this.tradeName, @JsonKey(name: 'tax_id') this.taxId, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt});
  factory _OrganizationProfileDto.fromJson(Map<String, dynamic> json) => _$OrganizationProfileDtoFromJson(json);

@override final  String? id;
@override@JsonKey(name: 'party_id') final  String? partyId;
@override@JsonKey(name: 'legal_name') final  String? legalName;
@override@JsonKey(name: 'trade_name') final  String? tradeName;
@override@JsonKey(name: 'tax_id') final  String? taxId;
@override@JsonKey(name: 'created_at') final  String? createdAt;
@override@JsonKey(name: 'updated_at') final  String? updatedAt;

/// Create a copy of OrganizationProfileDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrganizationProfileDtoCopyWith<_OrganizationProfileDto> get copyWith => __$OrganizationProfileDtoCopyWithImpl<_OrganizationProfileDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrganizationProfileDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrganizationProfileDto&&(identical(other.id, id) || other.id == id)&&(identical(other.partyId, partyId) || other.partyId == partyId)&&(identical(other.legalName, legalName) || other.legalName == legalName)&&(identical(other.tradeName, tradeName) || other.tradeName == tradeName)&&(identical(other.taxId, taxId) || other.taxId == taxId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,partyId,legalName,tradeName,taxId,createdAt,updatedAt);
}

@override
String toString() {
    return 'OrganizationProfileDto(id: $id, partyId: $partyId, legalName: $legalName, tradeName: $tradeName, taxId: $taxId, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$OrganizationProfileDtoCopyWith<$Res> implements $OrganizationProfileDtoCopyWith<$Res> {
  factory _$OrganizationProfileDtoCopyWith(_OrganizationProfileDto value, $Res Function(_OrganizationProfileDto) _then) = __$OrganizationProfileDtoCopyWithImpl;
@override @useResult
$Res call({
 String? id,@JsonKey(name: 'party_id') String? partyId,@JsonKey(name: 'legal_name') String? legalName,@JsonKey(name: 'trade_name') String? tradeName,@JsonKey(name: 'tax_id') String? taxId,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt
});




}
/// @nodoc
class __$OrganizationProfileDtoCopyWithImpl<$Res>
    implements _$OrganizationProfileDtoCopyWith<$Res> {
  __$OrganizationProfileDtoCopyWithImpl(this._self, this._then);

  final _OrganizationProfileDto _self;
  final $Res Function(_OrganizationProfileDto) _then;

/// Create a copy of OrganizationProfileDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? partyId = freezed,Object? legalName = freezed,Object? tradeName = freezed,Object? taxId = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_OrganizationProfileDto(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,partyId: freezed == partyId ? _self.partyId : partyId // ignore: cast_nullable_to_non_nullable
as String?,legalName: freezed == legalName ? _self.legalName : legalName // ignore: cast_nullable_to_non_nullable
as String?,tradeName: freezed == tradeName ? _self.tradeName : tradeName // ignore: cast_nullable_to_non_nullable
as String?,taxId: freezed == taxId ? _self.taxId : taxId // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$PartyDto {

 String? get id;@JsonKey(name: 'canonical_party_id') String? get canonicalPartyId;@JsonKey(name: 'display_name') String? get displayName;@JsonKey(name: 'party_type') String? get partyType;@JsonKey(name: 'record_status') String? get recordStatus;@JsonKey(name: 'tenant_id') String? get tenantId;@JsonKey(name: 'created_at') String? get createdAt;@JsonKey(name: 'updated_at') String? get updatedAt;@JsonKey(name: 'deleted_at') String? get deletedAt;@JsonKey(name: 'person_profile') PersonProfileDto? get personProfile;@JsonKey(name: 'organization_profile') OrganizationProfileDto? get organizationProfile;
/// Create a copy of PartyDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PartyDtoCopyWith<PartyDto> get copyWith => _$PartyDtoCopyWithImpl<PartyDto>(this as PartyDto, _$identity);

  /// Serializes this PartyDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as PartyDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PartyDto&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.canonicalPartyId, _this.canonicalPartyId) || other.canonicalPartyId == _this.canonicalPartyId)&&(identical(other.displayName, _this.displayName) || other.displayName == _this.displayName)&&(identical(other.partyType, _this.partyType) || other.partyType == _this.partyType)&&(identical(other.recordStatus, _this.recordStatus) || other.recordStatus == _this.recordStatus)&&(identical(other.tenantId, _this.tenantId) || other.tenantId == _this.tenantId)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt)&&(identical(other.deletedAt, _this.deletedAt) || other.deletedAt == _this.deletedAt)&&(identical(other.personProfile, _this.personProfile) || other.personProfile == _this.personProfile)&&(identical(other.organizationProfile, _this.organizationProfile) || other.organizationProfile == _this.organizationProfile));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PartyDto;
  return Object.hash(runtimeType,_this.id,_this.canonicalPartyId,_this.displayName,_this.partyType,_this.recordStatus,_this.tenantId,_this.createdAt,_this.updatedAt,_this.deletedAt,_this.personProfile,_this.organizationProfile);
}

@override
String toString() {
  final _this = this as PartyDto;
  return 'PartyDto(id: ${_this.id}, canonicalPartyId: ${_this.canonicalPartyId}, displayName: ${_this.displayName}, partyType: ${_this.partyType}, recordStatus: ${_this.recordStatus}, tenantId: ${_this.tenantId}, createdAt: ${_this.createdAt}, updatedAt: ${_this.updatedAt}, deletedAt: ${_this.deletedAt}, personProfile: ${_this.personProfile}, organizationProfile: ${_this.organizationProfile})';
}


}

/// @nodoc
abstract mixin class $PartyDtoCopyWith<$Res>  {
  factory $PartyDtoCopyWith(PartyDto value, $Res Function(PartyDto) _then) = _$PartyDtoCopyWithImpl;
@useResult
$Res call({
 String? id,@JsonKey(name: 'canonical_party_id') String? canonicalPartyId,@JsonKey(name: 'display_name') String? displayName,@JsonKey(name: 'party_type') String? partyType,@JsonKey(name: 'record_status') String? recordStatus,@JsonKey(name: 'tenant_id') String? tenantId,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt,@JsonKey(name: 'deleted_at') String? deletedAt,@JsonKey(name: 'person_profile') PersonProfileDto? personProfile,@JsonKey(name: 'organization_profile') OrganizationProfileDto? organizationProfile
});


$PersonProfileDtoCopyWith<$Res>? get personProfile;$OrganizationProfileDtoCopyWith<$Res>? get organizationProfile;

}
/// @nodoc
class _$PartyDtoCopyWithImpl<$Res>
    implements $PartyDtoCopyWith<$Res> {
  _$PartyDtoCopyWithImpl(this._self, this._then);

  final PartyDto _self;
  final $Res Function(PartyDto) _then;

/// Create a copy of PartyDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? canonicalPartyId = freezed,Object? displayName = freezed,Object? partyType = freezed,Object? recordStatus = freezed,Object? tenantId = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? deletedAt = freezed,Object? personProfile = freezed,Object? organizationProfile = freezed,}) {
  return _then(PartyDto(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,canonicalPartyId: freezed == canonicalPartyId ? _self.canonicalPartyId : canonicalPartyId // ignore: cast_nullable_to_non_nullable
as String?,displayName: freezed == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String?,partyType: freezed == partyType ? _self.partyType : partyType // ignore: cast_nullable_to_non_nullable
as String?,recordStatus: freezed == recordStatus ? _self.recordStatus : recordStatus // ignore: cast_nullable_to_non_nullable
as String?,tenantId: freezed == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as String?,personProfile: freezed == personProfile ? _self.personProfile : personProfile // ignore: cast_nullable_to_non_nullable
as PersonProfileDto?,organizationProfile: freezed == organizationProfile ? _self.organizationProfile : organizationProfile // ignore: cast_nullable_to_non_nullable
as OrganizationProfileDto?,
  ));
}
/// Create a copy of PartyDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PersonProfileDtoCopyWith<$Res>? get personProfile {
    if (_self.personProfile == null) {
    return null;
  }

  return $PersonProfileDtoCopyWith<$Res>(_self.personProfile!, (value) {
    return _then(_self.copyWith(personProfile: value));
  });
}/// Create a copy of PartyDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrganizationProfileDtoCopyWith<$Res>? get organizationProfile {
    if (_self.organizationProfile == null) {
    return null;
  }

  return $OrganizationProfileDtoCopyWith<$Res>(_self.organizationProfile!, (value) {
    return _then(_self.copyWith(organizationProfile: value));
  });
}
}


/// Adds pattern-matching-related methods to [PartyDto].
extension PartyDtoPatterns on PartyDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PartyDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PartyDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PartyDto value)  $default,){
final _that = this;
switch (_that) {
case _PartyDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PartyDto value)?  $default,){
final _that = this;
switch (_that) {
case _PartyDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'canonical_party_id')  String? canonicalPartyId, @JsonKey(name: 'display_name')  String? displayName, @JsonKey(name: 'party_type')  String? partyType, @JsonKey(name: 'record_status')  String? recordStatus, @JsonKey(name: 'tenant_id')  String? tenantId, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt, @JsonKey(name: 'deleted_at')  String? deletedAt, @JsonKey(name: 'person_profile')  PersonProfileDto? personProfile, @JsonKey(name: 'organization_profile')  OrganizationProfileDto? organizationProfile)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PartyDto() when $default != null:
return $default(_that.id,_that.canonicalPartyId,_that.displayName,_that.partyType,_that.recordStatus,_that.tenantId,_that.createdAt,_that.updatedAt,_that.deletedAt,_that.personProfile,_that.organizationProfile);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'canonical_party_id')  String? canonicalPartyId, @JsonKey(name: 'display_name')  String? displayName, @JsonKey(name: 'party_type')  String? partyType, @JsonKey(name: 'record_status')  String? recordStatus, @JsonKey(name: 'tenant_id')  String? tenantId, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt, @JsonKey(name: 'deleted_at')  String? deletedAt, @JsonKey(name: 'person_profile')  PersonProfileDto? personProfile, @JsonKey(name: 'organization_profile')  OrganizationProfileDto? organizationProfile)  $default,) {final _that = this;
switch (_that) {
case _PartyDto():
return $default(_that.id,_that.canonicalPartyId,_that.displayName,_that.partyType,_that.recordStatus,_that.tenantId,_that.createdAt,_that.updatedAt,_that.deletedAt,_that.personProfile,_that.organizationProfile);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id, @JsonKey(name: 'canonical_party_id')  String? canonicalPartyId, @JsonKey(name: 'display_name')  String? displayName, @JsonKey(name: 'party_type')  String? partyType, @JsonKey(name: 'record_status')  String? recordStatus, @JsonKey(name: 'tenant_id')  String? tenantId, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt, @JsonKey(name: 'deleted_at')  String? deletedAt, @JsonKey(name: 'person_profile')  PersonProfileDto? personProfile, @JsonKey(name: 'organization_profile')  OrganizationProfileDto? organizationProfile)?  $default,) {final _that = this;
switch (_that) {
case _PartyDto() when $default != null:
return $default(_that.id,_that.canonicalPartyId,_that.displayName,_that.partyType,_that.recordStatus,_that.tenantId,_that.createdAt,_that.updatedAt,_that.deletedAt,_that.personProfile,_that.organizationProfile);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PartyDto implements PartyDto {
  const _PartyDto({this.id, @JsonKey(name: 'canonical_party_id') this.canonicalPartyId, @JsonKey(name: 'display_name') this.displayName, @JsonKey(name: 'party_type') this.partyType, @JsonKey(name: 'record_status') this.recordStatus, @JsonKey(name: 'tenant_id') this.tenantId, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt, @JsonKey(name: 'deleted_at') this.deletedAt, @JsonKey(name: 'person_profile') this.personProfile, @JsonKey(name: 'organization_profile') this.organizationProfile});
  factory _PartyDto.fromJson(Map<String, dynamic> json) => _$PartyDtoFromJson(json);

@override final  String? id;
@override@JsonKey(name: 'canonical_party_id') final  String? canonicalPartyId;
@override@JsonKey(name: 'display_name') final  String? displayName;
@override@JsonKey(name: 'party_type') final  String? partyType;
@override@JsonKey(name: 'record_status') final  String? recordStatus;
@override@JsonKey(name: 'tenant_id') final  String? tenantId;
@override@JsonKey(name: 'created_at') final  String? createdAt;
@override@JsonKey(name: 'updated_at') final  String? updatedAt;
@override@JsonKey(name: 'deleted_at') final  String? deletedAt;
@override@JsonKey(name: 'person_profile') final  PersonProfileDto? personProfile;
@override@JsonKey(name: 'organization_profile') final  OrganizationProfileDto? organizationProfile;

/// Create a copy of PartyDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PartyDtoCopyWith<_PartyDto> get copyWith => __$PartyDtoCopyWithImpl<_PartyDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PartyDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PartyDto&&(identical(other.id, id) || other.id == id)&&(identical(other.canonicalPartyId, canonicalPartyId) || other.canonicalPartyId == canonicalPartyId)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.partyType, partyType) || other.partyType == partyType)&&(identical(other.recordStatus, recordStatus) || other.recordStatus == recordStatus)&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.personProfile, personProfile) || other.personProfile == personProfile)&&(identical(other.organizationProfile, organizationProfile) || other.organizationProfile == organizationProfile));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,canonicalPartyId,displayName,partyType,recordStatus,tenantId,createdAt,updatedAt,deletedAt,personProfile,organizationProfile);
}

@override
String toString() {
    return 'PartyDto(id: $id, canonicalPartyId: $canonicalPartyId, displayName: $displayName, partyType: $partyType, recordStatus: $recordStatus, tenantId: $tenantId, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, personProfile: $personProfile, organizationProfile: $organizationProfile)';
}


}

/// @nodoc
abstract mixin class _$PartyDtoCopyWith<$Res> implements $PartyDtoCopyWith<$Res> {
  factory _$PartyDtoCopyWith(_PartyDto value, $Res Function(_PartyDto) _then) = __$PartyDtoCopyWithImpl;
@override @useResult
$Res call({
 String? id,@JsonKey(name: 'canonical_party_id') String? canonicalPartyId,@JsonKey(name: 'display_name') String? displayName,@JsonKey(name: 'party_type') String? partyType,@JsonKey(name: 'record_status') String? recordStatus,@JsonKey(name: 'tenant_id') String? tenantId,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt,@JsonKey(name: 'deleted_at') String? deletedAt,@JsonKey(name: 'person_profile') PersonProfileDto? personProfile,@JsonKey(name: 'organization_profile') OrganizationProfileDto? organizationProfile
});


@override $PersonProfileDtoCopyWith<$Res>? get personProfile;@override $OrganizationProfileDtoCopyWith<$Res>? get organizationProfile;

}
/// @nodoc
class __$PartyDtoCopyWithImpl<$Res>
    implements _$PartyDtoCopyWith<$Res> {
  __$PartyDtoCopyWithImpl(this._self, this._then);

  final _PartyDto _self;
  final $Res Function(_PartyDto) _then;

/// Create a copy of PartyDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? canonicalPartyId = freezed,Object? displayName = freezed,Object? partyType = freezed,Object? recordStatus = freezed,Object? tenantId = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? deletedAt = freezed,Object? personProfile = freezed,Object? organizationProfile = freezed,}) {
  return _then(_PartyDto(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,canonicalPartyId: freezed == canonicalPartyId ? _self.canonicalPartyId : canonicalPartyId // ignore: cast_nullable_to_non_nullable
as String?,displayName: freezed == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String?,partyType: freezed == partyType ? _self.partyType : partyType // ignore: cast_nullable_to_non_nullable
as String?,recordStatus: freezed == recordStatus ? _self.recordStatus : recordStatus // ignore: cast_nullable_to_non_nullable
as String?,tenantId: freezed == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as String?,personProfile: freezed == personProfile ? _self.personProfile : personProfile // ignore: cast_nullable_to_non_nullable
as PersonProfileDto?,organizationProfile: freezed == organizationProfile ? _self.organizationProfile : organizationProfile // ignore: cast_nullable_to_non_nullable
as OrganizationProfileDto?,
  ));
}

/// Create a copy of PartyDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PersonProfileDtoCopyWith<$Res>? get personProfile {
    if (_self.personProfile == null) {
    return null;
  }

  return $PersonProfileDtoCopyWith<$Res>(_self.personProfile!, (value) {
    return _then(_self.copyWith(personProfile: value));
  });
}/// Create a copy of PartyDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrganizationProfileDtoCopyWith<$Res>? get organizationProfile {
    if (_self.organizationProfile == null) {
    return null;
  }

  return $OrganizationProfileDtoCopyWith<$Res>(_self.organizationProfile!, (value) {
    return _then(_self.copyWith(organizationProfile: value));
  });
}
}


/// @nodoc
mixin _$CreatePersonProfileDto {

@JsonKey(name: 'first_name', includeIfNull: false) String? get firstName;@JsonKey(name: 'middle_name', includeIfNull: false) String? get middleName;@JsonKey(name: 'last_name', includeIfNull: false) String? get lastName;@JsonKey(name: 'second_last_name', includeIfNull: false) String? get secondLastName;@JsonKey(name: 'birth_date', includeIfNull: false) String? get birthDate;
/// Create a copy of CreatePersonProfileDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreatePersonProfileDtoCopyWith<CreatePersonProfileDto> get copyWith => _$CreatePersonProfileDtoCopyWithImpl<CreatePersonProfileDto>(this as CreatePersonProfileDto, _$identity);

  /// Serializes this CreatePersonProfileDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as CreatePersonProfileDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreatePersonProfileDto&&(identical(other.firstName, _this.firstName) || other.firstName == _this.firstName)&&(identical(other.middleName, _this.middleName) || other.middleName == _this.middleName)&&(identical(other.lastName, _this.lastName) || other.lastName == _this.lastName)&&(identical(other.secondLastName, _this.secondLastName) || other.secondLastName == _this.secondLastName)&&(identical(other.birthDate, _this.birthDate) || other.birthDate == _this.birthDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as CreatePersonProfileDto;
  return Object.hash(runtimeType,_this.firstName,_this.middleName,_this.lastName,_this.secondLastName,_this.birthDate);
}

@override
String toString() {
  final _this = this as CreatePersonProfileDto;
  return 'CreatePersonProfileDto(firstName: ${_this.firstName}, middleName: ${_this.middleName}, lastName: ${_this.lastName}, secondLastName: ${_this.secondLastName}, birthDate: ${_this.birthDate})';
}


}

/// @nodoc
abstract mixin class $CreatePersonProfileDtoCopyWith<$Res>  {
  factory $CreatePersonProfileDtoCopyWith(CreatePersonProfileDto value, $Res Function(CreatePersonProfileDto) _then) = _$CreatePersonProfileDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'first_name', includeIfNull: false) String? firstName,@JsonKey(name: 'middle_name', includeIfNull: false) String? middleName,@JsonKey(name: 'last_name', includeIfNull: false) String? lastName,@JsonKey(name: 'second_last_name', includeIfNull: false) String? secondLastName,@JsonKey(name: 'birth_date', includeIfNull: false) String? birthDate
});




}
/// @nodoc
class _$CreatePersonProfileDtoCopyWithImpl<$Res>
    implements $CreatePersonProfileDtoCopyWith<$Res> {
  _$CreatePersonProfileDtoCopyWithImpl(this._self, this._then);

  final CreatePersonProfileDto _self;
  final $Res Function(CreatePersonProfileDto) _then;

/// Create a copy of CreatePersonProfileDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? firstName = freezed,Object? middleName = freezed,Object? lastName = freezed,Object? secondLastName = freezed,Object? birthDate = freezed,}) {
  return _then(CreatePersonProfileDto(
firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,middleName: freezed == middleName ? _self.middleName : middleName // ignore: cast_nullable_to_non_nullable
as String?,lastName: freezed == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String?,secondLastName: freezed == secondLastName ? _self.secondLastName : secondLastName // ignore: cast_nullable_to_non_nullable
as String?,birthDate: freezed == birthDate ? _self.birthDate : birthDate // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CreatePersonProfileDto].
extension CreatePersonProfileDtoPatterns on CreatePersonProfileDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreatePersonProfileDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreatePersonProfileDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreatePersonProfileDto value)  $default,){
final _that = this;
switch (_that) {
case _CreatePersonProfileDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreatePersonProfileDto value)?  $default,){
final _that = this;
switch (_that) {
case _CreatePersonProfileDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'first_name', includeIfNull: false)  String? firstName, @JsonKey(name: 'middle_name', includeIfNull: false)  String? middleName, @JsonKey(name: 'last_name', includeIfNull: false)  String? lastName, @JsonKey(name: 'second_last_name', includeIfNull: false)  String? secondLastName, @JsonKey(name: 'birth_date', includeIfNull: false)  String? birthDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreatePersonProfileDto() when $default != null:
return $default(_that.firstName,_that.middleName,_that.lastName,_that.secondLastName,_that.birthDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'first_name', includeIfNull: false)  String? firstName, @JsonKey(name: 'middle_name', includeIfNull: false)  String? middleName, @JsonKey(name: 'last_name', includeIfNull: false)  String? lastName, @JsonKey(name: 'second_last_name', includeIfNull: false)  String? secondLastName, @JsonKey(name: 'birth_date', includeIfNull: false)  String? birthDate)  $default,) {final _that = this;
switch (_that) {
case _CreatePersonProfileDto():
return $default(_that.firstName,_that.middleName,_that.lastName,_that.secondLastName,_that.birthDate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'first_name', includeIfNull: false)  String? firstName, @JsonKey(name: 'middle_name', includeIfNull: false)  String? middleName, @JsonKey(name: 'last_name', includeIfNull: false)  String? lastName, @JsonKey(name: 'second_last_name', includeIfNull: false)  String? secondLastName, @JsonKey(name: 'birth_date', includeIfNull: false)  String? birthDate)?  $default,) {final _that = this;
switch (_that) {
case _CreatePersonProfileDto() when $default != null:
return $default(_that.firstName,_that.middleName,_that.lastName,_that.secondLastName,_that.birthDate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreatePersonProfileDto implements CreatePersonProfileDto {
  const _CreatePersonProfileDto({@JsonKey(name: 'first_name', includeIfNull: false) this.firstName, @JsonKey(name: 'middle_name', includeIfNull: false) this.middleName, @JsonKey(name: 'last_name', includeIfNull: false) this.lastName, @JsonKey(name: 'second_last_name', includeIfNull: false) this.secondLastName, @JsonKey(name: 'birth_date', includeIfNull: false) this.birthDate});
  factory _CreatePersonProfileDto.fromJson(Map<String, dynamic> json) => _$CreatePersonProfileDtoFromJson(json);

@override@JsonKey(name: 'first_name', includeIfNull: false) final  String? firstName;
@override@JsonKey(name: 'middle_name', includeIfNull: false) final  String? middleName;
@override@JsonKey(name: 'last_name', includeIfNull: false) final  String? lastName;
@override@JsonKey(name: 'second_last_name', includeIfNull: false) final  String? secondLastName;
@override@JsonKey(name: 'birth_date', includeIfNull: false) final  String? birthDate;

/// Create a copy of CreatePersonProfileDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreatePersonProfileDtoCopyWith<_CreatePersonProfileDto> get copyWith => __$CreatePersonProfileDtoCopyWithImpl<_CreatePersonProfileDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreatePersonProfileDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreatePersonProfileDto&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.middleName, middleName) || other.middleName == middleName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.secondLastName, secondLastName) || other.secondLastName == secondLastName)&&(identical(other.birthDate, birthDate) || other.birthDate == birthDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,firstName,middleName,lastName,secondLastName,birthDate);
}

@override
String toString() {
    return 'CreatePersonProfileDto(firstName: $firstName, middleName: $middleName, lastName: $lastName, secondLastName: $secondLastName, birthDate: $birthDate)';
}


}

/// @nodoc
abstract mixin class _$CreatePersonProfileDtoCopyWith<$Res> implements $CreatePersonProfileDtoCopyWith<$Res> {
  factory _$CreatePersonProfileDtoCopyWith(_CreatePersonProfileDto value, $Res Function(_CreatePersonProfileDto) _then) = __$CreatePersonProfileDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'first_name', includeIfNull: false) String? firstName,@JsonKey(name: 'middle_name', includeIfNull: false) String? middleName,@JsonKey(name: 'last_name', includeIfNull: false) String? lastName,@JsonKey(name: 'second_last_name', includeIfNull: false) String? secondLastName,@JsonKey(name: 'birth_date', includeIfNull: false) String? birthDate
});




}
/// @nodoc
class __$CreatePersonProfileDtoCopyWithImpl<$Res>
    implements _$CreatePersonProfileDtoCopyWith<$Res> {
  __$CreatePersonProfileDtoCopyWithImpl(this._self, this._then);

  final _CreatePersonProfileDto _self;
  final $Res Function(_CreatePersonProfileDto) _then;

/// Create a copy of CreatePersonProfileDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? firstName = freezed,Object? middleName = freezed,Object? lastName = freezed,Object? secondLastName = freezed,Object? birthDate = freezed,}) {
  return _then(_CreatePersonProfileDto(
firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,middleName: freezed == middleName ? _self.middleName : middleName // ignore: cast_nullable_to_non_nullable
as String?,lastName: freezed == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String?,secondLastName: freezed == secondLastName ? _self.secondLastName : secondLastName // ignore: cast_nullable_to_non_nullable
as String?,birthDate: freezed == birthDate ? _self.birthDate : birthDate // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$CreateOrganizationProfileDto {

@JsonKey(name: 'legal_name', includeIfNull: false) String? get legalName;@JsonKey(name: 'trade_name', includeIfNull: false) String? get tradeName;@JsonKey(name: 'tax_id', includeIfNull: false) String? get taxId;
/// Create a copy of CreateOrganizationProfileDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateOrganizationProfileDtoCopyWith<CreateOrganizationProfileDto> get copyWith => _$CreateOrganizationProfileDtoCopyWithImpl<CreateOrganizationProfileDto>(this as CreateOrganizationProfileDto, _$identity);

  /// Serializes this CreateOrganizationProfileDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as CreateOrganizationProfileDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateOrganizationProfileDto&&(identical(other.legalName, _this.legalName) || other.legalName == _this.legalName)&&(identical(other.tradeName, _this.tradeName) || other.tradeName == _this.tradeName)&&(identical(other.taxId, _this.taxId) || other.taxId == _this.taxId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as CreateOrganizationProfileDto;
  return Object.hash(runtimeType,_this.legalName,_this.tradeName,_this.taxId);
}

@override
String toString() {
  final _this = this as CreateOrganizationProfileDto;
  return 'CreateOrganizationProfileDto(legalName: ${_this.legalName}, tradeName: ${_this.tradeName}, taxId: ${_this.taxId})';
}


}

/// @nodoc
abstract mixin class $CreateOrganizationProfileDtoCopyWith<$Res>  {
  factory $CreateOrganizationProfileDtoCopyWith(CreateOrganizationProfileDto value, $Res Function(CreateOrganizationProfileDto) _then) = _$CreateOrganizationProfileDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'legal_name', includeIfNull: false) String? legalName,@JsonKey(name: 'trade_name', includeIfNull: false) String? tradeName,@JsonKey(name: 'tax_id', includeIfNull: false) String? taxId
});




}
/// @nodoc
class _$CreateOrganizationProfileDtoCopyWithImpl<$Res>
    implements $CreateOrganizationProfileDtoCopyWith<$Res> {
  _$CreateOrganizationProfileDtoCopyWithImpl(this._self, this._then);

  final CreateOrganizationProfileDto _self;
  final $Res Function(CreateOrganizationProfileDto) _then;

/// Create a copy of CreateOrganizationProfileDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? legalName = freezed,Object? tradeName = freezed,Object? taxId = freezed,}) {
  return _then(CreateOrganizationProfileDto(
legalName: freezed == legalName ? _self.legalName : legalName // ignore: cast_nullable_to_non_nullable
as String?,tradeName: freezed == tradeName ? _self.tradeName : tradeName // ignore: cast_nullable_to_non_nullable
as String?,taxId: freezed == taxId ? _self.taxId : taxId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateOrganizationProfileDto].
extension CreateOrganizationProfileDtoPatterns on CreateOrganizationProfileDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateOrganizationProfileDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateOrganizationProfileDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateOrganizationProfileDto value)  $default,){
final _that = this;
switch (_that) {
case _CreateOrganizationProfileDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateOrganizationProfileDto value)?  $default,){
final _that = this;
switch (_that) {
case _CreateOrganizationProfileDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'legal_name', includeIfNull: false)  String? legalName, @JsonKey(name: 'trade_name', includeIfNull: false)  String? tradeName, @JsonKey(name: 'tax_id', includeIfNull: false)  String? taxId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateOrganizationProfileDto() when $default != null:
return $default(_that.legalName,_that.tradeName,_that.taxId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'legal_name', includeIfNull: false)  String? legalName, @JsonKey(name: 'trade_name', includeIfNull: false)  String? tradeName, @JsonKey(name: 'tax_id', includeIfNull: false)  String? taxId)  $default,) {final _that = this;
switch (_that) {
case _CreateOrganizationProfileDto():
return $default(_that.legalName,_that.tradeName,_that.taxId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'legal_name', includeIfNull: false)  String? legalName, @JsonKey(name: 'trade_name', includeIfNull: false)  String? tradeName, @JsonKey(name: 'tax_id', includeIfNull: false)  String? taxId)?  $default,) {final _that = this;
switch (_that) {
case _CreateOrganizationProfileDto() when $default != null:
return $default(_that.legalName,_that.tradeName,_that.taxId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateOrganizationProfileDto implements CreateOrganizationProfileDto {
  const _CreateOrganizationProfileDto({@JsonKey(name: 'legal_name', includeIfNull: false) this.legalName, @JsonKey(name: 'trade_name', includeIfNull: false) this.tradeName, @JsonKey(name: 'tax_id', includeIfNull: false) this.taxId});
  factory _CreateOrganizationProfileDto.fromJson(Map<String, dynamic> json) => _$CreateOrganizationProfileDtoFromJson(json);

@override@JsonKey(name: 'legal_name', includeIfNull: false) final  String? legalName;
@override@JsonKey(name: 'trade_name', includeIfNull: false) final  String? tradeName;
@override@JsonKey(name: 'tax_id', includeIfNull: false) final  String? taxId;

/// Create a copy of CreateOrganizationProfileDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateOrganizationProfileDtoCopyWith<_CreateOrganizationProfileDto> get copyWith => __$CreateOrganizationProfileDtoCopyWithImpl<_CreateOrganizationProfileDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateOrganizationProfileDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateOrganizationProfileDto&&(identical(other.legalName, legalName) || other.legalName == legalName)&&(identical(other.tradeName, tradeName) || other.tradeName == tradeName)&&(identical(other.taxId, taxId) || other.taxId == taxId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,legalName,tradeName,taxId);
}

@override
String toString() {
    return 'CreateOrganizationProfileDto(legalName: $legalName, tradeName: $tradeName, taxId: $taxId)';
}


}

/// @nodoc
abstract mixin class _$CreateOrganizationProfileDtoCopyWith<$Res> implements $CreateOrganizationProfileDtoCopyWith<$Res> {
  factory _$CreateOrganizationProfileDtoCopyWith(_CreateOrganizationProfileDto value, $Res Function(_CreateOrganizationProfileDto) _then) = __$CreateOrganizationProfileDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'legal_name', includeIfNull: false) String? legalName,@JsonKey(name: 'trade_name', includeIfNull: false) String? tradeName,@JsonKey(name: 'tax_id', includeIfNull: false) String? taxId
});




}
/// @nodoc
class __$CreateOrganizationProfileDtoCopyWithImpl<$Res>
    implements _$CreateOrganizationProfileDtoCopyWith<$Res> {
  __$CreateOrganizationProfileDtoCopyWithImpl(this._self, this._then);

  final _CreateOrganizationProfileDto _self;
  final $Res Function(_CreateOrganizationProfileDto) _then;

/// Create a copy of CreateOrganizationProfileDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? legalName = freezed,Object? tradeName = freezed,Object? taxId = freezed,}) {
  return _then(_CreateOrganizationProfileDto(
legalName: freezed == legalName ? _self.legalName : legalName // ignore: cast_nullable_to_non_nullable
as String?,tradeName: freezed == tradeName ? _self.tradeName : tradeName // ignore: cast_nullable_to_non_nullable
as String?,taxId: freezed == taxId ? _self.taxId : taxId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$CreatePartyRequestDto {

@JsonKey(name: 'display_name') String get displayName;@JsonKey(name: 'party_type') String get partyType;@JsonKey(name: 'person_profile', includeIfNull: false) CreatePersonProfileDto? get personProfile;@JsonKey(name: 'organization_profile', includeIfNull: false) CreateOrganizationProfileDto? get organizationProfile;
/// Create a copy of CreatePartyRequestDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreatePartyRequestDtoCopyWith<CreatePartyRequestDto> get copyWith => _$CreatePartyRequestDtoCopyWithImpl<CreatePartyRequestDto>(this as CreatePartyRequestDto, _$identity);

  /// Serializes this CreatePartyRequestDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as CreatePartyRequestDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreatePartyRequestDto&&(identical(other.displayName, _this.displayName) || other.displayName == _this.displayName)&&(identical(other.partyType, _this.partyType) || other.partyType == _this.partyType)&&(identical(other.personProfile, _this.personProfile) || other.personProfile == _this.personProfile)&&(identical(other.organizationProfile, _this.organizationProfile) || other.organizationProfile == _this.organizationProfile));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as CreatePartyRequestDto;
  return Object.hash(runtimeType,_this.displayName,_this.partyType,_this.personProfile,_this.organizationProfile);
}

@override
String toString() {
  final _this = this as CreatePartyRequestDto;
  return 'CreatePartyRequestDto(displayName: ${_this.displayName}, partyType: ${_this.partyType}, personProfile: ${_this.personProfile}, organizationProfile: ${_this.organizationProfile})';
}


}

/// @nodoc
abstract mixin class $CreatePartyRequestDtoCopyWith<$Res>  {
  factory $CreatePartyRequestDtoCopyWith(CreatePartyRequestDto value, $Res Function(CreatePartyRequestDto) _then) = _$CreatePartyRequestDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'display_name') String displayName,@JsonKey(name: 'party_type') String partyType,@JsonKey(name: 'person_profile', includeIfNull: false) CreatePersonProfileDto? personProfile,@JsonKey(name: 'organization_profile', includeIfNull: false) CreateOrganizationProfileDto? organizationProfile
});


$CreatePersonProfileDtoCopyWith<$Res>? get personProfile;$CreateOrganizationProfileDtoCopyWith<$Res>? get organizationProfile;

}
/// @nodoc
class _$CreatePartyRequestDtoCopyWithImpl<$Res>
    implements $CreatePartyRequestDtoCopyWith<$Res> {
  _$CreatePartyRequestDtoCopyWithImpl(this._self, this._then);

  final CreatePartyRequestDto _self;
  final $Res Function(CreatePartyRequestDto) _then;

/// Create a copy of CreatePartyRequestDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? displayName = null,Object? partyType = null,Object? personProfile = freezed,Object? organizationProfile = freezed,}) {
  return _then(CreatePartyRequestDto(
displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,partyType: null == partyType ? _self.partyType : partyType // ignore: cast_nullable_to_non_nullable
as String,personProfile: freezed == personProfile ? _self.personProfile : personProfile // ignore: cast_nullable_to_non_nullable
as CreatePersonProfileDto?,organizationProfile: freezed == organizationProfile ? _self.organizationProfile : organizationProfile // ignore: cast_nullable_to_non_nullable
as CreateOrganizationProfileDto?,
  ));
}
/// Create a copy of CreatePartyRequestDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CreatePersonProfileDtoCopyWith<$Res>? get personProfile {
    if (_self.personProfile == null) {
    return null;
  }

  return $CreatePersonProfileDtoCopyWith<$Res>(_self.personProfile!, (value) {
    return _then(_self.copyWith(personProfile: value));
  });
}/// Create a copy of CreatePartyRequestDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CreateOrganizationProfileDtoCopyWith<$Res>? get organizationProfile {
    if (_self.organizationProfile == null) {
    return null;
  }

  return $CreateOrganizationProfileDtoCopyWith<$Res>(_self.organizationProfile!, (value) {
    return _then(_self.copyWith(organizationProfile: value));
  });
}
}


/// Adds pattern-matching-related methods to [CreatePartyRequestDto].
extension CreatePartyRequestDtoPatterns on CreatePartyRequestDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreatePartyRequestDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreatePartyRequestDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreatePartyRequestDto value)  $default,){
final _that = this;
switch (_that) {
case _CreatePartyRequestDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreatePartyRequestDto value)?  $default,){
final _that = this;
switch (_that) {
case _CreatePartyRequestDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'display_name')  String displayName, @JsonKey(name: 'party_type')  String partyType, @JsonKey(name: 'person_profile', includeIfNull: false)  CreatePersonProfileDto? personProfile, @JsonKey(name: 'organization_profile', includeIfNull: false)  CreateOrganizationProfileDto? organizationProfile)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreatePartyRequestDto() when $default != null:
return $default(_that.displayName,_that.partyType,_that.personProfile,_that.organizationProfile);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'display_name')  String displayName, @JsonKey(name: 'party_type')  String partyType, @JsonKey(name: 'person_profile', includeIfNull: false)  CreatePersonProfileDto? personProfile, @JsonKey(name: 'organization_profile', includeIfNull: false)  CreateOrganizationProfileDto? organizationProfile)  $default,) {final _that = this;
switch (_that) {
case _CreatePartyRequestDto():
return $default(_that.displayName,_that.partyType,_that.personProfile,_that.organizationProfile);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'display_name')  String displayName, @JsonKey(name: 'party_type')  String partyType, @JsonKey(name: 'person_profile', includeIfNull: false)  CreatePersonProfileDto? personProfile, @JsonKey(name: 'organization_profile', includeIfNull: false)  CreateOrganizationProfileDto? organizationProfile)?  $default,) {final _that = this;
switch (_that) {
case _CreatePartyRequestDto() when $default != null:
return $default(_that.displayName,_that.partyType,_that.personProfile,_that.organizationProfile);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreatePartyRequestDto implements CreatePartyRequestDto {
  const _CreatePartyRequestDto({@JsonKey(name: 'display_name') required this.displayName, @JsonKey(name: 'party_type') required this.partyType, @JsonKey(name: 'person_profile', includeIfNull: false) this.personProfile, @JsonKey(name: 'organization_profile', includeIfNull: false) this.organizationProfile});
  factory _CreatePartyRequestDto.fromJson(Map<String, dynamic> json) => _$CreatePartyRequestDtoFromJson(json);

@override@JsonKey(name: 'display_name') final  String displayName;
@override@JsonKey(name: 'party_type') final  String partyType;
@override@JsonKey(name: 'person_profile', includeIfNull: false) final  CreatePersonProfileDto? personProfile;
@override@JsonKey(name: 'organization_profile', includeIfNull: false) final  CreateOrganizationProfileDto? organizationProfile;

/// Create a copy of CreatePartyRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreatePartyRequestDtoCopyWith<_CreatePartyRequestDto> get copyWith => __$CreatePartyRequestDtoCopyWithImpl<_CreatePartyRequestDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreatePartyRequestDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreatePartyRequestDto&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.partyType, partyType) || other.partyType == partyType)&&(identical(other.personProfile, personProfile) || other.personProfile == personProfile)&&(identical(other.organizationProfile, organizationProfile) || other.organizationProfile == organizationProfile));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,displayName,partyType,personProfile,organizationProfile);
}

@override
String toString() {
    return 'CreatePartyRequestDto(displayName: $displayName, partyType: $partyType, personProfile: $personProfile, organizationProfile: $organizationProfile)';
}


}

/// @nodoc
abstract mixin class _$CreatePartyRequestDtoCopyWith<$Res> implements $CreatePartyRequestDtoCopyWith<$Res> {
  factory _$CreatePartyRequestDtoCopyWith(_CreatePartyRequestDto value, $Res Function(_CreatePartyRequestDto) _then) = __$CreatePartyRequestDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'display_name') String displayName,@JsonKey(name: 'party_type') String partyType,@JsonKey(name: 'person_profile', includeIfNull: false) CreatePersonProfileDto? personProfile,@JsonKey(name: 'organization_profile', includeIfNull: false) CreateOrganizationProfileDto? organizationProfile
});


@override $CreatePersonProfileDtoCopyWith<$Res>? get personProfile;@override $CreateOrganizationProfileDtoCopyWith<$Res>? get organizationProfile;

}
/// @nodoc
class __$CreatePartyRequestDtoCopyWithImpl<$Res>
    implements _$CreatePartyRequestDtoCopyWith<$Res> {
  __$CreatePartyRequestDtoCopyWithImpl(this._self, this._then);

  final _CreatePartyRequestDto _self;
  final $Res Function(_CreatePartyRequestDto) _then;

/// Create a copy of CreatePartyRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? displayName = null,Object? partyType = null,Object? personProfile = freezed,Object? organizationProfile = freezed,}) {
  return _then(_CreatePartyRequestDto(
displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,partyType: null == partyType ? _self.partyType : partyType // ignore: cast_nullable_to_non_nullable
as String,personProfile: freezed == personProfile ? _self.personProfile : personProfile // ignore: cast_nullable_to_non_nullable
as CreatePersonProfileDto?,organizationProfile: freezed == organizationProfile ? _self.organizationProfile : organizationProfile // ignore: cast_nullable_to_non_nullable
as CreateOrganizationProfileDto?,
  ));
}

/// Create a copy of CreatePartyRequestDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CreatePersonProfileDtoCopyWith<$Res>? get personProfile {
    if (_self.personProfile == null) {
    return null;
  }

  return $CreatePersonProfileDtoCopyWith<$Res>(_self.personProfile!, (value) {
    return _then(_self.copyWith(personProfile: value));
  });
}/// Create a copy of CreatePartyRequestDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CreateOrganizationProfileDtoCopyWith<$Res>? get organizationProfile {
    if (_self.organizationProfile == null) {
    return null;
  }

  return $CreateOrganizationProfileDtoCopyWith<$Res>(_self.organizationProfile!, (value) {
    return _then(_self.copyWith(organizationProfile: value));
  });
}
}

// dart format on
