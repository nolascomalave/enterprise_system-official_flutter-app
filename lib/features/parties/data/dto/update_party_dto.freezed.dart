// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_party_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UpdatePartyRequestDto {

@JsonKey(name: 'display_name') String get displayName;@JsonKey(name: 'party_type') String get partyType;@JsonKey(name: 'person_profile', includeIfNull: false) CreatePersonProfileDto? get personProfile;@JsonKey(name: 'organization_profile', includeIfNull: false) CreateOrganizationProfileDto? get organizationProfile;
/// Create a copy of UpdatePartyRequestDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdatePartyRequestDtoCopyWith<UpdatePartyRequestDto> get copyWith => _$UpdatePartyRequestDtoCopyWithImpl<UpdatePartyRequestDto>(this as UpdatePartyRequestDto, _$identity);

  /// Serializes this UpdatePartyRequestDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as UpdatePartyRequestDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdatePartyRequestDto&&(identical(other.displayName, _this.displayName) || other.displayName == _this.displayName)&&(identical(other.partyType, _this.partyType) || other.partyType == _this.partyType)&&(identical(other.personProfile, _this.personProfile) || other.personProfile == _this.personProfile)&&(identical(other.organizationProfile, _this.organizationProfile) || other.organizationProfile == _this.organizationProfile));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as UpdatePartyRequestDto;
  return Object.hash(runtimeType,_this.displayName,_this.partyType,_this.personProfile,_this.organizationProfile);
}

@override
String toString() {
  final _this = this as UpdatePartyRequestDto;
  return 'UpdatePartyRequestDto(displayName: ${_this.displayName}, partyType: ${_this.partyType}, personProfile: ${_this.personProfile}, organizationProfile: ${_this.organizationProfile})';
}


}

/// @nodoc
abstract mixin class $UpdatePartyRequestDtoCopyWith<$Res>  {
  factory $UpdatePartyRequestDtoCopyWith(UpdatePartyRequestDto value, $Res Function(UpdatePartyRequestDto) _then) = _$UpdatePartyRequestDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'display_name') String displayName,@JsonKey(name: 'party_type') String partyType,@JsonKey(name: 'person_profile', includeIfNull: false) CreatePersonProfileDto? personProfile,@JsonKey(name: 'organization_profile', includeIfNull: false) CreateOrganizationProfileDto? organizationProfile
});


$CreatePersonProfileDtoCopyWith<$Res>? get personProfile;$CreateOrganizationProfileDtoCopyWith<$Res>? get organizationProfile;

}
/// @nodoc
class _$UpdatePartyRequestDtoCopyWithImpl<$Res>
    implements $UpdatePartyRequestDtoCopyWith<$Res> {
  _$UpdatePartyRequestDtoCopyWithImpl(this._self, this._then);

  final UpdatePartyRequestDto _self;
  final $Res Function(UpdatePartyRequestDto) _then;

/// Create a copy of UpdatePartyRequestDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? displayName = null,Object? partyType = null,Object? personProfile = freezed,Object? organizationProfile = freezed,}) {
  return _then(UpdatePartyRequestDto(
displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,partyType: null == partyType ? _self.partyType : partyType // ignore: cast_nullable_to_non_nullable
as String,personProfile: freezed == personProfile ? _self.personProfile : personProfile // ignore: cast_nullable_to_non_nullable
as CreatePersonProfileDto?,organizationProfile: freezed == organizationProfile ? _self.organizationProfile : organizationProfile // ignore: cast_nullable_to_non_nullable
as CreateOrganizationProfileDto?,
  ));
}
/// Create a copy of UpdatePartyRequestDto
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
}/// Create a copy of UpdatePartyRequestDto
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


/// Adds pattern-matching-related methods to [UpdatePartyRequestDto].
extension UpdatePartyRequestDtoPatterns on UpdatePartyRequestDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdatePartyRequestDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdatePartyRequestDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdatePartyRequestDto value)  $default,){
final _that = this;
switch (_that) {
case _UpdatePartyRequestDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdatePartyRequestDto value)?  $default,){
final _that = this;
switch (_that) {
case _UpdatePartyRequestDto() when $default != null:
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
case _UpdatePartyRequestDto() when $default != null:
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
case _UpdatePartyRequestDto():
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
case _UpdatePartyRequestDto() when $default != null:
return $default(_that.displayName,_that.partyType,_that.personProfile,_that.organizationProfile);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UpdatePartyRequestDto implements UpdatePartyRequestDto {
  const _UpdatePartyRequestDto({@JsonKey(name: 'display_name') required this.displayName, @JsonKey(name: 'party_type') required this.partyType, @JsonKey(name: 'person_profile', includeIfNull: false) this.personProfile, @JsonKey(name: 'organization_profile', includeIfNull: false) this.organizationProfile});
  factory _UpdatePartyRequestDto.fromJson(Map<String, dynamic> json) => _$UpdatePartyRequestDtoFromJson(json);

@override@JsonKey(name: 'display_name') final  String displayName;
@override@JsonKey(name: 'party_type') final  String partyType;
@override@JsonKey(name: 'person_profile', includeIfNull: false) final  CreatePersonProfileDto? personProfile;
@override@JsonKey(name: 'organization_profile', includeIfNull: false) final  CreateOrganizationProfileDto? organizationProfile;

/// Create a copy of UpdatePartyRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdatePartyRequestDtoCopyWith<_UpdatePartyRequestDto> get copyWith => __$UpdatePartyRequestDtoCopyWithImpl<_UpdatePartyRequestDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdatePartyRequestDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdatePartyRequestDto&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.partyType, partyType) || other.partyType == partyType)&&(identical(other.personProfile, personProfile) || other.personProfile == personProfile)&&(identical(other.organizationProfile, organizationProfile) || other.organizationProfile == organizationProfile));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,displayName,partyType,personProfile,organizationProfile);
}

@override
String toString() {
    return 'UpdatePartyRequestDto(displayName: $displayName, partyType: $partyType, personProfile: $personProfile, organizationProfile: $organizationProfile)';
}


}

/// @nodoc
abstract mixin class _$UpdatePartyRequestDtoCopyWith<$Res> implements $UpdatePartyRequestDtoCopyWith<$Res> {
  factory _$UpdatePartyRequestDtoCopyWith(_UpdatePartyRequestDto value, $Res Function(_UpdatePartyRequestDto) _then) = __$UpdatePartyRequestDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'display_name') String displayName,@JsonKey(name: 'party_type') String partyType,@JsonKey(name: 'person_profile', includeIfNull: false) CreatePersonProfileDto? personProfile,@JsonKey(name: 'organization_profile', includeIfNull: false) CreateOrganizationProfileDto? organizationProfile
});


@override $CreatePersonProfileDtoCopyWith<$Res>? get personProfile;@override $CreateOrganizationProfileDtoCopyWith<$Res>? get organizationProfile;

}
/// @nodoc
class __$UpdatePartyRequestDtoCopyWithImpl<$Res>
    implements _$UpdatePartyRequestDtoCopyWith<$Res> {
  __$UpdatePartyRequestDtoCopyWithImpl(this._self, this._then);

  final _UpdatePartyRequestDto _self;
  final $Res Function(_UpdatePartyRequestDto) _then;

/// Create a copy of UpdatePartyRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? displayName = null,Object? partyType = null,Object? personProfile = freezed,Object? organizationProfile = freezed,}) {
  return _then(_UpdatePartyRequestDto(
displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,partyType: null == partyType ? _self.partyType : partyType // ignore: cast_nullable_to_non_nullable
as String,personProfile: freezed == personProfile ? _self.personProfile : personProfile // ignore: cast_nullable_to_non_nullable
as CreatePersonProfileDto?,organizationProfile: freezed == organizationProfile ? _self.organizationProfile : organizationProfile // ignore: cast_nullable_to_non_nullable
as CreateOrganizationProfileDto?,
  ));
}

/// Create a copy of UpdatePartyRequestDto
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
}/// Create a copy of UpdatePartyRequestDto
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
