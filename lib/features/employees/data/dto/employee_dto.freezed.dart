// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'employee_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EmployeeDto {

@JsonKey(name: 'party_id') String? get partyId;@JsonKey(name: 'employee_code') String? get employeeCode;@JsonKey(name: 'job_id') String? get jobId;@JsonKey(name: 'department_id') String? get departmentId;@JsonKey(name: 'manager_party_id') String? get managerPartyId;@JsonKey(name: 'hire_date') String? get hireDate; String? get status;@JsonKey(name: 'tenant_id') String? get tenantId;@JsonKey(name: 'created_at') String? get createdAt;@JsonKey(name: 'updated_at') String? get updatedAt;
/// Create a copy of EmployeeDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EmployeeDtoCopyWith<EmployeeDto> get copyWith => _$EmployeeDtoCopyWithImpl<EmployeeDto>(this as EmployeeDto, _$identity);

  /// Serializes this EmployeeDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as EmployeeDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EmployeeDto&&(identical(other.partyId, _this.partyId) || other.partyId == _this.partyId)&&(identical(other.employeeCode, _this.employeeCode) || other.employeeCode == _this.employeeCode)&&(identical(other.jobId, _this.jobId) || other.jobId == _this.jobId)&&(identical(other.departmentId, _this.departmentId) || other.departmentId == _this.departmentId)&&(identical(other.managerPartyId, _this.managerPartyId) || other.managerPartyId == _this.managerPartyId)&&(identical(other.hireDate, _this.hireDate) || other.hireDate == _this.hireDate)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.tenantId, _this.tenantId) || other.tenantId == _this.tenantId)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as EmployeeDto;
  return Object.hash(runtimeType,_this.partyId,_this.employeeCode,_this.jobId,_this.departmentId,_this.managerPartyId,_this.hireDate,_this.status,_this.tenantId,_this.createdAt,_this.updatedAt);
}

@override
String toString() {
  final _this = this as EmployeeDto;
  return 'EmployeeDto(partyId: ${_this.partyId}, employeeCode: ${_this.employeeCode}, jobId: ${_this.jobId}, departmentId: ${_this.departmentId}, managerPartyId: ${_this.managerPartyId}, hireDate: ${_this.hireDate}, status: ${_this.status}, tenantId: ${_this.tenantId}, createdAt: ${_this.createdAt}, updatedAt: ${_this.updatedAt})';
}


}

/// @nodoc
abstract mixin class $EmployeeDtoCopyWith<$Res>  {
  factory $EmployeeDtoCopyWith(EmployeeDto value, $Res Function(EmployeeDto) _then) = _$EmployeeDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'party_id') String? partyId,@JsonKey(name: 'employee_code') String? employeeCode,@JsonKey(name: 'job_id') String? jobId,@JsonKey(name: 'department_id') String? departmentId,@JsonKey(name: 'manager_party_id') String? managerPartyId,@JsonKey(name: 'hire_date') String? hireDate, String? status,@JsonKey(name: 'tenant_id') String? tenantId,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt
});




}
/// @nodoc
class _$EmployeeDtoCopyWithImpl<$Res>
    implements $EmployeeDtoCopyWith<$Res> {
  _$EmployeeDtoCopyWithImpl(this._self, this._then);

  final EmployeeDto _self;
  final $Res Function(EmployeeDto) _then;

/// Create a copy of EmployeeDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? partyId = freezed,Object? employeeCode = freezed,Object? jobId = freezed,Object? departmentId = freezed,Object? managerPartyId = freezed,Object? hireDate = freezed,Object? status = freezed,Object? tenantId = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(EmployeeDto(
partyId: freezed == partyId ? _self.partyId : partyId // ignore: cast_nullable_to_non_nullable
as String?,employeeCode: freezed == employeeCode ? _self.employeeCode : employeeCode // ignore: cast_nullable_to_non_nullable
as String?,jobId: freezed == jobId ? _self.jobId : jobId // ignore: cast_nullable_to_non_nullable
as String?,departmentId: freezed == departmentId ? _self.departmentId : departmentId // ignore: cast_nullable_to_non_nullable
as String?,managerPartyId: freezed == managerPartyId ? _self.managerPartyId : managerPartyId // ignore: cast_nullable_to_non_nullable
as String?,hireDate: freezed == hireDate ? _self.hireDate : hireDate // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,tenantId: freezed == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [EmployeeDto].
extension EmployeeDtoPatterns on EmployeeDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EmployeeDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EmployeeDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EmployeeDto value)  $default,){
final _that = this;
switch (_that) {
case _EmployeeDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EmployeeDto value)?  $default,){
final _that = this;
switch (_that) {
case _EmployeeDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'party_id')  String? partyId, @JsonKey(name: 'employee_code')  String? employeeCode, @JsonKey(name: 'job_id')  String? jobId, @JsonKey(name: 'department_id')  String? departmentId, @JsonKey(name: 'manager_party_id')  String? managerPartyId, @JsonKey(name: 'hire_date')  String? hireDate,  String? status, @JsonKey(name: 'tenant_id')  String? tenantId, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EmployeeDto() when $default != null:
return $default(_that.partyId,_that.employeeCode,_that.jobId,_that.departmentId,_that.managerPartyId,_that.hireDate,_that.status,_that.tenantId,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'party_id')  String? partyId, @JsonKey(name: 'employee_code')  String? employeeCode, @JsonKey(name: 'job_id')  String? jobId, @JsonKey(name: 'department_id')  String? departmentId, @JsonKey(name: 'manager_party_id')  String? managerPartyId, @JsonKey(name: 'hire_date')  String? hireDate,  String? status, @JsonKey(name: 'tenant_id')  String? tenantId, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _EmployeeDto():
return $default(_that.partyId,_that.employeeCode,_that.jobId,_that.departmentId,_that.managerPartyId,_that.hireDate,_that.status,_that.tenantId,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'party_id')  String? partyId, @JsonKey(name: 'employee_code')  String? employeeCode, @JsonKey(name: 'job_id')  String? jobId, @JsonKey(name: 'department_id')  String? departmentId, @JsonKey(name: 'manager_party_id')  String? managerPartyId, @JsonKey(name: 'hire_date')  String? hireDate,  String? status, @JsonKey(name: 'tenant_id')  String? tenantId, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _EmployeeDto() when $default != null:
return $default(_that.partyId,_that.employeeCode,_that.jobId,_that.departmentId,_that.managerPartyId,_that.hireDate,_that.status,_that.tenantId,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EmployeeDto implements EmployeeDto {
  const _EmployeeDto({@JsonKey(name: 'party_id') this.partyId, @JsonKey(name: 'employee_code') this.employeeCode, @JsonKey(name: 'job_id') this.jobId, @JsonKey(name: 'department_id') this.departmentId, @JsonKey(name: 'manager_party_id') this.managerPartyId, @JsonKey(name: 'hire_date') this.hireDate, this.status, @JsonKey(name: 'tenant_id') this.tenantId, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt});
  factory _EmployeeDto.fromJson(Map<String, dynamic> json) => _$EmployeeDtoFromJson(json);

@override@JsonKey(name: 'party_id') final  String? partyId;
@override@JsonKey(name: 'employee_code') final  String? employeeCode;
@override@JsonKey(name: 'job_id') final  String? jobId;
@override@JsonKey(name: 'department_id') final  String? departmentId;
@override@JsonKey(name: 'manager_party_id') final  String? managerPartyId;
@override@JsonKey(name: 'hire_date') final  String? hireDate;
@override final  String? status;
@override@JsonKey(name: 'tenant_id') final  String? tenantId;
@override@JsonKey(name: 'created_at') final  String? createdAt;
@override@JsonKey(name: 'updated_at') final  String? updatedAt;

/// Create a copy of EmployeeDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EmployeeDtoCopyWith<_EmployeeDto> get copyWith => __$EmployeeDtoCopyWithImpl<_EmployeeDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EmployeeDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _EmployeeDto&&(identical(other.partyId, partyId) || other.partyId == partyId)&&(identical(other.employeeCode, employeeCode) || other.employeeCode == employeeCode)&&(identical(other.jobId, jobId) || other.jobId == jobId)&&(identical(other.departmentId, departmentId) || other.departmentId == departmentId)&&(identical(other.managerPartyId, managerPartyId) || other.managerPartyId == managerPartyId)&&(identical(other.hireDate, hireDate) || other.hireDate == hireDate)&&(identical(other.status, status) || other.status == status)&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,partyId,employeeCode,jobId,departmentId,managerPartyId,hireDate,status,tenantId,createdAt,updatedAt);
}

@override
String toString() {
    return 'EmployeeDto(partyId: $partyId, employeeCode: $employeeCode, jobId: $jobId, departmentId: $departmentId, managerPartyId: $managerPartyId, hireDate: $hireDate, status: $status, tenantId: $tenantId, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$EmployeeDtoCopyWith<$Res> implements $EmployeeDtoCopyWith<$Res> {
  factory _$EmployeeDtoCopyWith(_EmployeeDto value, $Res Function(_EmployeeDto) _then) = __$EmployeeDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'party_id') String? partyId,@JsonKey(name: 'employee_code') String? employeeCode,@JsonKey(name: 'job_id') String? jobId,@JsonKey(name: 'department_id') String? departmentId,@JsonKey(name: 'manager_party_id') String? managerPartyId,@JsonKey(name: 'hire_date') String? hireDate, String? status,@JsonKey(name: 'tenant_id') String? tenantId,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt
});




}
/// @nodoc
class __$EmployeeDtoCopyWithImpl<$Res>
    implements _$EmployeeDtoCopyWith<$Res> {
  __$EmployeeDtoCopyWithImpl(this._self, this._then);

  final _EmployeeDto _self;
  final $Res Function(_EmployeeDto) _then;

/// Create a copy of EmployeeDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? partyId = freezed,Object? employeeCode = freezed,Object? jobId = freezed,Object? departmentId = freezed,Object? managerPartyId = freezed,Object? hireDate = freezed,Object? status = freezed,Object? tenantId = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_EmployeeDto(
partyId: freezed == partyId ? _self.partyId : partyId // ignore: cast_nullable_to_non_nullable
as String?,employeeCode: freezed == employeeCode ? _self.employeeCode : employeeCode // ignore: cast_nullable_to_non_nullable
as String?,jobId: freezed == jobId ? _self.jobId : jobId // ignore: cast_nullable_to_non_nullable
as String?,departmentId: freezed == departmentId ? _self.departmentId : departmentId // ignore: cast_nullable_to_non_nullable
as String?,managerPartyId: freezed == managerPartyId ? _self.managerPartyId : managerPartyId // ignore: cast_nullable_to_non_nullable
as String?,hireDate: freezed == hireDate ? _self.hireDate : hireDate // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,tenantId: freezed == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$CreateEmployeeRequestDto {

@JsonKey(name: 'party_id') String get partyId;@JsonKey(name: 'employee_code') String get employeeCode;@JsonKey(name: 'hire_date') String get hireDate;@JsonKey(name: 'job_id') String get jobId;@JsonKey(name: 'department_id') String get departmentId;@JsonKey(name: 'manager_party_id', includeIfNull: false) String? get managerPartyId;@JsonKey(includeIfNull: false) String? get status;
/// Create a copy of CreateEmployeeRequestDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateEmployeeRequestDtoCopyWith<CreateEmployeeRequestDto> get copyWith => _$CreateEmployeeRequestDtoCopyWithImpl<CreateEmployeeRequestDto>(this as CreateEmployeeRequestDto, _$identity);

  /// Serializes this CreateEmployeeRequestDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as CreateEmployeeRequestDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateEmployeeRequestDto&&(identical(other.partyId, _this.partyId) || other.partyId == _this.partyId)&&(identical(other.employeeCode, _this.employeeCode) || other.employeeCode == _this.employeeCode)&&(identical(other.hireDate, _this.hireDate) || other.hireDate == _this.hireDate)&&(identical(other.jobId, _this.jobId) || other.jobId == _this.jobId)&&(identical(other.departmentId, _this.departmentId) || other.departmentId == _this.departmentId)&&(identical(other.managerPartyId, _this.managerPartyId) || other.managerPartyId == _this.managerPartyId)&&(identical(other.status, _this.status) || other.status == _this.status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as CreateEmployeeRequestDto;
  return Object.hash(runtimeType,_this.partyId,_this.employeeCode,_this.hireDate,_this.jobId,_this.departmentId,_this.managerPartyId,_this.status);
}

@override
String toString() {
  final _this = this as CreateEmployeeRequestDto;
  return 'CreateEmployeeRequestDto(partyId: ${_this.partyId}, employeeCode: ${_this.employeeCode}, hireDate: ${_this.hireDate}, jobId: ${_this.jobId}, departmentId: ${_this.departmentId}, managerPartyId: ${_this.managerPartyId}, status: ${_this.status})';
}


}

/// @nodoc
abstract mixin class $CreateEmployeeRequestDtoCopyWith<$Res>  {
  factory $CreateEmployeeRequestDtoCopyWith(CreateEmployeeRequestDto value, $Res Function(CreateEmployeeRequestDto) _then) = _$CreateEmployeeRequestDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'party_id') String partyId,@JsonKey(name: 'employee_code') String employeeCode,@JsonKey(name: 'hire_date') String hireDate,@JsonKey(name: 'job_id') String jobId,@JsonKey(name: 'department_id') String departmentId,@JsonKey(name: 'manager_party_id', includeIfNull: false) String? managerPartyId,@JsonKey(includeIfNull: false) String? status
});




}
/// @nodoc
class _$CreateEmployeeRequestDtoCopyWithImpl<$Res>
    implements $CreateEmployeeRequestDtoCopyWith<$Res> {
  _$CreateEmployeeRequestDtoCopyWithImpl(this._self, this._then);

  final CreateEmployeeRequestDto _self;
  final $Res Function(CreateEmployeeRequestDto) _then;

/// Create a copy of CreateEmployeeRequestDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? partyId = null,Object? employeeCode = null,Object? hireDate = null,Object? jobId = null,Object? departmentId = null,Object? managerPartyId = freezed,Object? status = freezed,}) {
  return _then(CreateEmployeeRequestDto(
partyId: null == partyId ? _self.partyId : partyId // ignore: cast_nullable_to_non_nullable
as String,employeeCode: null == employeeCode ? _self.employeeCode : employeeCode // ignore: cast_nullable_to_non_nullable
as String,hireDate: null == hireDate ? _self.hireDate : hireDate // ignore: cast_nullable_to_non_nullable
as String,jobId: null == jobId ? _self.jobId : jobId // ignore: cast_nullable_to_non_nullable
as String,departmentId: null == departmentId ? _self.departmentId : departmentId // ignore: cast_nullable_to_non_nullable
as String,managerPartyId: freezed == managerPartyId ? _self.managerPartyId : managerPartyId // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateEmployeeRequestDto].
extension CreateEmployeeRequestDtoPatterns on CreateEmployeeRequestDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateEmployeeRequestDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateEmployeeRequestDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateEmployeeRequestDto value)  $default,){
final _that = this;
switch (_that) {
case _CreateEmployeeRequestDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateEmployeeRequestDto value)?  $default,){
final _that = this;
switch (_that) {
case _CreateEmployeeRequestDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'party_id')  String partyId, @JsonKey(name: 'employee_code')  String employeeCode, @JsonKey(name: 'hire_date')  String hireDate, @JsonKey(name: 'job_id')  String jobId, @JsonKey(name: 'department_id')  String departmentId, @JsonKey(name: 'manager_party_id', includeIfNull: false)  String? managerPartyId, @JsonKey(includeIfNull: false)  String? status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateEmployeeRequestDto() when $default != null:
return $default(_that.partyId,_that.employeeCode,_that.hireDate,_that.jobId,_that.departmentId,_that.managerPartyId,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'party_id')  String partyId, @JsonKey(name: 'employee_code')  String employeeCode, @JsonKey(name: 'hire_date')  String hireDate, @JsonKey(name: 'job_id')  String jobId, @JsonKey(name: 'department_id')  String departmentId, @JsonKey(name: 'manager_party_id', includeIfNull: false)  String? managerPartyId, @JsonKey(includeIfNull: false)  String? status)  $default,) {final _that = this;
switch (_that) {
case _CreateEmployeeRequestDto():
return $default(_that.partyId,_that.employeeCode,_that.hireDate,_that.jobId,_that.departmentId,_that.managerPartyId,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'party_id')  String partyId, @JsonKey(name: 'employee_code')  String employeeCode, @JsonKey(name: 'hire_date')  String hireDate, @JsonKey(name: 'job_id')  String jobId, @JsonKey(name: 'department_id')  String departmentId, @JsonKey(name: 'manager_party_id', includeIfNull: false)  String? managerPartyId, @JsonKey(includeIfNull: false)  String? status)?  $default,) {final _that = this;
switch (_that) {
case _CreateEmployeeRequestDto() when $default != null:
return $default(_that.partyId,_that.employeeCode,_that.hireDate,_that.jobId,_that.departmentId,_that.managerPartyId,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateEmployeeRequestDto implements CreateEmployeeRequestDto {
  const _CreateEmployeeRequestDto({@JsonKey(name: 'party_id') required this.partyId, @JsonKey(name: 'employee_code') required this.employeeCode, @JsonKey(name: 'hire_date') required this.hireDate, @JsonKey(name: 'job_id') required this.jobId, @JsonKey(name: 'department_id') required this.departmentId, @JsonKey(name: 'manager_party_id', includeIfNull: false) this.managerPartyId, @JsonKey(includeIfNull: false) this.status});
  factory _CreateEmployeeRequestDto.fromJson(Map<String, dynamic> json) => _$CreateEmployeeRequestDtoFromJson(json);

@override@JsonKey(name: 'party_id') final  String partyId;
@override@JsonKey(name: 'employee_code') final  String employeeCode;
@override@JsonKey(name: 'hire_date') final  String hireDate;
@override@JsonKey(name: 'job_id') final  String jobId;
@override@JsonKey(name: 'department_id') final  String departmentId;
@override@JsonKey(name: 'manager_party_id', includeIfNull: false) final  String? managerPartyId;
@override@JsonKey(includeIfNull: false) final  String? status;

/// Create a copy of CreateEmployeeRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateEmployeeRequestDtoCopyWith<_CreateEmployeeRequestDto> get copyWith => __$CreateEmployeeRequestDtoCopyWithImpl<_CreateEmployeeRequestDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateEmployeeRequestDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateEmployeeRequestDto&&(identical(other.partyId, partyId) || other.partyId == partyId)&&(identical(other.employeeCode, employeeCode) || other.employeeCode == employeeCode)&&(identical(other.hireDate, hireDate) || other.hireDate == hireDate)&&(identical(other.jobId, jobId) || other.jobId == jobId)&&(identical(other.departmentId, departmentId) || other.departmentId == departmentId)&&(identical(other.managerPartyId, managerPartyId) || other.managerPartyId == managerPartyId)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,partyId,employeeCode,hireDate,jobId,departmentId,managerPartyId,status);
}

@override
String toString() {
    return 'CreateEmployeeRequestDto(partyId: $partyId, employeeCode: $employeeCode, hireDate: $hireDate, jobId: $jobId, departmentId: $departmentId, managerPartyId: $managerPartyId, status: $status)';
}


}

/// @nodoc
abstract mixin class _$CreateEmployeeRequestDtoCopyWith<$Res> implements $CreateEmployeeRequestDtoCopyWith<$Res> {
  factory _$CreateEmployeeRequestDtoCopyWith(_CreateEmployeeRequestDto value, $Res Function(_CreateEmployeeRequestDto) _then) = __$CreateEmployeeRequestDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'party_id') String partyId,@JsonKey(name: 'employee_code') String employeeCode,@JsonKey(name: 'hire_date') String hireDate,@JsonKey(name: 'job_id') String jobId,@JsonKey(name: 'department_id') String departmentId,@JsonKey(name: 'manager_party_id', includeIfNull: false) String? managerPartyId,@JsonKey(includeIfNull: false) String? status
});




}
/// @nodoc
class __$CreateEmployeeRequestDtoCopyWithImpl<$Res>
    implements _$CreateEmployeeRequestDtoCopyWith<$Res> {
  __$CreateEmployeeRequestDtoCopyWithImpl(this._self, this._then);

  final _CreateEmployeeRequestDto _self;
  final $Res Function(_CreateEmployeeRequestDto) _then;

/// Create a copy of CreateEmployeeRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? partyId = null,Object? employeeCode = null,Object? hireDate = null,Object? jobId = null,Object? departmentId = null,Object? managerPartyId = freezed,Object? status = freezed,}) {
  return _then(_CreateEmployeeRequestDto(
partyId: null == partyId ? _self.partyId : partyId // ignore: cast_nullable_to_non_nullable
as String,employeeCode: null == employeeCode ? _self.employeeCode : employeeCode // ignore: cast_nullable_to_non_nullable
as String,hireDate: null == hireDate ? _self.hireDate : hireDate // ignore: cast_nullable_to_non_nullable
as String,jobId: null == jobId ? _self.jobId : jobId // ignore: cast_nullable_to_non_nullable
as String,departmentId: null == departmentId ? _self.departmentId : departmentId // ignore: cast_nullable_to_non_nullable
as String,managerPartyId: freezed == managerPartyId ? _self.managerPartyId : managerPartyId // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
