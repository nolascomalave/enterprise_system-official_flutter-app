// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_summary_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RecentPartyDto {

 String? get id;@JsonKey(name: 'display_name') String? get displayName;@JsonKey(name: 'party_type') String? get partyType;@JsonKey(name: 'record_status') String? get recordStatus;@JsonKey(name: 'created_at') String? get createdAt;@JsonKey(name: 'updated_at') String? get updatedAt;
/// Create a copy of RecentPartyDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecentPartyDtoCopyWith<RecentPartyDto> get copyWith => _$RecentPartyDtoCopyWithImpl<RecentPartyDto>(this as RecentPartyDto, _$identity);

  /// Serializes this RecentPartyDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as RecentPartyDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecentPartyDto&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.displayName, _this.displayName) || other.displayName == _this.displayName)&&(identical(other.partyType, _this.partyType) || other.partyType == _this.partyType)&&(identical(other.recordStatus, _this.recordStatus) || other.recordStatus == _this.recordStatus)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as RecentPartyDto;
  return Object.hash(runtimeType,_this.id,_this.displayName,_this.partyType,_this.recordStatus,_this.createdAt,_this.updatedAt);
}

@override
String toString() {
  final _this = this as RecentPartyDto;
  return 'RecentPartyDto(id: ${_this.id}, displayName: ${_this.displayName}, partyType: ${_this.partyType}, recordStatus: ${_this.recordStatus}, createdAt: ${_this.createdAt}, updatedAt: ${_this.updatedAt})';
}


}

/// @nodoc
abstract mixin class $RecentPartyDtoCopyWith<$Res>  {
  factory $RecentPartyDtoCopyWith(RecentPartyDto value, $Res Function(RecentPartyDto) _then) = _$RecentPartyDtoCopyWithImpl;
@useResult
$Res call({
 String? id,@JsonKey(name: 'display_name') String? displayName,@JsonKey(name: 'party_type') String? partyType,@JsonKey(name: 'record_status') String? recordStatus,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt
});




}
/// @nodoc
class _$RecentPartyDtoCopyWithImpl<$Res>
    implements $RecentPartyDtoCopyWith<$Res> {
  _$RecentPartyDtoCopyWithImpl(this._self, this._then);

  final RecentPartyDto _self;
  final $Res Function(RecentPartyDto) _then;

/// Create a copy of RecentPartyDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? displayName = freezed,Object? partyType = freezed,Object? recordStatus = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(RecentPartyDto(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,displayName: freezed == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String?,partyType: freezed == partyType ? _self.partyType : partyType // ignore: cast_nullable_to_non_nullable
as String?,recordStatus: freezed == recordStatus ? _self.recordStatus : recordStatus // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [RecentPartyDto].
extension RecentPartyDtoPatterns on RecentPartyDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RecentPartyDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RecentPartyDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RecentPartyDto value)  $default,){
final _that = this;
switch (_that) {
case _RecentPartyDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RecentPartyDto value)?  $default,){
final _that = this;
switch (_that) {
case _RecentPartyDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'display_name')  String? displayName, @JsonKey(name: 'party_type')  String? partyType, @JsonKey(name: 'record_status')  String? recordStatus, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RecentPartyDto() when $default != null:
return $default(_that.id,_that.displayName,_that.partyType,_that.recordStatus,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'display_name')  String? displayName, @JsonKey(name: 'party_type')  String? partyType, @JsonKey(name: 'record_status')  String? recordStatus, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _RecentPartyDto():
return $default(_that.id,_that.displayName,_that.partyType,_that.recordStatus,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id, @JsonKey(name: 'display_name')  String? displayName, @JsonKey(name: 'party_type')  String? partyType, @JsonKey(name: 'record_status')  String? recordStatus, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _RecentPartyDto() when $default != null:
return $default(_that.id,_that.displayName,_that.partyType,_that.recordStatus,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RecentPartyDto implements RecentPartyDto {
  const _RecentPartyDto({this.id, @JsonKey(name: 'display_name') this.displayName, @JsonKey(name: 'party_type') this.partyType, @JsonKey(name: 'record_status') this.recordStatus, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt});
  factory _RecentPartyDto.fromJson(Map<String, dynamic> json) => _$RecentPartyDtoFromJson(json);

@override final  String? id;
@override@JsonKey(name: 'display_name') final  String? displayName;
@override@JsonKey(name: 'party_type') final  String? partyType;
@override@JsonKey(name: 'record_status') final  String? recordStatus;
@override@JsonKey(name: 'created_at') final  String? createdAt;
@override@JsonKey(name: 'updated_at') final  String? updatedAt;

/// Create a copy of RecentPartyDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecentPartyDtoCopyWith<_RecentPartyDto> get copyWith => __$RecentPartyDtoCopyWithImpl<_RecentPartyDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RecentPartyDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _RecentPartyDto&&(identical(other.id, id) || other.id == id)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.partyType, partyType) || other.partyType == partyType)&&(identical(other.recordStatus, recordStatus) || other.recordStatus == recordStatus)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,displayName,partyType,recordStatus,createdAt,updatedAt);
}

@override
String toString() {
    return 'RecentPartyDto(id: $id, displayName: $displayName, partyType: $partyType, recordStatus: $recordStatus, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$RecentPartyDtoCopyWith<$Res> implements $RecentPartyDtoCopyWith<$Res> {
  factory _$RecentPartyDtoCopyWith(_RecentPartyDto value, $Res Function(_RecentPartyDto) _then) = __$RecentPartyDtoCopyWithImpl;
@override @useResult
$Res call({
 String? id,@JsonKey(name: 'display_name') String? displayName,@JsonKey(name: 'party_type') String? partyType,@JsonKey(name: 'record_status') String? recordStatus,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt
});




}
/// @nodoc
class __$RecentPartyDtoCopyWithImpl<$Res>
    implements _$RecentPartyDtoCopyWith<$Res> {
  __$RecentPartyDtoCopyWithImpl(this._self, this._then);

  final _RecentPartyDto _self;
  final $Res Function(_RecentPartyDto) _then;

/// Create a copy of RecentPartyDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? displayName = freezed,Object? partyType = freezed,Object? recordStatus = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_RecentPartyDto(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,displayName: freezed == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String?,partyType: freezed == partyType ? _self.partyType : partyType // ignore: cast_nullable_to_non_nullable
as String?,recordStatus: freezed == recordStatus ? _self.recordStatus : recordStatus // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$DashboardSummaryDto {

@JsonKey(name: 'total_parties') int get totalParties;@JsonKey(name: 'total_employees') int get totalEmployees;@JsonKey(name: 'total_departments') int get totalDepartments;@JsonKey(name: 'recent_parties') List<RecentPartyDto> get recentParties;
/// Create a copy of DashboardSummaryDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DashboardSummaryDtoCopyWith<DashboardSummaryDto> get copyWith => _$DashboardSummaryDtoCopyWithImpl<DashboardSummaryDto>(this as DashboardSummaryDto, _$identity);

  /// Serializes this DashboardSummaryDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as DashboardSummaryDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DashboardSummaryDto&&(identical(other.totalParties, _this.totalParties) || other.totalParties == _this.totalParties)&&(identical(other.totalEmployees, _this.totalEmployees) || other.totalEmployees == _this.totalEmployees)&&(identical(other.totalDepartments, _this.totalDepartments) || other.totalDepartments == _this.totalDepartments)&&const DeepCollectionEquality().equals(other.recentParties, _this.recentParties));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as DashboardSummaryDto;
  return Object.hash(runtimeType,_this.totalParties,_this.totalEmployees,_this.totalDepartments,const DeepCollectionEquality().hash(_this.recentParties));
}

@override
String toString() {
  final _this = this as DashboardSummaryDto;
  return 'DashboardSummaryDto(totalParties: ${_this.totalParties}, totalEmployees: ${_this.totalEmployees}, totalDepartments: ${_this.totalDepartments}, recentParties: ${_this.recentParties})';
}


}

/// @nodoc
abstract mixin class $DashboardSummaryDtoCopyWith<$Res>  {
  factory $DashboardSummaryDtoCopyWith(DashboardSummaryDto value, $Res Function(DashboardSummaryDto) _then) = _$DashboardSummaryDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'total_parties') int totalParties,@JsonKey(name: 'total_employees') int totalEmployees,@JsonKey(name: 'total_departments') int totalDepartments,@JsonKey(name: 'recent_parties') List<RecentPartyDto> recentParties
});




}
/// @nodoc
class _$DashboardSummaryDtoCopyWithImpl<$Res>
    implements $DashboardSummaryDtoCopyWith<$Res> {
  _$DashboardSummaryDtoCopyWithImpl(this._self, this._then);

  final DashboardSummaryDto _self;
  final $Res Function(DashboardSummaryDto) _then;

/// Create a copy of DashboardSummaryDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalParties = null,Object? totalEmployees = null,Object? totalDepartments = null,Object? recentParties = null,}) {
  return _then(DashboardSummaryDto(
totalParties: null == totalParties ? _self.totalParties : totalParties // ignore: cast_nullable_to_non_nullable
as int,totalEmployees: null == totalEmployees ? _self.totalEmployees : totalEmployees // ignore: cast_nullable_to_non_nullable
as int,totalDepartments: null == totalDepartments ? _self.totalDepartments : totalDepartments // ignore: cast_nullable_to_non_nullable
as int,recentParties: null == recentParties ? _self.recentParties : recentParties // ignore: cast_nullable_to_non_nullable
as List<RecentPartyDto>,
  ));
}

}


/// Adds pattern-matching-related methods to [DashboardSummaryDto].
extension DashboardSummaryDtoPatterns on DashboardSummaryDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DashboardSummaryDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DashboardSummaryDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DashboardSummaryDto value)  $default,){
final _that = this;
switch (_that) {
case _DashboardSummaryDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DashboardSummaryDto value)?  $default,){
final _that = this;
switch (_that) {
case _DashboardSummaryDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'total_parties')  int totalParties, @JsonKey(name: 'total_employees')  int totalEmployees, @JsonKey(name: 'total_departments')  int totalDepartments, @JsonKey(name: 'recent_parties')  List<RecentPartyDto> recentParties)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DashboardSummaryDto() when $default != null:
return $default(_that.totalParties,_that.totalEmployees,_that.totalDepartments,_that.recentParties);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'total_parties')  int totalParties, @JsonKey(name: 'total_employees')  int totalEmployees, @JsonKey(name: 'total_departments')  int totalDepartments, @JsonKey(name: 'recent_parties')  List<RecentPartyDto> recentParties)  $default,) {final _that = this;
switch (_that) {
case _DashboardSummaryDto():
return $default(_that.totalParties,_that.totalEmployees,_that.totalDepartments,_that.recentParties);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'total_parties')  int totalParties, @JsonKey(name: 'total_employees')  int totalEmployees, @JsonKey(name: 'total_departments')  int totalDepartments, @JsonKey(name: 'recent_parties')  List<RecentPartyDto> recentParties)?  $default,) {final _that = this;
switch (_that) {
case _DashboardSummaryDto() when $default != null:
return $default(_that.totalParties,_that.totalEmployees,_that.totalDepartments,_that.recentParties);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DashboardSummaryDto implements DashboardSummaryDto {
  const _DashboardSummaryDto({@JsonKey(name: 'total_parties') this.totalParties = 0, @JsonKey(name: 'total_employees') this.totalEmployees = 0, @JsonKey(name: 'total_departments') this.totalDepartments = 0, @JsonKey(name: 'recent_parties')  List<RecentPartyDto> recentParties = const <RecentPartyDto>[]}): _recentParties = recentParties;
  factory _DashboardSummaryDto.fromJson(Map<String, dynamic> json) => _$DashboardSummaryDtoFromJson(json);

@override@JsonKey(name: 'total_parties') final  int totalParties;
@override@JsonKey(name: 'total_employees') final  int totalEmployees;
@override@JsonKey(name: 'total_departments') final  int totalDepartments;
 final  List<RecentPartyDto> _recentParties;
@override@JsonKey(name: 'recent_parties') List<RecentPartyDto> get recentParties {
  if (_recentParties is EqualUnmodifiableListView) return _recentParties;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_recentParties);
}


/// Create a copy of DashboardSummaryDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DashboardSummaryDtoCopyWith<_DashboardSummaryDto> get copyWith => __$DashboardSummaryDtoCopyWithImpl<_DashboardSummaryDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DashboardSummaryDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _DashboardSummaryDto&&(identical(other.totalParties, totalParties) || other.totalParties == totalParties)&&(identical(other.totalEmployees, totalEmployees) || other.totalEmployees == totalEmployees)&&(identical(other.totalDepartments, totalDepartments) || other.totalDepartments == totalDepartments)&&const DeepCollectionEquality().equals(other.recentParties, _recentParties));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,totalParties,totalEmployees,totalDepartments,const DeepCollectionEquality().hash(_recentParties));
}

@override
String toString() {
    return 'DashboardSummaryDto(totalParties: $totalParties, totalEmployees: $totalEmployees, totalDepartments: $totalDepartments, recentParties: $recentParties)';
}


}

/// @nodoc
abstract mixin class _$DashboardSummaryDtoCopyWith<$Res> implements $DashboardSummaryDtoCopyWith<$Res> {
  factory _$DashboardSummaryDtoCopyWith(_DashboardSummaryDto value, $Res Function(_DashboardSummaryDto) _then) = __$DashboardSummaryDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'total_parties') int totalParties,@JsonKey(name: 'total_employees') int totalEmployees,@JsonKey(name: 'total_departments') int totalDepartments,@JsonKey(name: 'recent_parties') List<RecentPartyDto> recentParties
});




}
/// @nodoc
class __$DashboardSummaryDtoCopyWithImpl<$Res>
    implements _$DashboardSummaryDtoCopyWith<$Res> {
  __$DashboardSummaryDtoCopyWithImpl(this._self, this._then);

  final _DashboardSummaryDto _self;
  final $Res Function(_DashboardSummaryDto) _then;

/// Create a copy of DashboardSummaryDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalParties = null,Object? totalEmployees = null,Object? totalDepartments = null,Object? recentParties = null,}) {
  return _then(_DashboardSummaryDto(
totalParties: null == totalParties ? _self.totalParties : totalParties // ignore: cast_nullable_to_non_nullable
as int,totalEmployees: null == totalEmployees ? _self.totalEmployees : totalEmployees // ignore: cast_nullable_to_non_nullable
as int,totalDepartments: null == totalDepartments ? _self.totalDepartments : totalDepartments // ignore: cast_nullable_to_non_nullable
as int,recentParties: null == recentParties ? _self._recentParties : recentParties // ignore: cast_nullable_to_non_nullable
as List<RecentPartyDto>,
  ));
}


}

// dart format on
