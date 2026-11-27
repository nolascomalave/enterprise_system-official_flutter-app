// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'merge_parties_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MergePartiesRequestDto {

@JsonKey(name: 'source_party_id') String get sourcePartyId;@JsonKey(name: 'target_party_id') String get targetPartyId;
/// Create a copy of MergePartiesRequestDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MergePartiesRequestDtoCopyWith<MergePartiesRequestDto> get copyWith => _$MergePartiesRequestDtoCopyWithImpl<MergePartiesRequestDto>(this as MergePartiesRequestDto, _$identity);

  /// Serializes this MergePartiesRequestDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as MergePartiesRequestDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MergePartiesRequestDto&&(identical(other.sourcePartyId, _this.sourcePartyId) || other.sourcePartyId == _this.sourcePartyId)&&(identical(other.targetPartyId, _this.targetPartyId) || other.targetPartyId == _this.targetPartyId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as MergePartiesRequestDto;
  return Object.hash(runtimeType,_this.sourcePartyId,_this.targetPartyId);
}

@override
String toString() {
  final _this = this as MergePartiesRequestDto;
  return 'MergePartiesRequestDto(sourcePartyId: ${_this.sourcePartyId}, targetPartyId: ${_this.targetPartyId})';
}


}

/// @nodoc
abstract mixin class $MergePartiesRequestDtoCopyWith<$Res>  {
  factory $MergePartiesRequestDtoCopyWith(MergePartiesRequestDto value, $Res Function(MergePartiesRequestDto) _then) = _$MergePartiesRequestDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'source_party_id') String sourcePartyId,@JsonKey(name: 'target_party_id') String targetPartyId
});




}
/// @nodoc
class _$MergePartiesRequestDtoCopyWithImpl<$Res>
    implements $MergePartiesRequestDtoCopyWith<$Res> {
  _$MergePartiesRequestDtoCopyWithImpl(this._self, this._then);

  final MergePartiesRequestDto _self;
  final $Res Function(MergePartiesRequestDto) _then;

/// Create a copy of MergePartiesRequestDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sourcePartyId = null,Object? targetPartyId = null,}) {
  return _then(MergePartiesRequestDto(
sourcePartyId: null == sourcePartyId ? _self.sourcePartyId : sourcePartyId // ignore: cast_nullable_to_non_nullable
as String,targetPartyId: null == targetPartyId ? _self.targetPartyId : targetPartyId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [MergePartiesRequestDto].
extension MergePartiesRequestDtoPatterns on MergePartiesRequestDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MergePartiesRequestDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MergePartiesRequestDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MergePartiesRequestDto value)  $default,){
final _that = this;
switch (_that) {
case _MergePartiesRequestDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MergePartiesRequestDto value)?  $default,){
final _that = this;
switch (_that) {
case _MergePartiesRequestDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'source_party_id')  String sourcePartyId, @JsonKey(name: 'target_party_id')  String targetPartyId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MergePartiesRequestDto() when $default != null:
return $default(_that.sourcePartyId,_that.targetPartyId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'source_party_id')  String sourcePartyId, @JsonKey(name: 'target_party_id')  String targetPartyId)  $default,) {final _that = this;
switch (_that) {
case _MergePartiesRequestDto():
return $default(_that.sourcePartyId,_that.targetPartyId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'source_party_id')  String sourcePartyId, @JsonKey(name: 'target_party_id')  String targetPartyId)?  $default,) {final _that = this;
switch (_that) {
case _MergePartiesRequestDto() when $default != null:
return $default(_that.sourcePartyId,_that.targetPartyId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MergePartiesRequestDto implements MergePartiesRequestDto {
  const _MergePartiesRequestDto({@JsonKey(name: 'source_party_id') required this.sourcePartyId, @JsonKey(name: 'target_party_id') required this.targetPartyId});
  factory _MergePartiesRequestDto.fromJson(Map<String, dynamic> json) => _$MergePartiesRequestDtoFromJson(json);

@override@JsonKey(name: 'source_party_id') final  String sourcePartyId;
@override@JsonKey(name: 'target_party_id') final  String targetPartyId;

/// Create a copy of MergePartiesRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MergePartiesRequestDtoCopyWith<_MergePartiesRequestDto> get copyWith => __$MergePartiesRequestDtoCopyWithImpl<_MergePartiesRequestDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MergePartiesRequestDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _MergePartiesRequestDto&&(identical(other.sourcePartyId, sourcePartyId) || other.sourcePartyId == sourcePartyId)&&(identical(other.targetPartyId, targetPartyId) || other.targetPartyId == targetPartyId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,sourcePartyId,targetPartyId);
}

@override
String toString() {
    return 'MergePartiesRequestDto(sourcePartyId: $sourcePartyId, targetPartyId: $targetPartyId)';
}


}

/// @nodoc
abstract mixin class _$MergePartiesRequestDtoCopyWith<$Res> implements $MergePartiesRequestDtoCopyWith<$Res> {
  factory _$MergePartiesRequestDtoCopyWith(_MergePartiesRequestDto value, $Res Function(_MergePartiesRequestDto) _then) = __$MergePartiesRequestDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'source_party_id') String sourcePartyId,@JsonKey(name: 'target_party_id') String targetPartyId
});




}
/// @nodoc
class __$MergePartiesRequestDtoCopyWithImpl<$Res>
    implements _$MergePartiesRequestDtoCopyWith<$Res> {
  __$MergePartiesRequestDtoCopyWithImpl(this._self, this._then);

  final _MergePartiesRequestDto _self;
  final $Res Function(_MergePartiesRequestDto) _then;

/// Create a copy of MergePartiesRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sourcePartyId = null,Object? targetPartyId = null,}) {
  return _then(_MergePartiesRequestDto(
sourcePartyId: null == sourcePartyId ? _self.sourcePartyId : sourcePartyId // ignore: cast_nullable_to_non_nullable
as String,targetPartyId: null == targetPartyId ? _self.targetPartyId : targetPartyId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$MergePartiesResponseDto {

@JsonKey(name: 'source_id') String? get sourceId;@JsonKey(name: 'target_id') String? get targetId;@JsonKey(name: 'compressed_party_ids') List<String> get compressedPartyIds;@JsonKey(name: 'merged_at') String? get mergedAt;
/// Create a copy of MergePartiesResponseDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MergePartiesResponseDtoCopyWith<MergePartiesResponseDto> get copyWith => _$MergePartiesResponseDtoCopyWithImpl<MergePartiesResponseDto>(this as MergePartiesResponseDto, _$identity);

  /// Serializes this MergePartiesResponseDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as MergePartiesResponseDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MergePartiesResponseDto&&(identical(other.sourceId, _this.sourceId) || other.sourceId == _this.sourceId)&&(identical(other.targetId, _this.targetId) || other.targetId == _this.targetId)&&const DeepCollectionEquality().equals(other.compressedPartyIds, _this.compressedPartyIds)&&(identical(other.mergedAt, _this.mergedAt) || other.mergedAt == _this.mergedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as MergePartiesResponseDto;
  return Object.hash(runtimeType,_this.sourceId,_this.targetId,const DeepCollectionEquality().hash(_this.compressedPartyIds),_this.mergedAt);
}

@override
String toString() {
  final _this = this as MergePartiesResponseDto;
  return 'MergePartiesResponseDto(sourceId: ${_this.sourceId}, targetId: ${_this.targetId}, compressedPartyIds: ${_this.compressedPartyIds}, mergedAt: ${_this.mergedAt})';
}


}

/// @nodoc
abstract mixin class $MergePartiesResponseDtoCopyWith<$Res>  {
  factory $MergePartiesResponseDtoCopyWith(MergePartiesResponseDto value, $Res Function(MergePartiesResponseDto) _then) = _$MergePartiesResponseDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'source_id') String? sourceId,@JsonKey(name: 'target_id') String? targetId,@JsonKey(name: 'compressed_party_ids') List<String> compressedPartyIds,@JsonKey(name: 'merged_at') String? mergedAt
});




}
/// @nodoc
class _$MergePartiesResponseDtoCopyWithImpl<$Res>
    implements $MergePartiesResponseDtoCopyWith<$Res> {
  _$MergePartiesResponseDtoCopyWithImpl(this._self, this._then);

  final MergePartiesResponseDto _self;
  final $Res Function(MergePartiesResponseDto) _then;

/// Create a copy of MergePartiesResponseDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sourceId = freezed,Object? targetId = freezed,Object? compressedPartyIds = null,Object? mergedAt = freezed,}) {
  return _then(MergePartiesResponseDto(
sourceId: freezed == sourceId ? _self.sourceId : sourceId // ignore: cast_nullable_to_non_nullable
as String?,targetId: freezed == targetId ? _self.targetId : targetId // ignore: cast_nullable_to_non_nullable
as String?,compressedPartyIds: null == compressedPartyIds ? _self.compressedPartyIds : compressedPartyIds // ignore: cast_nullable_to_non_nullable
as List<String>,mergedAt: freezed == mergedAt ? _self.mergedAt : mergedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [MergePartiesResponseDto].
extension MergePartiesResponseDtoPatterns on MergePartiesResponseDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MergePartiesResponseDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MergePartiesResponseDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MergePartiesResponseDto value)  $default,){
final _that = this;
switch (_that) {
case _MergePartiesResponseDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MergePartiesResponseDto value)?  $default,){
final _that = this;
switch (_that) {
case _MergePartiesResponseDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'source_id')  String? sourceId, @JsonKey(name: 'target_id')  String? targetId, @JsonKey(name: 'compressed_party_ids')  List<String> compressedPartyIds, @JsonKey(name: 'merged_at')  String? mergedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MergePartiesResponseDto() when $default != null:
return $default(_that.sourceId,_that.targetId,_that.compressedPartyIds,_that.mergedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'source_id')  String? sourceId, @JsonKey(name: 'target_id')  String? targetId, @JsonKey(name: 'compressed_party_ids')  List<String> compressedPartyIds, @JsonKey(name: 'merged_at')  String? mergedAt)  $default,) {final _that = this;
switch (_that) {
case _MergePartiesResponseDto():
return $default(_that.sourceId,_that.targetId,_that.compressedPartyIds,_that.mergedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'source_id')  String? sourceId, @JsonKey(name: 'target_id')  String? targetId, @JsonKey(name: 'compressed_party_ids')  List<String> compressedPartyIds, @JsonKey(name: 'merged_at')  String? mergedAt)?  $default,) {final _that = this;
switch (_that) {
case _MergePartiesResponseDto() when $default != null:
return $default(_that.sourceId,_that.targetId,_that.compressedPartyIds,_that.mergedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MergePartiesResponseDto implements MergePartiesResponseDto {
  const _MergePartiesResponseDto({@JsonKey(name: 'source_id') this.sourceId, @JsonKey(name: 'target_id') this.targetId, @JsonKey(name: 'compressed_party_ids')  List<String> compressedPartyIds = const <String>[], @JsonKey(name: 'merged_at') this.mergedAt}): _compressedPartyIds = compressedPartyIds;
  factory _MergePartiesResponseDto.fromJson(Map<String, dynamic> json) => _$MergePartiesResponseDtoFromJson(json);

@override@JsonKey(name: 'source_id') final  String? sourceId;
@override@JsonKey(name: 'target_id') final  String? targetId;
 final  List<String> _compressedPartyIds;
@override@JsonKey(name: 'compressed_party_ids') List<String> get compressedPartyIds {
  if (_compressedPartyIds is EqualUnmodifiableListView) return _compressedPartyIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_compressedPartyIds);
}

@override@JsonKey(name: 'merged_at') final  String? mergedAt;

/// Create a copy of MergePartiesResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MergePartiesResponseDtoCopyWith<_MergePartiesResponseDto> get copyWith => __$MergePartiesResponseDtoCopyWithImpl<_MergePartiesResponseDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MergePartiesResponseDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _MergePartiesResponseDto&&(identical(other.sourceId, sourceId) || other.sourceId == sourceId)&&(identical(other.targetId, targetId) || other.targetId == targetId)&&const DeepCollectionEquality().equals(other.compressedPartyIds, _compressedPartyIds)&&(identical(other.mergedAt, mergedAt) || other.mergedAt == mergedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,sourceId,targetId,const DeepCollectionEquality().hash(_compressedPartyIds),mergedAt);
}

@override
String toString() {
    return 'MergePartiesResponseDto(sourceId: $sourceId, targetId: $targetId, compressedPartyIds: $compressedPartyIds, mergedAt: $mergedAt)';
}


}

/// @nodoc
abstract mixin class _$MergePartiesResponseDtoCopyWith<$Res> implements $MergePartiesResponseDtoCopyWith<$Res> {
  factory _$MergePartiesResponseDtoCopyWith(_MergePartiesResponseDto value, $Res Function(_MergePartiesResponseDto) _then) = __$MergePartiesResponseDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'source_id') String? sourceId,@JsonKey(name: 'target_id') String? targetId,@JsonKey(name: 'compressed_party_ids') List<String> compressedPartyIds,@JsonKey(name: 'merged_at') String? mergedAt
});




}
/// @nodoc
class __$MergePartiesResponseDtoCopyWithImpl<$Res>
    implements _$MergePartiesResponseDtoCopyWith<$Res> {
  __$MergePartiesResponseDtoCopyWithImpl(this._self, this._then);

  final _MergePartiesResponseDto _self;
  final $Res Function(_MergePartiesResponseDto) _then;

/// Create a copy of MergePartiesResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sourceId = freezed,Object? targetId = freezed,Object? compressedPartyIds = null,Object? mergedAt = freezed,}) {
  return _then(_MergePartiesResponseDto(
sourceId: freezed == sourceId ? _self.sourceId : sourceId // ignore: cast_nullable_to_non_nullable
as String?,targetId: freezed == targetId ? _self.targetId : targetId // ignore: cast_nullable_to_non_nullable
as String?,compressedPartyIds: null == compressedPartyIds ? _self._compressedPartyIds : compressedPartyIds // ignore: cast_nullable_to_non_nullable
as List<String>,mergedAt: freezed == mergedAt ? _self.mergedAt : mergedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
