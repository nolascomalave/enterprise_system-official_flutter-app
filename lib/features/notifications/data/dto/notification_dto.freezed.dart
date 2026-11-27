// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NotificationDto {

 String get id; String get type; String get title; String get body;@JsonKey(name: 'resource_type') String get resourceType;@JsonKey(name: 'resource_id') String? get resourceId;@JsonKey(name: 'created_at') DateTime get createdAt;@JsonKey(name: 'is_read') bool get isRead;
/// Create a copy of NotificationDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationDtoCopyWith<NotificationDto> get copyWith => _$NotificationDtoCopyWithImpl<NotificationDto>(this as NotificationDto, _$identity);

  /// Serializes this NotificationDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as NotificationDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationDto&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.body, _this.body) || other.body == _this.body)&&(identical(other.resourceType, _this.resourceType) || other.resourceType == _this.resourceType)&&(identical(other.resourceId, _this.resourceId) || other.resourceId == _this.resourceId)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.isRead, _this.isRead) || other.isRead == _this.isRead));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as NotificationDto;
  return Object.hash(runtimeType,_this.id,_this.type,_this.title,_this.body,_this.resourceType,_this.resourceId,_this.createdAt,_this.isRead);
}

@override
String toString() {
  final _this = this as NotificationDto;
  return 'NotificationDto(id: ${_this.id}, type: ${_this.type}, title: ${_this.title}, body: ${_this.body}, resourceType: ${_this.resourceType}, resourceId: ${_this.resourceId}, createdAt: ${_this.createdAt}, isRead: ${_this.isRead})';
}


}

/// @nodoc
abstract mixin class $NotificationDtoCopyWith<$Res>  {
  factory $NotificationDtoCopyWith(NotificationDto value, $Res Function(NotificationDto) _then) = _$NotificationDtoCopyWithImpl;
@useResult
$Res call({
 String id, String type, String title, String body,@JsonKey(name: 'resource_type') String resourceType,@JsonKey(name: 'resource_id') String? resourceId,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'is_read') bool isRead
});




}
/// @nodoc
class _$NotificationDtoCopyWithImpl<$Res>
    implements $NotificationDtoCopyWith<$Res> {
  _$NotificationDtoCopyWithImpl(this._self, this._then);

  final NotificationDto _self;
  final $Res Function(NotificationDto) _then;

/// Create a copy of NotificationDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? type = null,Object? title = null,Object? body = null,Object? resourceType = null,Object? resourceId = freezed,Object? createdAt = null,Object? isRead = null,}) {
  return _then(NotificationDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,resourceType: null == resourceType ? _self.resourceType : resourceType // ignore: cast_nullable_to_non_nullable
as String,resourceId: freezed == resourceId ? _self.resourceId : resourceId // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,isRead: null == isRead ? _self.isRead : isRead // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [NotificationDto].
extension NotificationDtoPatterns on NotificationDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NotificationDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NotificationDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NotificationDto value)  $default,){
final _that = this;
switch (_that) {
case _NotificationDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NotificationDto value)?  $default,){
final _that = this;
switch (_that) {
case _NotificationDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String type,  String title,  String body, @JsonKey(name: 'resource_type')  String resourceType, @JsonKey(name: 'resource_id')  String? resourceId, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'is_read')  bool isRead)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NotificationDto() when $default != null:
return $default(_that.id,_that.type,_that.title,_that.body,_that.resourceType,_that.resourceId,_that.createdAt,_that.isRead);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String type,  String title,  String body, @JsonKey(name: 'resource_type')  String resourceType, @JsonKey(name: 'resource_id')  String? resourceId, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'is_read')  bool isRead)  $default,) {final _that = this;
switch (_that) {
case _NotificationDto():
return $default(_that.id,_that.type,_that.title,_that.body,_that.resourceType,_that.resourceId,_that.createdAt,_that.isRead);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String type,  String title,  String body, @JsonKey(name: 'resource_type')  String resourceType, @JsonKey(name: 'resource_id')  String? resourceId, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'is_read')  bool isRead)?  $default,) {final _that = this;
switch (_that) {
case _NotificationDto() when $default != null:
return $default(_that.id,_that.type,_that.title,_that.body,_that.resourceType,_that.resourceId,_that.createdAt,_that.isRead);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NotificationDto implements NotificationDto {
  const _NotificationDto({required this.id, this.type = '', this.title = '', this.body = '', @JsonKey(name: 'resource_type') this.resourceType = '', @JsonKey(name: 'resource_id') this.resourceId, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'is_read') this.isRead = false});
  factory _NotificationDto.fromJson(Map<String, dynamic> json) => _$NotificationDtoFromJson(json);

@override final  String id;
@override@JsonKey() final  String type;
@override@JsonKey() final  String title;
@override@JsonKey() final  String body;
@override@JsonKey(name: 'resource_type') final  String resourceType;
@override@JsonKey(name: 'resource_id') final  String? resourceId;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;
@override@JsonKey(name: 'is_read') final  bool isRead;

/// Create a copy of NotificationDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NotificationDtoCopyWith<_NotificationDto> get copyWith => __$NotificationDtoCopyWithImpl<_NotificationDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NotificationDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotificationDto&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.title, title) || other.title == title)&&(identical(other.body, body) || other.body == body)&&(identical(other.resourceType, resourceType) || other.resourceType == resourceType)&&(identical(other.resourceId, resourceId) || other.resourceId == resourceId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.isRead, isRead) || other.isRead == isRead));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,type,title,body,resourceType,resourceId,createdAt,isRead);
}

@override
String toString() {
    return 'NotificationDto(id: $id, type: $type, title: $title, body: $body, resourceType: $resourceType, resourceId: $resourceId, createdAt: $createdAt, isRead: $isRead)';
}


}

/// @nodoc
abstract mixin class _$NotificationDtoCopyWith<$Res> implements $NotificationDtoCopyWith<$Res> {
  factory _$NotificationDtoCopyWith(_NotificationDto value, $Res Function(_NotificationDto) _then) = __$NotificationDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String type, String title, String body,@JsonKey(name: 'resource_type') String resourceType,@JsonKey(name: 'resource_id') String? resourceId,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'is_read') bool isRead
});




}
/// @nodoc
class __$NotificationDtoCopyWithImpl<$Res>
    implements _$NotificationDtoCopyWith<$Res> {
  __$NotificationDtoCopyWithImpl(this._self, this._then);

  final _NotificationDto _self;
  final $Res Function(_NotificationDto) _then;

/// Create a copy of NotificationDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? type = null,Object? title = null,Object? body = null,Object? resourceType = null,Object? resourceId = freezed,Object? createdAt = null,Object? isRead = null,}) {
  return _then(_NotificationDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,resourceType: null == resourceType ? _self.resourceType : resourceType // ignore: cast_nullable_to_non_nullable
as String,resourceId: freezed == resourceId ? _self.resourceId : resourceId // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,isRead: null == isRead ? _self.isRead : isRead // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$NotificationListMetaDto {

 int get limit; int get offset; int get total;
/// Create a copy of NotificationListMetaDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationListMetaDtoCopyWith<NotificationListMetaDto> get copyWith => _$NotificationListMetaDtoCopyWithImpl<NotificationListMetaDto>(this as NotificationListMetaDto, _$identity);

  /// Serializes this NotificationListMetaDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as NotificationListMetaDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationListMetaDto&&(identical(other.limit, _this.limit) || other.limit == _this.limit)&&(identical(other.offset, _this.offset) || other.offset == _this.offset)&&(identical(other.total, _this.total) || other.total == _this.total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as NotificationListMetaDto;
  return Object.hash(runtimeType,_this.limit,_this.offset,_this.total);
}

@override
String toString() {
  final _this = this as NotificationListMetaDto;
  return 'NotificationListMetaDto(limit: ${_this.limit}, offset: ${_this.offset}, total: ${_this.total})';
}


}

/// @nodoc
abstract mixin class $NotificationListMetaDtoCopyWith<$Res>  {
  factory $NotificationListMetaDtoCopyWith(NotificationListMetaDto value, $Res Function(NotificationListMetaDto) _then) = _$NotificationListMetaDtoCopyWithImpl;
@useResult
$Res call({
 int limit, int offset, int total
});




}
/// @nodoc
class _$NotificationListMetaDtoCopyWithImpl<$Res>
    implements $NotificationListMetaDtoCopyWith<$Res> {
  _$NotificationListMetaDtoCopyWithImpl(this._self, this._then);

  final NotificationListMetaDto _self;
  final $Res Function(NotificationListMetaDto) _then;

/// Create a copy of NotificationListMetaDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? limit = null,Object? offset = null,Object? total = null,}) {
  return _then(NotificationListMetaDto(
limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,offset: null == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [NotificationListMetaDto].
extension NotificationListMetaDtoPatterns on NotificationListMetaDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NotificationListMetaDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NotificationListMetaDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NotificationListMetaDto value)  $default,){
final _that = this;
switch (_that) {
case _NotificationListMetaDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NotificationListMetaDto value)?  $default,){
final _that = this;
switch (_that) {
case _NotificationListMetaDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int limit,  int offset,  int total)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NotificationListMetaDto() when $default != null:
return $default(_that.limit,_that.offset,_that.total);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int limit,  int offset,  int total)  $default,) {final _that = this;
switch (_that) {
case _NotificationListMetaDto():
return $default(_that.limit,_that.offset,_that.total);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int limit,  int offset,  int total)?  $default,) {final _that = this;
switch (_that) {
case _NotificationListMetaDto() when $default != null:
return $default(_that.limit,_that.offset,_that.total);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NotificationListMetaDto implements NotificationListMetaDto {
  const _NotificationListMetaDto({this.limit = 0, this.offset = 0, this.total = 0});
  factory _NotificationListMetaDto.fromJson(Map<String, dynamic> json) => _$NotificationListMetaDtoFromJson(json);

@override@JsonKey() final  int limit;
@override@JsonKey() final  int offset;
@override@JsonKey() final  int total;

/// Create a copy of NotificationListMetaDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NotificationListMetaDtoCopyWith<_NotificationListMetaDto> get copyWith => __$NotificationListMetaDtoCopyWithImpl<_NotificationListMetaDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NotificationListMetaDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotificationListMetaDto&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.offset, offset) || other.offset == offset)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,limit,offset,total);
}

@override
String toString() {
    return 'NotificationListMetaDto(limit: $limit, offset: $offset, total: $total)';
}


}

/// @nodoc
abstract mixin class _$NotificationListMetaDtoCopyWith<$Res> implements $NotificationListMetaDtoCopyWith<$Res> {
  factory _$NotificationListMetaDtoCopyWith(_NotificationListMetaDto value, $Res Function(_NotificationListMetaDto) _then) = __$NotificationListMetaDtoCopyWithImpl;
@override @useResult
$Res call({
 int limit, int offset, int total
});




}
/// @nodoc
class __$NotificationListMetaDtoCopyWithImpl<$Res>
    implements _$NotificationListMetaDtoCopyWith<$Res> {
  __$NotificationListMetaDtoCopyWithImpl(this._self, this._then);

  final _NotificationListMetaDto _self;
  final $Res Function(_NotificationListMetaDto) _then;

/// Create a copy of NotificationListMetaDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? limit = null,Object? offset = null,Object? total = null,}) {
  return _then(_NotificationListMetaDto(
limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,offset: null == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$NotificationListEnvelopeDto {

 List<NotificationDto> get data; NotificationListMetaDto get meta;
/// Create a copy of NotificationListEnvelopeDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationListEnvelopeDtoCopyWith<NotificationListEnvelopeDto> get copyWith => _$NotificationListEnvelopeDtoCopyWithImpl<NotificationListEnvelopeDto>(this as NotificationListEnvelopeDto, _$identity);

  /// Serializes this NotificationListEnvelopeDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as NotificationListEnvelopeDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationListEnvelopeDto&&const DeepCollectionEquality().equals(other.data, _this.data)&&(identical(other.meta, _this.meta) || other.meta == _this.meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as NotificationListEnvelopeDto;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.data),_this.meta);
}

@override
String toString() {
  final _this = this as NotificationListEnvelopeDto;
  return 'NotificationListEnvelopeDto(data: ${_this.data}, meta: ${_this.meta})';
}


}

/// @nodoc
abstract mixin class $NotificationListEnvelopeDtoCopyWith<$Res>  {
  factory $NotificationListEnvelopeDtoCopyWith(NotificationListEnvelopeDto value, $Res Function(NotificationListEnvelopeDto) _then) = _$NotificationListEnvelopeDtoCopyWithImpl;
@useResult
$Res call({
 List<NotificationDto> data, NotificationListMetaDto meta
});


$NotificationListMetaDtoCopyWith<$Res> get meta;

}
/// @nodoc
class _$NotificationListEnvelopeDtoCopyWithImpl<$Res>
    implements $NotificationListEnvelopeDtoCopyWith<$Res> {
  _$NotificationListEnvelopeDtoCopyWithImpl(this._self, this._then);

  final NotificationListEnvelopeDto _self;
  final $Res Function(NotificationListEnvelopeDto) _then;

/// Create a copy of NotificationListEnvelopeDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,Object? meta = null,}) {
  return _then(NotificationListEnvelopeDto(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<NotificationDto>,meta: null == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as NotificationListMetaDto,
  ));
}
/// Create a copy of NotificationListEnvelopeDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NotificationListMetaDtoCopyWith<$Res> get meta {
  
  return $NotificationListMetaDtoCopyWith<$Res>(_self.meta, (value) {
    return _then(_self.copyWith(meta: value));
  });
}
}


/// Adds pattern-matching-related methods to [NotificationListEnvelopeDto].
extension NotificationListEnvelopeDtoPatterns on NotificationListEnvelopeDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NotificationListEnvelopeDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NotificationListEnvelopeDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NotificationListEnvelopeDto value)  $default,){
final _that = this;
switch (_that) {
case _NotificationListEnvelopeDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NotificationListEnvelopeDto value)?  $default,){
final _that = this;
switch (_that) {
case _NotificationListEnvelopeDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<NotificationDto> data,  NotificationListMetaDto meta)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NotificationListEnvelopeDto() when $default != null:
return $default(_that.data,_that.meta);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<NotificationDto> data,  NotificationListMetaDto meta)  $default,) {final _that = this;
switch (_that) {
case _NotificationListEnvelopeDto():
return $default(_that.data,_that.meta);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<NotificationDto> data,  NotificationListMetaDto meta)?  $default,) {final _that = this;
switch (_that) {
case _NotificationListEnvelopeDto() when $default != null:
return $default(_that.data,_that.meta);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NotificationListEnvelopeDto implements NotificationListEnvelopeDto {
  const _NotificationListEnvelopeDto({ List<NotificationDto> data = const <NotificationDto>[], this.meta = const NotificationListMetaDto()}): _data = data;
  factory _NotificationListEnvelopeDto.fromJson(Map<String, dynamic> json) => _$NotificationListEnvelopeDtoFromJson(json);

 final  List<NotificationDto> _data;
@override@JsonKey() List<NotificationDto> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}

@override@JsonKey() final  NotificationListMetaDto meta;

/// Create a copy of NotificationListEnvelopeDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NotificationListEnvelopeDtoCopyWith<_NotificationListEnvelopeDto> get copyWith => __$NotificationListEnvelopeDtoCopyWithImpl<_NotificationListEnvelopeDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NotificationListEnvelopeDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotificationListEnvelopeDto&&const DeepCollectionEquality().equals(other.data, _data)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_data),meta);
}

@override
String toString() {
    return 'NotificationListEnvelopeDto(data: $data, meta: $meta)';
}


}

/// @nodoc
abstract mixin class _$NotificationListEnvelopeDtoCopyWith<$Res> implements $NotificationListEnvelopeDtoCopyWith<$Res> {
  factory _$NotificationListEnvelopeDtoCopyWith(_NotificationListEnvelopeDto value, $Res Function(_NotificationListEnvelopeDto) _then) = __$NotificationListEnvelopeDtoCopyWithImpl;
@override @useResult
$Res call({
 List<NotificationDto> data, NotificationListMetaDto meta
});


@override $NotificationListMetaDtoCopyWith<$Res> get meta;

}
/// @nodoc
class __$NotificationListEnvelopeDtoCopyWithImpl<$Res>
    implements _$NotificationListEnvelopeDtoCopyWith<$Res> {
  __$NotificationListEnvelopeDtoCopyWithImpl(this._self, this._then);

  final _NotificationListEnvelopeDto _self;
  final $Res Function(_NotificationListEnvelopeDto) _then;

/// Create a copy of NotificationListEnvelopeDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,Object? meta = null,}) {
  return _then(_NotificationListEnvelopeDto(
data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<NotificationDto>,meta: null == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as NotificationListMetaDto,
  ));
}

/// Create a copy of NotificationListEnvelopeDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NotificationListMetaDtoCopyWith<$Res> get meta {
  
  return $NotificationListMetaDtoCopyWith<$Res>(_self.meta, (value) {
    return _then(_self.copyWith(meta: value));
  });
}
}

// dart format on
