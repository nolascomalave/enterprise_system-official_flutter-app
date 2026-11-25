// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'party_detail_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PartyDetailDto {

 String? get id;@JsonKey(name: 'display_name') String? get displayName;@JsonKey(name: 'party_type') String? get partyType;@JsonKey(name: 'record_status') String? get recordStatus;@JsonKey(name: 'created_at') String? get createdAt;@JsonKey(name: 'canonical_party_id') String? get canonicalPartyId;@JsonKey(name: 'person_profile') PersonProfileDto? get personProfile;@JsonKey(name: 'organization_profile') OrganizationProfileDto? get organizationProfile;
/// Create a copy of PartyDetailDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PartyDetailDtoCopyWith<PartyDetailDto> get copyWith => _$PartyDetailDtoCopyWithImpl<PartyDetailDto>(this as PartyDetailDto, _$identity);

  /// Serializes this PartyDetailDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as PartyDetailDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PartyDetailDto&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.displayName, _this.displayName) || other.displayName == _this.displayName)&&(identical(other.partyType, _this.partyType) || other.partyType == _this.partyType)&&(identical(other.recordStatus, _this.recordStatus) || other.recordStatus == _this.recordStatus)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.canonicalPartyId, _this.canonicalPartyId) || other.canonicalPartyId == _this.canonicalPartyId)&&(identical(other.personProfile, _this.personProfile) || other.personProfile == _this.personProfile)&&(identical(other.organizationProfile, _this.organizationProfile) || other.organizationProfile == _this.organizationProfile));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PartyDetailDto;
  return Object.hash(runtimeType,_this.id,_this.displayName,_this.partyType,_this.recordStatus,_this.createdAt,_this.canonicalPartyId,_this.personProfile,_this.organizationProfile);
}

@override
String toString() {
  final _this = this as PartyDetailDto;
  return 'PartyDetailDto(id: ${_this.id}, displayName: ${_this.displayName}, partyType: ${_this.partyType}, recordStatus: ${_this.recordStatus}, createdAt: ${_this.createdAt}, canonicalPartyId: ${_this.canonicalPartyId}, personProfile: ${_this.personProfile}, organizationProfile: ${_this.organizationProfile})';
}


}

/// @nodoc
abstract mixin class $PartyDetailDtoCopyWith<$Res>  {
  factory $PartyDetailDtoCopyWith(PartyDetailDto value, $Res Function(PartyDetailDto) _then) = _$PartyDetailDtoCopyWithImpl;
@useResult
$Res call({
 String? id,@JsonKey(name: 'display_name') String? displayName,@JsonKey(name: 'party_type') String? partyType,@JsonKey(name: 'record_status') String? recordStatus,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'canonical_party_id') String? canonicalPartyId,@JsonKey(name: 'person_profile') PersonProfileDto? personProfile,@JsonKey(name: 'organization_profile') OrganizationProfileDto? organizationProfile
});


$PersonProfileDtoCopyWith<$Res>? get personProfile;$OrganizationProfileDtoCopyWith<$Res>? get organizationProfile;

}
/// @nodoc
class _$PartyDetailDtoCopyWithImpl<$Res>
    implements $PartyDetailDtoCopyWith<$Res> {
  _$PartyDetailDtoCopyWithImpl(this._self, this._then);

  final PartyDetailDto _self;
  final $Res Function(PartyDetailDto) _then;

/// Create a copy of PartyDetailDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? displayName = freezed,Object? partyType = freezed,Object? recordStatus = freezed,Object? createdAt = freezed,Object? canonicalPartyId = freezed,Object? personProfile = freezed,Object? organizationProfile = freezed,}) {
  return _then(PartyDetailDto(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,displayName: freezed == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String?,partyType: freezed == partyType ? _self.partyType : partyType // ignore: cast_nullable_to_non_nullable
as String?,recordStatus: freezed == recordStatus ? _self.recordStatus : recordStatus // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,canonicalPartyId: freezed == canonicalPartyId ? _self.canonicalPartyId : canonicalPartyId // ignore: cast_nullable_to_non_nullable
as String?,personProfile: freezed == personProfile ? _self.personProfile : personProfile // ignore: cast_nullable_to_non_nullable
as PersonProfileDto?,organizationProfile: freezed == organizationProfile ? _self.organizationProfile : organizationProfile // ignore: cast_nullable_to_non_nullable
as OrganizationProfileDto?,
  ));
}
/// Create a copy of PartyDetailDto
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
}/// Create a copy of PartyDetailDto
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


/// Adds pattern-matching-related methods to [PartyDetailDto].
extension PartyDetailDtoPatterns on PartyDetailDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PartyDetailDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PartyDetailDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PartyDetailDto value)  $default,){
final _that = this;
switch (_that) {
case _PartyDetailDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PartyDetailDto value)?  $default,){
final _that = this;
switch (_that) {
case _PartyDetailDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'display_name')  String? displayName, @JsonKey(name: 'party_type')  String? partyType, @JsonKey(name: 'record_status')  String? recordStatus, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'canonical_party_id')  String? canonicalPartyId, @JsonKey(name: 'person_profile')  PersonProfileDto? personProfile, @JsonKey(name: 'organization_profile')  OrganizationProfileDto? organizationProfile)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PartyDetailDto() when $default != null:
return $default(_that.id,_that.displayName,_that.partyType,_that.recordStatus,_that.createdAt,_that.canonicalPartyId,_that.personProfile,_that.organizationProfile);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'display_name')  String? displayName, @JsonKey(name: 'party_type')  String? partyType, @JsonKey(name: 'record_status')  String? recordStatus, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'canonical_party_id')  String? canonicalPartyId, @JsonKey(name: 'person_profile')  PersonProfileDto? personProfile, @JsonKey(name: 'organization_profile')  OrganizationProfileDto? organizationProfile)  $default,) {final _that = this;
switch (_that) {
case _PartyDetailDto():
return $default(_that.id,_that.displayName,_that.partyType,_that.recordStatus,_that.createdAt,_that.canonicalPartyId,_that.personProfile,_that.organizationProfile);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id, @JsonKey(name: 'display_name')  String? displayName, @JsonKey(name: 'party_type')  String? partyType, @JsonKey(name: 'record_status')  String? recordStatus, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'canonical_party_id')  String? canonicalPartyId, @JsonKey(name: 'person_profile')  PersonProfileDto? personProfile, @JsonKey(name: 'organization_profile')  OrganizationProfileDto? organizationProfile)?  $default,) {final _that = this;
switch (_that) {
case _PartyDetailDto() when $default != null:
return $default(_that.id,_that.displayName,_that.partyType,_that.recordStatus,_that.createdAt,_that.canonicalPartyId,_that.personProfile,_that.organizationProfile);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PartyDetailDto implements PartyDetailDto {
  const _PartyDetailDto({this.id, @JsonKey(name: 'display_name') this.displayName, @JsonKey(name: 'party_type') this.partyType, @JsonKey(name: 'record_status') this.recordStatus, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'canonical_party_id') this.canonicalPartyId, @JsonKey(name: 'person_profile') this.personProfile, @JsonKey(name: 'organization_profile') this.organizationProfile});
  factory _PartyDetailDto.fromJson(Map<String, dynamic> json) => _$PartyDetailDtoFromJson(json);

@override final  String? id;
@override@JsonKey(name: 'display_name') final  String? displayName;
@override@JsonKey(name: 'party_type') final  String? partyType;
@override@JsonKey(name: 'record_status') final  String? recordStatus;
@override@JsonKey(name: 'created_at') final  String? createdAt;
@override@JsonKey(name: 'canonical_party_id') final  String? canonicalPartyId;
@override@JsonKey(name: 'person_profile') final  PersonProfileDto? personProfile;
@override@JsonKey(name: 'organization_profile') final  OrganizationProfileDto? organizationProfile;

/// Create a copy of PartyDetailDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PartyDetailDtoCopyWith<_PartyDetailDto> get copyWith => __$PartyDetailDtoCopyWithImpl<_PartyDetailDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PartyDetailDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PartyDetailDto&&(identical(other.id, id) || other.id == id)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.partyType, partyType) || other.partyType == partyType)&&(identical(other.recordStatus, recordStatus) || other.recordStatus == recordStatus)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.canonicalPartyId, canonicalPartyId) || other.canonicalPartyId == canonicalPartyId)&&(identical(other.personProfile, personProfile) || other.personProfile == personProfile)&&(identical(other.organizationProfile, organizationProfile) || other.organizationProfile == organizationProfile));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,displayName,partyType,recordStatus,createdAt,canonicalPartyId,personProfile,organizationProfile);
}

@override
String toString() {
    return 'PartyDetailDto(id: $id, displayName: $displayName, partyType: $partyType, recordStatus: $recordStatus, createdAt: $createdAt, canonicalPartyId: $canonicalPartyId, personProfile: $personProfile, organizationProfile: $organizationProfile)';
}


}

/// @nodoc
abstract mixin class _$PartyDetailDtoCopyWith<$Res> implements $PartyDetailDtoCopyWith<$Res> {
  factory _$PartyDetailDtoCopyWith(_PartyDetailDto value, $Res Function(_PartyDetailDto) _then) = __$PartyDetailDtoCopyWithImpl;
@override @useResult
$Res call({
 String? id,@JsonKey(name: 'display_name') String? displayName,@JsonKey(name: 'party_type') String? partyType,@JsonKey(name: 'record_status') String? recordStatus,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'canonical_party_id') String? canonicalPartyId,@JsonKey(name: 'person_profile') PersonProfileDto? personProfile,@JsonKey(name: 'organization_profile') OrganizationProfileDto? organizationProfile
});


@override $PersonProfileDtoCopyWith<$Res>? get personProfile;@override $OrganizationProfileDtoCopyWith<$Res>? get organizationProfile;

}
/// @nodoc
class __$PartyDetailDtoCopyWithImpl<$Res>
    implements _$PartyDetailDtoCopyWith<$Res> {
  __$PartyDetailDtoCopyWithImpl(this._self, this._then);

  final _PartyDetailDto _self;
  final $Res Function(_PartyDetailDto) _then;

/// Create a copy of PartyDetailDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? displayName = freezed,Object? partyType = freezed,Object? recordStatus = freezed,Object? createdAt = freezed,Object? canonicalPartyId = freezed,Object? personProfile = freezed,Object? organizationProfile = freezed,}) {
  return _then(_PartyDetailDto(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,displayName: freezed == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String?,partyType: freezed == partyType ? _self.partyType : partyType // ignore: cast_nullable_to_non_nullable
as String?,recordStatus: freezed == recordStatus ? _self.recordStatus : recordStatus // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,canonicalPartyId: freezed == canonicalPartyId ? _self.canonicalPartyId : canonicalPartyId // ignore: cast_nullable_to_non_nullable
as String?,personProfile: freezed == personProfile ? _self.personProfile : personProfile // ignore: cast_nullable_to_non_nullable
as PersonProfileDto?,organizationProfile: freezed == organizationProfile ? _self.organizationProfile : organizationProfile // ignore: cast_nullable_to_non_nullable
as OrganizationProfileDto?,
  ));
}

/// Create a copy of PartyDetailDto
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
}/// Create a copy of PartyDetailDto
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

// dart format on
