// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'relationship_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TenantRelationshipDto {

 String? get id; String? get status;@JsonKey(name: 'holding_id') String? get holdingId;@JsonKey(name: 'subsidiary_id') String? get subsidiaryId;@JsonKey(name: 'tenant_id_holding') String? get tenantIdHolding;@JsonKey(name: 'tenant_id_subsidiary') String? get tenantIdSubsidiary;@JsonKey(name: 'holding_tenant_id') String? get holdingTenantId;@JsonKey(name: 'subsidiary_tenant_id') String? get subsidiaryTenantId;@JsonKey(name: 'holding_name') String? get holdingName;@JsonKey(name: 'subsidiary_name') String? get subsidiaryName;@JsonKey(name: 'created_at') String? get createdAt;@JsonKey(name: 'updated_at') String? get updatedAt;@JsonKey(name: 'requested_at') String? get requestedAt;@JsonKey(name: 'approved_at') String? get approvedAt;@JsonKey(name: 'rejected_at') String? get rejectedAt;@JsonKey(name: 'canceled_at') String? get canceledAt;@JsonKey(name: 'ends_at') String? get endsAt;@JsonKey(name: 'token_emitted_at') String? get tokenEmittedAt;@JsonKey(name: 'issued_at') String? get issuedAt;@JsonKey(name: 'revoked_at') String? get revokedAt;@JsonKey(name: 'rejection_reason') String? get rejectionReason;@JsonKey(name: 'revocation_reason') String? get revocationReason;@JsonKey(name: 'cancellation_reason') String? get cancellationReason;
/// Create a copy of TenantRelationshipDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TenantRelationshipDtoCopyWith<TenantRelationshipDto> get copyWith => _$TenantRelationshipDtoCopyWithImpl<TenantRelationshipDto>(this as TenantRelationshipDto, _$identity);

  /// Serializes this TenantRelationshipDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as TenantRelationshipDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TenantRelationshipDto&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.holdingId, _this.holdingId) || other.holdingId == _this.holdingId)&&(identical(other.subsidiaryId, _this.subsidiaryId) || other.subsidiaryId == _this.subsidiaryId)&&(identical(other.tenantIdHolding, _this.tenantIdHolding) || other.tenantIdHolding == _this.tenantIdHolding)&&(identical(other.tenantIdSubsidiary, _this.tenantIdSubsidiary) || other.tenantIdSubsidiary == _this.tenantIdSubsidiary)&&(identical(other.holdingTenantId, _this.holdingTenantId) || other.holdingTenantId == _this.holdingTenantId)&&(identical(other.subsidiaryTenantId, _this.subsidiaryTenantId) || other.subsidiaryTenantId == _this.subsidiaryTenantId)&&(identical(other.holdingName, _this.holdingName) || other.holdingName == _this.holdingName)&&(identical(other.subsidiaryName, _this.subsidiaryName) || other.subsidiaryName == _this.subsidiaryName)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt)&&(identical(other.requestedAt, _this.requestedAt) || other.requestedAt == _this.requestedAt)&&(identical(other.approvedAt, _this.approvedAt) || other.approvedAt == _this.approvedAt)&&(identical(other.rejectedAt, _this.rejectedAt) || other.rejectedAt == _this.rejectedAt)&&(identical(other.canceledAt, _this.canceledAt) || other.canceledAt == _this.canceledAt)&&(identical(other.endsAt, _this.endsAt) || other.endsAt == _this.endsAt)&&(identical(other.tokenEmittedAt, _this.tokenEmittedAt) || other.tokenEmittedAt == _this.tokenEmittedAt)&&(identical(other.issuedAt, _this.issuedAt) || other.issuedAt == _this.issuedAt)&&(identical(other.revokedAt, _this.revokedAt) || other.revokedAt == _this.revokedAt)&&(identical(other.rejectionReason, _this.rejectionReason) || other.rejectionReason == _this.rejectionReason)&&(identical(other.revocationReason, _this.revocationReason) || other.revocationReason == _this.revocationReason)&&(identical(other.cancellationReason, _this.cancellationReason) || other.cancellationReason == _this.cancellationReason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as TenantRelationshipDto;
  return Object.hashAll([runtimeType,_this.id,_this.status,_this.holdingId,_this.subsidiaryId,_this.tenantIdHolding,_this.tenantIdSubsidiary,_this.holdingTenantId,_this.subsidiaryTenantId,_this.holdingName,_this.subsidiaryName,_this.createdAt,_this.updatedAt,_this.requestedAt,_this.approvedAt,_this.rejectedAt,_this.canceledAt,_this.endsAt,_this.tokenEmittedAt,_this.issuedAt,_this.revokedAt,_this.rejectionReason,_this.revocationReason,_this.cancellationReason]);
}

@override
String toString() {
  final _this = this as TenantRelationshipDto;
  return 'TenantRelationshipDto(id: ${_this.id}, status: ${_this.status}, holdingId: ${_this.holdingId}, subsidiaryId: ${_this.subsidiaryId}, tenantIdHolding: ${_this.tenantIdHolding}, tenantIdSubsidiary: ${_this.tenantIdSubsidiary}, holdingTenantId: ${_this.holdingTenantId}, subsidiaryTenantId: ${_this.subsidiaryTenantId}, holdingName: ${_this.holdingName}, subsidiaryName: ${_this.subsidiaryName}, createdAt: ${_this.createdAt}, updatedAt: ${_this.updatedAt}, requestedAt: ${_this.requestedAt}, approvedAt: ${_this.approvedAt}, rejectedAt: ${_this.rejectedAt}, canceledAt: ${_this.canceledAt}, endsAt: ${_this.endsAt}, tokenEmittedAt: ${_this.tokenEmittedAt}, issuedAt: ${_this.issuedAt}, revokedAt: ${_this.revokedAt}, rejectionReason: ${_this.rejectionReason}, revocationReason: ${_this.revocationReason}, cancellationReason: ${_this.cancellationReason})';
}


}

/// @nodoc
abstract mixin class $TenantRelationshipDtoCopyWith<$Res>  {
  factory $TenantRelationshipDtoCopyWith(TenantRelationshipDto value, $Res Function(TenantRelationshipDto) _then) = _$TenantRelationshipDtoCopyWithImpl;
@useResult
$Res call({
 String? id, String? status,@JsonKey(name: 'holding_id') String? holdingId,@JsonKey(name: 'subsidiary_id') String? subsidiaryId,@JsonKey(name: 'tenant_id_holding') String? tenantIdHolding,@JsonKey(name: 'tenant_id_subsidiary') String? tenantIdSubsidiary,@JsonKey(name: 'holding_tenant_id') String? holdingTenantId,@JsonKey(name: 'subsidiary_tenant_id') String? subsidiaryTenantId,@JsonKey(name: 'holding_name') String? holdingName,@JsonKey(name: 'subsidiary_name') String? subsidiaryName,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt,@JsonKey(name: 'requested_at') String? requestedAt,@JsonKey(name: 'approved_at') String? approvedAt,@JsonKey(name: 'rejected_at') String? rejectedAt,@JsonKey(name: 'canceled_at') String? canceledAt,@JsonKey(name: 'ends_at') String? endsAt,@JsonKey(name: 'token_emitted_at') String? tokenEmittedAt,@JsonKey(name: 'issued_at') String? issuedAt,@JsonKey(name: 'revoked_at') String? revokedAt,@JsonKey(name: 'rejection_reason') String? rejectionReason,@JsonKey(name: 'revocation_reason') String? revocationReason,@JsonKey(name: 'cancellation_reason') String? cancellationReason
});




}
/// @nodoc
class _$TenantRelationshipDtoCopyWithImpl<$Res>
    implements $TenantRelationshipDtoCopyWith<$Res> {
  _$TenantRelationshipDtoCopyWithImpl(this._self, this._then);

  final TenantRelationshipDto _self;
  final $Res Function(TenantRelationshipDto) _then;

/// Create a copy of TenantRelationshipDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? status = freezed,Object? holdingId = freezed,Object? subsidiaryId = freezed,Object? tenantIdHolding = freezed,Object? tenantIdSubsidiary = freezed,Object? holdingTenantId = freezed,Object? subsidiaryTenantId = freezed,Object? holdingName = freezed,Object? subsidiaryName = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? requestedAt = freezed,Object? approvedAt = freezed,Object? rejectedAt = freezed,Object? canceledAt = freezed,Object? endsAt = freezed,Object? tokenEmittedAt = freezed,Object? issuedAt = freezed,Object? revokedAt = freezed,Object? rejectionReason = freezed,Object? revocationReason = freezed,Object? cancellationReason = freezed,}) {
  return _then(TenantRelationshipDto(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,holdingId: freezed == holdingId ? _self.holdingId : holdingId // ignore: cast_nullable_to_non_nullable
as String?,subsidiaryId: freezed == subsidiaryId ? _self.subsidiaryId : subsidiaryId // ignore: cast_nullable_to_non_nullable
as String?,tenantIdHolding: freezed == tenantIdHolding ? _self.tenantIdHolding : tenantIdHolding // ignore: cast_nullable_to_non_nullable
as String?,tenantIdSubsidiary: freezed == tenantIdSubsidiary ? _self.tenantIdSubsidiary : tenantIdSubsidiary // ignore: cast_nullable_to_non_nullable
as String?,holdingTenantId: freezed == holdingTenantId ? _self.holdingTenantId : holdingTenantId // ignore: cast_nullable_to_non_nullable
as String?,subsidiaryTenantId: freezed == subsidiaryTenantId ? _self.subsidiaryTenantId : subsidiaryTenantId // ignore: cast_nullable_to_non_nullable
as String?,holdingName: freezed == holdingName ? _self.holdingName : holdingName // ignore: cast_nullable_to_non_nullable
as String?,subsidiaryName: freezed == subsidiaryName ? _self.subsidiaryName : subsidiaryName // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,requestedAt: freezed == requestedAt ? _self.requestedAt : requestedAt // ignore: cast_nullable_to_non_nullable
as String?,approvedAt: freezed == approvedAt ? _self.approvedAt : approvedAt // ignore: cast_nullable_to_non_nullable
as String?,rejectedAt: freezed == rejectedAt ? _self.rejectedAt : rejectedAt // ignore: cast_nullable_to_non_nullable
as String?,canceledAt: freezed == canceledAt ? _self.canceledAt : canceledAt // ignore: cast_nullable_to_non_nullable
as String?,endsAt: freezed == endsAt ? _self.endsAt : endsAt // ignore: cast_nullable_to_non_nullable
as String?,tokenEmittedAt: freezed == tokenEmittedAt ? _self.tokenEmittedAt : tokenEmittedAt // ignore: cast_nullable_to_non_nullable
as String?,issuedAt: freezed == issuedAt ? _self.issuedAt : issuedAt // ignore: cast_nullable_to_non_nullable
as String?,revokedAt: freezed == revokedAt ? _self.revokedAt : revokedAt // ignore: cast_nullable_to_non_nullable
as String?,rejectionReason: freezed == rejectionReason ? _self.rejectionReason : rejectionReason // ignore: cast_nullable_to_non_nullable
as String?,revocationReason: freezed == revocationReason ? _self.revocationReason : revocationReason // ignore: cast_nullable_to_non_nullable
as String?,cancellationReason: freezed == cancellationReason ? _self.cancellationReason : cancellationReason // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TenantRelationshipDto].
extension TenantRelationshipDtoPatterns on TenantRelationshipDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TenantRelationshipDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TenantRelationshipDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TenantRelationshipDto value)  $default,){
final _that = this;
switch (_that) {
case _TenantRelationshipDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TenantRelationshipDto value)?  $default,){
final _that = this;
switch (_that) {
case _TenantRelationshipDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String? status, @JsonKey(name: 'holding_id')  String? holdingId, @JsonKey(name: 'subsidiary_id')  String? subsidiaryId, @JsonKey(name: 'tenant_id_holding')  String? tenantIdHolding, @JsonKey(name: 'tenant_id_subsidiary')  String? tenantIdSubsidiary, @JsonKey(name: 'holding_tenant_id')  String? holdingTenantId, @JsonKey(name: 'subsidiary_tenant_id')  String? subsidiaryTenantId, @JsonKey(name: 'holding_name')  String? holdingName, @JsonKey(name: 'subsidiary_name')  String? subsidiaryName, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt, @JsonKey(name: 'requested_at')  String? requestedAt, @JsonKey(name: 'approved_at')  String? approvedAt, @JsonKey(name: 'rejected_at')  String? rejectedAt, @JsonKey(name: 'canceled_at')  String? canceledAt, @JsonKey(name: 'ends_at')  String? endsAt, @JsonKey(name: 'token_emitted_at')  String? tokenEmittedAt, @JsonKey(name: 'issued_at')  String? issuedAt, @JsonKey(name: 'revoked_at')  String? revokedAt, @JsonKey(name: 'rejection_reason')  String? rejectionReason, @JsonKey(name: 'revocation_reason')  String? revocationReason, @JsonKey(name: 'cancellation_reason')  String? cancellationReason)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TenantRelationshipDto() when $default != null:
return $default(_that.id,_that.status,_that.holdingId,_that.subsidiaryId,_that.tenantIdHolding,_that.tenantIdSubsidiary,_that.holdingTenantId,_that.subsidiaryTenantId,_that.holdingName,_that.subsidiaryName,_that.createdAt,_that.updatedAt,_that.requestedAt,_that.approvedAt,_that.rejectedAt,_that.canceledAt,_that.endsAt,_that.tokenEmittedAt,_that.issuedAt,_that.revokedAt,_that.rejectionReason,_that.revocationReason,_that.cancellationReason);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String? status, @JsonKey(name: 'holding_id')  String? holdingId, @JsonKey(name: 'subsidiary_id')  String? subsidiaryId, @JsonKey(name: 'tenant_id_holding')  String? tenantIdHolding, @JsonKey(name: 'tenant_id_subsidiary')  String? tenantIdSubsidiary, @JsonKey(name: 'holding_tenant_id')  String? holdingTenantId, @JsonKey(name: 'subsidiary_tenant_id')  String? subsidiaryTenantId, @JsonKey(name: 'holding_name')  String? holdingName, @JsonKey(name: 'subsidiary_name')  String? subsidiaryName, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt, @JsonKey(name: 'requested_at')  String? requestedAt, @JsonKey(name: 'approved_at')  String? approvedAt, @JsonKey(name: 'rejected_at')  String? rejectedAt, @JsonKey(name: 'canceled_at')  String? canceledAt, @JsonKey(name: 'ends_at')  String? endsAt, @JsonKey(name: 'token_emitted_at')  String? tokenEmittedAt, @JsonKey(name: 'issued_at')  String? issuedAt, @JsonKey(name: 'revoked_at')  String? revokedAt, @JsonKey(name: 'rejection_reason')  String? rejectionReason, @JsonKey(name: 'revocation_reason')  String? revocationReason, @JsonKey(name: 'cancellation_reason')  String? cancellationReason)  $default,) {final _that = this;
switch (_that) {
case _TenantRelationshipDto():
return $default(_that.id,_that.status,_that.holdingId,_that.subsidiaryId,_that.tenantIdHolding,_that.tenantIdSubsidiary,_that.holdingTenantId,_that.subsidiaryTenantId,_that.holdingName,_that.subsidiaryName,_that.createdAt,_that.updatedAt,_that.requestedAt,_that.approvedAt,_that.rejectedAt,_that.canceledAt,_that.endsAt,_that.tokenEmittedAt,_that.issuedAt,_that.revokedAt,_that.rejectionReason,_that.revocationReason,_that.cancellationReason);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String? status, @JsonKey(name: 'holding_id')  String? holdingId, @JsonKey(name: 'subsidiary_id')  String? subsidiaryId, @JsonKey(name: 'tenant_id_holding')  String? tenantIdHolding, @JsonKey(name: 'tenant_id_subsidiary')  String? tenantIdSubsidiary, @JsonKey(name: 'holding_tenant_id')  String? holdingTenantId, @JsonKey(name: 'subsidiary_tenant_id')  String? subsidiaryTenantId, @JsonKey(name: 'holding_name')  String? holdingName, @JsonKey(name: 'subsidiary_name')  String? subsidiaryName, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt, @JsonKey(name: 'requested_at')  String? requestedAt, @JsonKey(name: 'approved_at')  String? approvedAt, @JsonKey(name: 'rejected_at')  String? rejectedAt, @JsonKey(name: 'canceled_at')  String? canceledAt, @JsonKey(name: 'ends_at')  String? endsAt, @JsonKey(name: 'token_emitted_at')  String? tokenEmittedAt, @JsonKey(name: 'issued_at')  String? issuedAt, @JsonKey(name: 'revoked_at')  String? revokedAt, @JsonKey(name: 'rejection_reason')  String? rejectionReason, @JsonKey(name: 'revocation_reason')  String? revocationReason, @JsonKey(name: 'cancellation_reason')  String? cancellationReason)?  $default,) {final _that = this;
switch (_that) {
case _TenantRelationshipDto() when $default != null:
return $default(_that.id,_that.status,_that.holdingId,_that.subsidiaryId,_that.tenantIdHolding,_that.tenantIdSubsidiary,_that.holdingTenantId,_that.subsidiaryTenantId,_that.holdingName,_that.subsidiaryName,_that.createdAt,_that.updatedAt,_that.requestedAt,_that.approvedAt,_that.rejectedAt,_that.canceledAt,_that.endsAt,_that.tokenEmittedAt,_that.issuedAt,_that.revokedAt,_that.rejectionReason,_that.revocationReason,_that.cancellationReason);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TenantRelationshipDto implements TenantRelationshipDto {
  const _TenantRelationshipDto({this.id, this.status, @JsonKey(name: 'holding_id') this.holdingId, @JsonKey(name: 'subsidiary_id') this.subsidiaryId, @JsonKey(name: 'tenant_id_holding') this.tenantIdHolding, @JsonKey(name: 'tenant_id_subsidiary') this.tenantIdSubsidiary, @JsonKey(name: 'holding_tenant_id') this.holdingTenantId, @JsonKey(name: 'subsidiary_tenant_id') this.subsidiaryTenantId, @JsonKey(name: 'holding_name') this.holdingName, @JsonKey(name: 'subsidiary_name') this.subsidiaryName, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt, @JsonKey(name: 'requested_at') this.requestedAt, @JsonKey(name: 'approved_at') this.approvedAt, @JsonKey(name: 'rejected_at') this.rejectedAt, @JsonKey(name: 'canceled_at') this.canceledAt, @JsonKey(name: 'ends_at') this.endsAt, @JsonKey(name: 'token_emitted_at') this.tokenEmittedAt, @JsonKey(name: 'issued_at') this.issuedAt, @JsonKey(name: 'revoked_at') this.revokedAt, @JsonKey(name: 'rejection_reason') this.rejectionReason, @JsonKey(name: 'revocation_reason') this.revocationReason, @JsonKey(name: 'cancellation_reason') this.cancellationReason});
  factory _TenantRelationshipDto.fromJson(Map<String, dynamic> json) => _$TenantRelationshipDtoFromJson(json);

@override final  String? id;
@override final  String? status;
@override@JsonKey(name: 'holding_id') final  String? holdingId;
@override@JsonKey(name: 'subsidiary_id') final  String? subsidiaryId;
@override@JsonKey(name: 'tenant_id_holding') final  String? tenantIdHolding;
@override@JsonKey(name: 'tenant_id_subsidiary') final  String? tenantIdSubsidiary;
@override@JsonKey(name: 'holding_tenant_id') final  String? holdingTenantId;
@override@JsonKey(name: 'subsidiary_tenant_id') final  String? subsidiaryTenantId;
@override@JsonKey(name: 'holding_name') final  String? holdingName;
@override@JsonKey(name: 'subsidiary_name') final  String? subsidiaryName;
@override@JsonKey(name: 'created_at') final  String? createdAt;
@override@JsonKey(name: 'updated_at') final  String? updatedAt;
@override@JsonKey(name: 'requested_at') final  String? requestedAt;
@override@JsonKey(name: 'approved_at') final  String? approvedAt;
@override@JsonKey(name: 'rejected_at') final  String? rejectedAt;
@override@JsonKey(name: 'canceled_at') final  String? canceledAt;
@override@JsonKey(name: 'ends_at') final  String? endsAt;
@override@JsonKey(name: 'token_emitted_at') final  String? tokenEmittedAt;
@override@JsonKey(name: 'issued_at') final  String? issuedAt;
@override@JsonKey(name: 'revoked_at') final  String? revokedAt;
@override@JsonKey(name: 'rejection_reason') final  String? rejectionReason;
@override@JsonKey(name: 'revocation_reason') final  String? revocationReason;
@override@JsonKey(name: 'cancellation_reason') final  String? cancellationReason;

/// Create a copy of TenantRelationshipDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TenantRelationshipDtoCopyWith<_TenantRelationshipDto> get copyWith => __$TenantRelationshipDtoCopyWithImpl<_TenantRelationshipDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TenantRelationshipDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TenantRelationshipDto&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.holdingId, holdingId) || other.holdingId == holdingId)&&(identical(other.subsidiaryId, subsidiaryId) || other.subsidiaryId == subsidiaryId)&&(identical(other.tenantIdHolding, tenantIdHolding) || other.tenantIdHolding == tenantIdHolding)&&(identical(other.tenantIdSubsidiary, tenantIdSubsidiary) || other.tenantIdSubsidiary == tenantIdSubsidiary)&&(identical(other.holdingTenantId, holdingTenantId) || other.holdingTenantId == holdingTenantId)&&(identical(other.subsidiaryTenantId, subsidiaryTenantId) || other.subsidiaryTenantId == subsidiaryTenantId)&&(identical(other.holdingName, holdingName) || other.holdingName == holdingName)&&(identical(other.subsidiaryName, subsidiaryName) || other.subsidiaryName == subsidiaryName)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.requestedAt, requestedAt) || other.requestedAt == requestedAt)&&(identical(other.approvedAt, approvedAt) || other.approvedAt == approvedAt)&&(identical(other.rejectedAt, rejectedAt) || other.rejectedAt == rejectedAt)&&(identical(other.canceledAt, canceledAt) || other.canceledAt == canceledAt)&&(identical(other.endsAt, endsAt) || other.endsAt == endsAt)&&(identical(other.tokenEmittedAt, tokenEmittedAt) || other.tokenEmittedAt == tokenEmittedAt)&&(identical(other.issuedAt, issuedAt) || other.issuedAt == issuedAt)&&(identical(other.revokedAt, revokedAt) || other.revokedAt == revokedAt)&&(identical(other.rejectionReason, rejectionReason) || other.rejectionReason == rejectionReason)&&(identical(other.revocationReason, revocationReason) || other.revocationReason == revocationReason)&&(identical(other.cancellationReason, cancellationReason) || other.cancellationReason == cancellationReason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hashAll([runtimeType,id,status,holdingId,subsidiaryId,tenantIdHolding,tenantIdSubsidiary,holdingTenantId,subsidiaryTenantId,holdingName,subsidiaryName,createdAt,updatedAt,requestedAt,approvedAt,rejectedAt,canceledAt,endsAt,tokenEmittedAt,issuedAt,revokedAt,rejectionReason,revocationReason,cancellationReason]);
}

@override
String toString() {
    return 'TenantRelationshipDto(id: $id, status: $status, holdingId: $holdingId, subsidiaryId: $subsidiaryId, tenantIdHolding: $tenantIdHolding, tenantIdSubsidiary: $tenantIdSubsidiary, holdingTenantId: $holdingTenantId, subsidiaryTenantId: $subsidiaryTenantId, holdingName: $holdingName, subsidiaryName: $subsidiaryName, createdAt: $createdAt, updatedAt: $updatedAt, requestedAt: $requestedAt, approvedAt: $approvedAt, rejectedAt: $rejectedAt, canceledAt: $canceledAt, endsAt: $endsAt, tokenEmittedAt: $tokenEmittedAt, issuedAt: $issuedAt, revokedAt: $revokedAt, rejectionReason: $rejectionReason, revocationReason: $revocationReason, cancellationReason: $cancellationReason)';
}


}

/// @nodoc
abstract mixin class _$TenantRelationshipDtoCopyWith<$Res> implements $TenantRelationshipDtoCopyWith<$Res> {
  factory _$TenantRelationshipDtoCopyWith(_TenantRelationshipDto value, $Res Function(_TenantRelationshipDto) _then) = __$TenantRelationshipDtoCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? status,@JsonKey(name: 'holding_id') String? holdingId,@JsonKey(name: 'subsidiary_id') String? subsidiaryId,@JsonKey(name: 'tenant_id_holding') String? tenantIdHolding,@JsonKey(name: 'tenant_id_subsidiary') String? tenantIdSubsidiary,@JsonKey(name: 'holding_tenant_id') String? holdingTenantId,@JsonKey(name: 'subsidiary_tenant_id') String? subsidiaryTenantId,@JsonKey(name: 'holding_name') String? holdingName,@JsonKey(name: 'subsidiary_name') String? subsidiaryName,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt,@JsonKey(name: 'requested_at') String? requestedAt,@JsonKey(name: 'approved_at') String? approvedAt,@JsonKey(name: 'rejected_at') String? rejectedAt,@JsonKey(name: 'canceled_at') String? canceledAt,@JsonKey(name: 'ends_at') String? endsAt,@JsonKey(name: 'token_emitted_at') String? tokenEmittedAt,@JsonKey(name: 'issued_at') String? issuedAt,@JsonKey(name: 'revoked_at') String? revokedAt,@JsonKey(name: 'rejection_reason') String? rejectionReason,@JsonKey(name: 'revocation_reason') String? revocationReason,@JsonKey(name: 'cancellation_reason') String? cancellationReason
});




}
/// @nodoc
class __$TenantRelationshipDtoCopyWithImpl<$Res>
    implements _$TenantRelationshipDtoCopyWith<$Res> {
  __$TenantRelationshipDtoCopyWithImpl(this._self, this._then);

  final _TenantRelationshipDto _self;
  final $Res Function(_TenantRelationshipDto) _then;

/// Create a copy of TenantRelationshipDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? status = freezed,Object? holdingId = freezed,Object? subsidiaryId = freezed,Object? tenantIdHolding = freezed,Object? tenantIdSubsidiary = freezed,Object? holdingTenantId = freezed,Object? subsidiaryTenantId = freezed,Object? holdingName = freezed,Object? subsidiaryName = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? requestedAt = freezed,Object? approvedAt = freezed,Object? rejectedAt = freezed,Object? canceledAt = freezed,Object? endsAt = freezed,Object? tokenEmittedAt = freezed,Object? issuedAt = freezed,Object? revokedAt = freezed,Object? rejectionReason = freezed,Object? revocationReason = freezed,Object? cancellationReason = freezed,}) {
  return _then(_TenantRelationshipDto(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,holdingId: freezed == holdingId ? _self.holdingId : holdingId // ignore: cast_nullable_to_non_nullable
as String?,subsidiaryId: freezed == subsidiaryId ? _self.subsidiaryId : subsidiaryId // ignore: cast_nullable_to_non_nullable
as String?,tenantIdHolding: freezed == tenantIdHolding ? _self.tenantIdHolding : tenantIdHolding // ignore: cast_nullable_to_non_nullable
as String?,tenantIdSubsidiary: freezed == tenantIdSubsidiary ? _self.tenantIdSubsidiary : tenantIdSubsidiary // ignore: cast_nullable_to_non_nullable
as String?,holdingTenantId: freezed == holdingTenantId ? _self.holdingTenantId : holdingTenantId // ignore: cast_nullable_to_non_nullable
as String?,subsidiaryTenantId: freezed == subsidiaryTenantId ? _self.subsidiaryTenantId : subsidiaryTenantId // ignore: cast_nullable_to_non_nullable
as String?,holdingName: freezed == holdingName ? _self.holdingName : holdingName // ignore: cast_nullable_to_non_nullable
as String?,subsidiaryName: freezed == subsidiaryName ? _self.subsidiaryName : subsidiaryName // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,requestedAt: freezed == requestedAt ? _self.requestedAt : requestedAt // ignore: cast_nullable_to_non_nullable
as String?,approvedAt: freezed == approvedAt ? _self.approvedAt : approvedAt // ignore: cast_nullable_to_non_nullable
as String?,rejectedAt: freezed == rejectedAt ? _self.rejectedAt : rejectedAt // ignore: cast_nullable_to_non_nullable
as String?,canceledAt: freezed == canceledAt ? _self.canceledAt : canceledAt // ignore: cast_nullable_to_non_nullable
as String?,endsAt: freezed == endsAt ? _self.endsAt : endsAt // ignore: cast_nullable_to_non_nullable
as String?,tokenEmittedAt: freezed == tokenEmittedAt ? _self.tokenEmittedAt : tokenEmittedAt // ignore: cast_nullable_to_non_nullable
as String?,issuedAt: freezed == issuedAt ? _self.issuedAt : issuedAt // ignore: cast_nullable_to_non_nullable
as String?,revokedAt: freezed == revokedAt ? _self.revokedAt : revokedAt // ignore: cast_nullable_to_non_nullable
as String?,rejectionReason: freezed == rejectionReason ? _self.rejectionReason : rejectionReason // ignore: cast_nullable_to_non_nullable
as String?,revocationReason: freezed == revocationReason ? _self.revocationReason : revocationReason // ignore: cast_nullable_to_non_nullable
as String?,cancellationReason: freezed == cancellationReason ? _self.cancellationReason : cancellationReason // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$InitiateRelationshipRequestDto {

@JsonKey(name: 'holding_tenant_id') String get holdingTenantId;
/// Create a copy of InitiateRelationshipRequestDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InitiateRelationshipRequestDtoCopyWith<InitiateRelationshipRequestDto> get copyWith => _$InitiateRelationshipRequestDtoCopyWithImpl<InitiateRelationshipRequestDto>(this as InitiateRelationshipRequestDto, _$identity);

  /// Serializes this InitiateRelationshipRequestDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as InitiateRelationshipRequestDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InitiateRelationshipRequestDto&&(identical(other.holdingTenantId, _this.holdingTenantId) || other.holdingTenantId == _this.holdingTenantId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as InitiateRelationshipRequestDto;
  return Object.hash(runtimeType,_this.holdingTenantId);
}

@override
String toString() {
  final _this = this as InitiateRelationshipRequestDto;
  return 'InitiateRelationshipRequestDto(holdingTenantId: ${_this.holdingTenantId})';
}


}

/// @nodoc
abstract mixin class $InitiateRelationshipRequestDtoCopyWith<$Res>  {
  factory $InitiateRelationshipRequestDtoCopyWith(InitiateRelationshipRequestDto value, $Res Function(InitiateRelationshipRequestDto) _then) = _$InitiateRelationshipRequestDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'holding_tenant_id') String holdingTenantId
});




}
/// @nodoc
class _$InitiateRelationshipRequestDtoCopyWithImpl<$Res>
    implements $InitiateRelationshipRequestDtoCopyWith<$Res> {
  _$InitiateRelationshipRequestDtoCopyWithImpl(this._self, this._then);

  final InitiateRelationshipRequestDto _self;
  final $Res Function(InitiateRelationshipRequestDto) _then;

/// Create a copy of InitiateRelationshipRequestDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? holdingTenantId = null,}) {
  return _then(InitiateRelationshipRequestDto(
holdingTenantId: null == holdingTenantId ? _self.holdingTenantId : holdingTenantId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [InitiateRelationshipRequestDto].
extension InitiateRelationshipRequestDtoPatterns on InitiateRelationshipRequestDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InitiateRelationshipRequestDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InitiateRelationshipRequestDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InitiateRelationshipRequestDto value)  $default,){
final _that = this;
switch (_that) {
case _InitiateRelationshipRequestDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InitiateRelationshipRequestDto value)?  $default,){
final _that = this;
switch (_that) {
case _InitiateRelationshipRequestDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'holding_tenant_id')  String holdingTenantId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InitiateRelationshipRequestDto() when $default != null:
return $default(_that.holdingTenantId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'holding_tenant_id')  String holdingTenantId)  $default,) {final _that = this;
switch (_that) {
case _InitiateRelationshipRequestDto():
return $default(_that.holdingTenantId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'holding_tenant_id')  String holdingTenantId)?  $default,) {final _that = this;
switch (_that) {
case _InitiateRelationshipRequestDto() when $default != null:
return $default(_that.holdingTenantId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _InitiateRelationshipRequestDto implements InitiateRelationshipRequestDto {
  const _InitiateRelationshipRequestDto({@JsonKey(name: 'holding_tenant_id') required this.holdingTenantId});
  factory _InitiateRelationshipRequestDto.fromJson(Map<String, dynamic> json) => _$InitiateRelationshipRequestDtoFromJson(json);

@override@JsonKey(name: 'holding_tenant_id') final  String holdingTenantId;

/// Create a copy of InitiateRelationshipRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InitiateRelationshipRequestDtoCopyWith<_InitiateRelationshipRequestDto> get copyWith => __$InitiateRelationshipRequestDtoCopyWithImpl<_InitiateRelationshipRequestDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InitiateRelationshipRequestDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _InitiateRelationshipRequestDto&&(identical(other.holdingTenantId, holdingTenantId) || other.holdingTenantId == holdingTenantId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,holdingTenantId);
}

@override
String toString() {
    return 'InitiateRelationshipRequestDto(holdingTenantId: $holdingTenantId)';
}


}

/// @nodoc
abstract mixin class _$InitiateRelationshipRequestDtoCopyWith<$Res> implements $InitiateRelationshipRequestDtoCopyWith<$Res> {
  factory _$InitiateRelationshipRequestDtoCopyWith(_InitiateRelationshipRequestDto value, $Res Function(_InitiateRelationshipRequestDto) _then) = __$InitiateRelationshipRequestDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'holding_tenant_id') String holdingTenantId
});




}
/// @nodoc
class __$InitiateRelationshipRequestDtoCopyWithImpl<$Res>
    implements _$InitiateRelationshipRequestDtoCopyWith<$Res> {
  __$InitiateRelationshipRequestDtoCopyWithImpl(this._self, this._then);

  final _InitiateRelationshipRequestDto _self;
  final $Res Function(_InitiateRelationshipRequestDto) _then;

/// Create a copy of InitiateRelationshipRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? holdingTenantId = null,}) {
  return _then(_InitiateRelationshipRequestDto(
holdingTenantId: null == holdingTenantId ? _self.holdingTenantId : holdingTenantId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$EmitInviteTokenResponseDto {

 String? get token;@JsonKey(name: 'expires_at') String? get expiresAt;
/// Create a copy of EmitInviteTokenResponseDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EmitInviteTokenResponseDtoCopyWith<EmitInviteTokenResponseDto> get copyWith => _$EmitInviteTokenResponseDtoCopyWithImpl<EmitInviteTokenResponseDto>(this as EmitInviteTokenResponseDto, _$identity);

  /// Serializes this EmitInviteTokenResponseDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as EmitInviteTokenResponseDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EmitInviteTokenResponseDto&&(identical(other.token, _this.token) || other.token == _this.token)&&(identical(other.expiresAt, _this.expiresAt) || other.expiresAt == _this.expiresAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as EmitInviteTokenResponseDto;
  return Object.hash(runtimeType,_this.token,_this.expiresAt);
}

@override
String toString() {
  final _this = this as EmitInviteTokenResponseDto;
  return 'EmitInviteTokenResponseDto(token: ${_this.token}, expiresAt: ${_this.expiresAt})';
}


}

/// @nodoc
abstract mixin class $EmitInviteTokenResponseDtoCopyWith<$Res>  {
  factory $EmitInviteTokenResponseDtoCopyWith(EmitInviteTokenResponseDto value, $Res Function(EmitInviteTokenResponseDto) _then) = _$EmitInviteTokenResponseDtoCopyWithImpl;
@useResult
$Res call({
 String? token,@JsonKey(name: 'expires_at') String? expiresAt
});




}
/// @nodoc
class _$EmitInviteTokenResponseDtoCopyWithImpl<$Res>
    implements $EmitInviteTokenResponseDtoCopyWith<$Res> {
  _$EmitInviteTokenResponseDtoCopyWithImpl(this._self, this._then);

  final EmitInviteTokenResponseDto _self;
  final $Res Function(EmitInviteTokenResponseDto) _then;

/// Create a copy of EmitInviteTokenResponseDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? token = freezed,Object? expiresAt = freezed,}) {
  return _then(EmitInviteTokenResponseDto(
token: freezed == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String?,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [EmitInviteTokenResponseDto].
extension EmitInviteTokenResponseDtoPatterns on EmitInviteTokenResponseDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EmitInviteTokenResponseDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EmitInviteTokenResponseDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EmitInviteTokenResponseDto value)  $default,){
final _that = this;
switch (_that) {
case _EmitInviteTokenResponseDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EmitInviteTokenResponseDto value)?  $default,){
final _that = this;
switch (_that) {
case _EmitInviteTokenResponseDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? token, @JsonKey(name: 'expires_at')  String? expiresAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EmitInviteTokenResponseDto() when $default != null:
return $default(_that.token,_that.expiresAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? token, @JsonKey(name: 'expires_at')  String? expiresAt)  $default,) {final _that = this;
switch (_that) {
case _EmitInviteTokenResponseDto():
return $default(_that.token,_that.expiresAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? token, @JsonKey(name: 'expires_at')  String? expiresAt)?  $default,) {final _that = this;
switch (_that) {
case _EmitInviteTokenResponseDto() when $default != null:
return $default(_that.token,_that.expiresAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EmitInviteTokenResponseDto implements EmitInviteTokenResponseDto {
  const _EmitInviteTokenResponseDto({this.token, @JsonKey(name: 'expires_at') this.expiresAt});
  factory _EmitInviteTokenResponseDto.fromJson(Map<String, dynamic> json) => _$EmitInviteTokenResponseDtoFromJson(json);

@override final  String? token;
@override@JsonKey(name: 'expires_at') final  String? expiresAt;

/// Create a copy of EmitInviteTokenResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EmitInviteTokenResponseDtoCopyWith<_EmitInviteTokenResponseDto> get copyWith => __$EmitInviteTokenResponseDtoCopyWithImpl<_EmitInviteTokenResponseDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EmitInviteTokenResponseDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _EmitInviteTokenResponseDto&&(identical(other.token, token) || other.token == token)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,token,expiresAt);
}

@override
String toString() {
    return 'EmitInviteTokenResponseDto(token: $token, expiresAt: $expiresAt)';
}


}

/// @nodoc
abstract mixin class _$EmitInviteTokenResponseDtoCopyWith<$Res> implements $EmitInviteTokenResponseDtoCopyWith<$Res> {
  factory _$EmitInviteTokenResponseDtoCopyWith(_EmitInviteTokenResponseDto value, $Res Function(_EmitInviteTokenResponseDto) _then) = __$EmitInviteTokenResponseDtoCopyWithImpl;
@override @useResult
$Res call({
 String? token,@JsonKey(name: 'expires_at') String? expiresAt
});




}
/// @nodoc
class __$EmitInviteTokenResponseDtoCopyWithImpl<$Res>
    implements _$EmitInviteTokenResponseDtoCopyWith<$Res> {
  __$EmitInviteTokenResponseDtoCopyWithImpl(this._self, this._then);

  final _EmitInviteTokenResponseDto _self;
  final $Res Function(_EmitInviteTokenResponseDto) _then;

/// Create a copy of EmitInviteTokenResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? token = freezed,Object? expiresAt = freezed,}) {
  return _then(_EmitInviteTokenResponseDto(
token: freezed == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String?,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$ConsumeInviteTokenRequestDto {

 String get token;
/// Create a copy of ConsumeInviteTokenRequestDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConsumeInviteTokenRequestDtoCopyWith<ConsumeInviteTokenRequestDto> get copyWith => _$ConsumeInviteTokenRequestDtoCopyWithImpl<ConsumeInviteTokenRequestDto>(this as ConsumeInviteTokenRequestDto, _$identity);

  /// Serializes this ConsumeInviteTokenRequestDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ConsumeInviteTokenRequestDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConsumeInviteTokenRequestDto&&(identical(other.token, _this.token) || other.token == _this.token));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ConsumeInviteTokenRequestDto;
  return Object.hash(runtimeType,_this.token);
}

@override
String toString() {
  final _this = this as ConsumeInviteTokenRequestDto;
  return 'ConsumeInviteTokenRequestDto(token: ${_this.token})';
}


}

/// @nodoc
abstract mixin class $ConsumeInviteTokenRequestDtoCopyWith<$Res>  {
  factory $ConsumeInviteTokenRequestDtoCopyWith(ConsumeInviteTokenRequestDto value, $Res Function(ConsumeInviteTokenRequestDto) _then) = _$ConsumeInviteTokenRequestDtoCopyWithImpl;
@useResult
$Res call({
 String token
});




}
/// @nodoc
class _$ConsumeInviteTokenRequestDtoCopyWithImpl<$Res>
    implements $ConsumeInviteTokenRequestDtoCopyWith<$Res> {
  _$ConsumeInviteTokenRequestDtoCopyWithImpl(this._self, this._then);

  final ConsumeInviteTokenRequestDto _self;
  final $Res Function(ConsumeInviteTokenRequestDto) _then;

/// Create a copy of ConsumeInviteTokenRequestDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? token = null,}) {
  return _then(ConsumeInviteTokenRequestDto(
token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ConsumeInviteTokenRequestDto].
extension ConsumeInviteTokenRequestDtoPatterns on ConsumeInviteTokenRequestDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ConsumeInviteTokenRequestDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ConsumeInviteTokenRequestDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ConsumeInviteTokenRequestDto value)  $default,){
final _that = this;
switch (_that) {
case _ConsumeInviteTokenRequestDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ConsumeInviteTokenRequestDto value)?  $default,){
final _that = this;
switch (_that) {
case _ConsumeInviteTokenRequestDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String token)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ConsumeInviteTokenRequestDto() when $default != null:
return $default(_that.token);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String token)  $default,) {final _that = this;
switch (_that) {
case _ConsumeInviteTokenRequestDto():
return $default(_that.token);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String token)?  $default,) {final _that = this;
switch (_that) {
case _ConsumeInviteTokenRequestDto() when $default != null:
return $default(_that.token);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ConsumeInviteTokenRequestDto implements ConsumeInviteTokenRequestDto {
  const _ConsumeInviteTokenRequestDto({required this.token});
  factory _ConsumeInviteTokenRequestDto.fromJson(Map<String, dynamic> json) => _$ConsumeInviteTokenRequestDtoFromJson(json);

@override final  String token;

/// Create a copy of ConsumeInviteTokenRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConsumeInviteTokenRequestDtoCopyWith<_ConsumeInviteTokenRequestDto> get copyWith => __$ConsumeInviteTokenRequestDtoCopyWithImpl<_ConsumeInviteTokenRequestDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ConsumeInviteTokenRequestDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConsumeInviteTokenRequestDto&&(identical(other.token, token) || other.token == token));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,token);
}

@override
String toString() {
    return 'ConsumeInviteTokenRequestDto(token: $token)';
}


}

/// @nodoc
abstract mixin class _$ConsumeInviteTokenRequestDtoCopyWith<$Res> implements $ConsumeInviteTokenRequestDtoCopyWith<$Res> {
  factory _$ConsumeInviteTokenRequestDtoCopyWith(_ConsumeInviteTokenRequestDto value, $Res Function(_ConsumeInviteTokenRequestDto) _then) = __$ConsumeInviteTokenRequestDtoCopyWithImpl;
@override @useResult
$Res call({
 String token
});




}
/// @nodoc
class __$ConsumeInviteTokenRequestDtoCopyWithImpl<$Res>
    implements _$ConsumeInviteTokenRequestDtoCopyWith<$Res> {
  __$ConsumeInviteTokenRequestDtoCopyWithImpl(this._self, this._then);

  final _ConsumeInviteTokenRequestDto _self;
  final $Res Function(_ConsumeInviteTokenRequestDto) _then;

/// Create a copy of ConsumeInviteTokenRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? token = null,}) {
  return _then(_ConsumeInviteTokenRequestDto(
token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$RelationshipReasonRequestDto {

@JsonKey(includeIfNull: false) String? get reason;
/// Create a copy of RelationshipReasonRequestDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RelationshipReasonRequestDtoCopyWith<RelationshipReasonRequestDto> get copyWith => _$RelationshipReasonRequestDtoCopyWithImpl<RelationshipReasonRequestDto>(this as RelationshipReasonRequestDto, _$identity);

  /// Serializes this RelationshipReasonRequestDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as RelationshipReasonRequestDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RelationshipReasonRequestDto&&(identical(other.reason, _this.reason) || other.reason == _this.reason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as RelationshipReasonRequestDto;
  return Object.hash(runtimeType,_this.reason);
}

@override
String toString() {
  final _this = this as RelationshipReasonRequestDto;
  return 'RelationshipReasonRequestDto(reason: ${_this.reason})';
}


}

/// @nodoc
abstract mixin class $RelationshipReasonRequestDtoCopyWith<$Res>  {
  factory $RelationshipReasonRequestDtoCopyWith(RelationshipReasonRequestDto value, $Res Function(RelationshipReasonRequestDto) _then) = _$RelationshipReasonRequestDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(includeIfNull: false) String? reason
});




}
/// @nodoc
class _$RelationshipReasonRequestDtoCopyWithImpl<$Res>
    implements $RelationshipReasonRequestDtoCopyWith<$Res> {
  _$RelationshipReasonRequestDtoCopyWithImpl(this._self, this._then);

  final RelationshipReasonRequestDto _self;
  final $Res Function(RelationshipReasonRequestDto) _then;

/// Create a copy of RelationshipReasonRequestDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? reason = freezed,}) {
  return _then(RelationshipReasonRequestDto(
reason: freezed == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [RelationshipReasonRequestDto].
extension RelationshipReasonRequestDtoPatterns on RelationshipReasonRequestDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RelationshipReasonRequestDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RelationshipReasonRequestDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RelationshipReasonRequestDto value)  $default,){
final _that = this;
switch (_that) {
case _RelationshipReasonRequestDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RelationshipReasonRequestDto value)?  $default,){
final _that = this;
switch (_that) {
case _RelationshipReasonRequestDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(includeIfNull: false)  String? reason)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RelationshipReasonRequestDto() when $default != null:
return $default(_that.reason);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(includeIfNull: false)  String? reason)  $default,) {final _that = this;
switch (_that) {
case _RelationshipReasonRequestDto():
return $default(_that.reason);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(includeIfNull: false)  String? reason)?  $default,) {final _that = this;
switch (_that) {
case _RelationshipReasonRequestDto() when $default != null:
return $default(_that.reason);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RelationshipReasonRequestDto implements RelationshipReasonRequestDto {
  const _RelationshipReasonRequestDto({@JsonKey(includeIfNull: false) this.reason});
  factory _RelationshipReasonRequestDto.fromJson(Map<String, dynamic> json) => _$RelationshipReasonRequestDtoFromJson(json);

@override@JsonKey(includeIfNull: false) final  String? reason;

/// Create a copy of RelationshipReasonRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RelationshipReasonRequestDtoCopyWith<_RelationshipReasonRequestDto> get copyWith => __$RelationshipReasonRequestDtoCopyWithImpl<_RelationshipReasonRequestDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RelationshipReasonRequestDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _RelationshipReasonRequestDto&&(identical(other.reason, reason) || other.reason == reason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,reason);
}

@override
String toString() {
    return 'RelationshipReasonRequestDto(reason: $reason)';
}


}

/// @nodoc
abstract mixin class _$RelationshipReasonRequestDtoCopyWith<$Res> implements $RelationshipReasonRequestDtoCopyWith<$Res> {
  factory _$RelationshipReasonRequestDtoCopyWith(_RelationshipReasonRequestDto value, $Res Function(_RelationshipReasonRequestDto) _then) = __$RelationshipReasonRequestDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(includeIfNull: false) String? reason
});




}
/// @nodoc
class __$RelationshipReasonRequestDtoCopyWithImpl<$Res>
    implements _$RelationshipReasonRequestDtoCopyWith<$Res> {
  __$RelationshipReasonRequestDtoCopyWithImpl(this._self, this._then);

  final _RelationshipReasonRequestDto _self;
  final $Res Function(_RelationshipReasonRequestDto) _then;

/// Create a copy of RelationshipReasonRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? reason = freezed,}) {
  return _then(_RelationshipReasonRequestDto(
reason: freezed == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
