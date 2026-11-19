// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'job_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$JobDto {

 String? get id; String? get title; String? get code; String? get description;@JsonKey(name: 'job_family_id') String? get jobFamilyId;@JsonKey(name: 'min_salary') String? get minSalary;@JsonKey(name: 'max_salary') String? get maxSalary;
/// Create a copy of JobDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JobDtoCopyWith<JobDto> get copyWith => _$JobDtoCopyWithImpl<JobDto>(this as JobDto, _$identity);

  /// Serializes this JobDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as JobDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JobDto&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.code, _this.code) || other.code == _this.code)&&(identical(other.description, _this.description) || other.description == _this.description)&&(identical(other.jobFamilyId, _this.jobFamilyId) || other.jobFamilyId == _this.jobFamilyId)&&(identical(other.minSalary, _this.minSalary) || other.minSalary == _this.minSalary)&&(identical(other.maxSalary, _this.maxSalary) || other.maxSalary == _this.maxSalary));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as JobDto;
  return Object.hash(runtimeType,_this.id,_this.title,_this.code,_this.description,_this.jobFamilyId,_this.minSalary,_this.maxSalary);
}

@override
String toString() {
  final _this = this as JobDto;
  return 'JobDto(id: ${_this.id}, title: ${_this.title}, code: ${_this.code}, description: ${_this.description}, jobFamilyId: ${_this.jobFamilyId}, minSalary: ${_this.minSalary}, maxSalary: ${_this.maxSalary})';
}


}

/// @nodoc
abstract mixin class $JobDtoCopyWith<$Res>  {
  factory $JobDtoCopyWith(JobDto value, $Res Function(JobDto) _then) = _$JobDtoCopyWithImpl;
@useResult
$Res call({
 String? id, String? title, String? code, String? description,@JsonKey(name: 'job_family_id') String? jobFamilyId,@JsonKey(name: 'min_salary') String? minSalary,@JsonKey(name: 'max_salary') String? maxSalary
});




}
/// @nodoc
class _$JobDtoCopyWithImpl<$Res>
    implements $JobDtoCopyWith<$Res> {
  _$JobDtoCopyWithImpl(this._self, this._then);

  final JobDto _self;
  final $Res Function(JobDto) _then;

/// Create a copy of JobDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? title = freezed,Object? code = freezed,Object? description = freezed,Object? jobFamilyId = freezed,Object? minSalary = freezed,Object? maxSalary = freezed,}) {
  return _then(JobDto(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,jobFamilyId: freezed == jobFamilyId ? _self.jobFamilyId : jobFamilyId // ignore: cast_nullable_to_non_nullable
as String?,minSalary: freezed == minSalary ? _self.minSalary : minSalary // ignore: cast_nullable_to_non_nullable
as String?,maxSalary: freezed == maxSalary ? _self.maxSalary : maxSalary // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [JobDto].
extension JobDtoPatterns on JobDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _JobDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _JobDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _JobDto value)  $default,){
final _that = this;
switch (_that) {
case _JobDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _JobDto value)?  $default,){
final _that = this;
switch (_that) {
case _JobDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String? title,  String? code,  String? description, @JsonKey(name: 'job_family_id')  String? jobFamilyId, @JsonKey(name: 'min_salary')  String? minSalary, @JsonKey(name: 'max_salary')  String? maxSalary)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _JobDto() when $default != null:
return $default(_that.id,_that.title,_that.code,_that.description,_that.jobFamilyId,_that.minSalary,_that.maxSalary);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String? title,  String? code,  String? description, @JsonKey(name: 'job_family_id')  String? jobFamilyId, @JsonKey(name: 'min_salary')  String? minSalary, @JsonKey(name: 'max_salary')  String? maxSalary)  $default,) {final _that = this;
switch (_that) {
case _JobDto():
return $default(_that.id,_that.title,_that.code,_that.description,_that.jobFamilyId,_that.minSalary,_that.maxSalary);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String? title,  String? code,  String? description, @JsonKey(name: 'job_family_id')  String? jobFamilyId, @JsonKey(name: 'min_salary')  String? minSalary, @JsonKey(name: 'max_salary')  String? maxSalary)?  $default,) {final _that = this;
switch (_that) {
case _JobDto() when $default != null:
return $default(_that.id,_that.title,_that.code,_that.description,_that.jobFamilyId,_that.minSalary,_that.maxSalary);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _JobDto implements JobDto {
  const _JobDto({this.id, this.title, this.code, this.description, @JsonKey(name: 'job_family_id') this.jobFamilyId, @JsonKey(name: 'min_salary') this.minSalary, @JsonKey(name: 'max_salary') this.maxSalary});
  factory _JobDto.fromJson(Map<String, dynamic> json) => _$JobDtoFromJson(json);

@override final  String? id;
@override final  String? title;
@override final  String? code;
@override final  String? description;
@override@JsonKey(name: 'job_family_id') final  String? jobFamilyId;
@override@JsonKey(name: 'min_salary') final  String? minSalary;
@override@JsonKey(name: 'max_salary') final  String? maxSalary;

/// Create a copy of JobDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$JobDtoCopyWith<_JobDto> get copyWith => __$JobDtoCopyWithImpl<_JobDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$JobDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _JobDto&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.code, code) || other.code == code)&&(identical(other.description, description) || other.description == description)&&(identical(other.jobFamilyId, jobFamilyId) || other.jobFamilyId == jobFamilyId)&&(identical(other.minSalary, minSalary) || other.minSalary == minSalary)&&(identical(other.maxSalary, maxSalary) || other.maxSalary == maxSalary));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,title,code,description,jobFamilyId,minSalary,maxSalary);
}

@override
String toString() {
    return 'JobDto(id: $id, title: $title, code: $code, description: $description, jobFamilyId: $jobFamilyId, minSalary: $minSalary, maxSalary: $maxSalary)';
}


}

/// @nodoc
abstract mixin class _$JobDtoCopyWith<$Res> implements $JobDtoCopyWith<$Res> {
  factory _$JobDtoCopyWith(_JobDto value, $Res Function(_JobDto) _then) = __$JobDtoCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? title, String? code, String? description,@JsonKey(name: 'job_family_id') String? jobFamilyId,@JsonKey(name: 'min_salary') String? minSalary,@JsonKey(name: 'max_salary') String? maxSalary
});




}
/// @nodoc
class __$JobDtoCopyWithImpl<$Res>
    implements _$JobDtoCopyWith<$Res> {
  __$JobDtoCopyWithImpl(this._self, this._then);

  final _JobDto _self;
  final $Res Function(_JobDto) _then;

/// Create a copy of JobDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? title = freezed,Object? code = freezed,Object? description = freezed,Object? jobFamilyId = freezed,Object? minSalary = freezed,Object? maxSalary = freezed,}) {
  return _then(_JobDto(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,jobFamilyId: freezed == jobFamilyId ? _self.jobFamilyId : jobFamilyId // ignore: cast_nullable_to_non_nullable
as String?,minSalary: freezed == minSalary ? _self.minSalary : minSalary // ignore: cast_nullable_to_non_nullable
as String?,maxSalary: freezed == maxSalary ? _self.maxSalary : maxSalary // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
