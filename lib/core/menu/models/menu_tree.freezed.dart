// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'menu_tree.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MenuNode {

 String get id; String get code; String get name;@JsonKey(name: 'sort_order') int get sortOrder; List<MenuNode> get children; List<MenuOption> get options;
/// Create a copy of MenuNode
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MenuNodeCopyWith<MenuNode> get copyWith => _$MenuNodeCopyWithImpl<MenuNode>(this as MenuNode, _$identity);

  /// Serializes this MenuNode to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as MenuNode;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MenuNode&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.code, _this.code) || other.code == _this.code)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.sortOrder, _this.sortOrder) || other.sortOrder == _this.sortOrder)&&const DeepCollectionEquality().equals(other.children, _this.children)&&const DeepCollectionEquality().equals(other.options, _this.options));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as MenuNode;
  return Object.hash(runtimeType,_this.id,_this.code,_this.name,_this.sortOrder,const DeepCollectionEquality().hash(_this.children),const DeepCollectionEquality().hash(_this.options));
}

@override
String toString() {
  final _this = this as MenuNode;
  return 'MenuNode(id: ${_this.id}, code: ${_this.code}, name: ${_this.name}, sortOrder: ${_this.sortOrder}, children: ${_this.children}, options: ${_this.options})';
}


}

/// @nodoc
abstract mixin class $MenuNodeCopyWith<$Res>  {
  factory $MenuNodeCopyWith(MenuNode value, $Res Function(MenuNode) _then) = _$MenuNodeCopyWithImpl;
@useResult
$Res call({
 String id, String code, String name,@JsonKey(name: 'sort_order') int sortOrder, List<MenuNode> children, List<MenuOption> options
});




}
/// @nodoc
class _$MenuNodeCopyWithImpl<$Res>
    implements $MenuNodeCopyWith<$Res> {
  _$MenuNodeCopyWithImpl(this._self, this._then);

  final MenuNode _self;
  final $Res Function(MenuNode) _then;

/// Create a copy of MenuNode
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? code = null,Object? name = null,Object? sortOrder = null,Object? children = null,Object? options = null,}) {
  return _then(MenuNode(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int,children: null == children ? _self.children : children // ignore: cast_nullable_to_non_nullable
as List<MenuNode>,options: null == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as List<MenuOption>,
  ));
}

}


/// Adds pattern-matching-related methods to [MenuNode].
extension MenuNodePatterns on MenuNode {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MenuNode value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MenuNode() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MenuNode value)  $default,){
final _that = this;
switch (_that) {
case _MenuNode():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MenuNode value)?  $default,){
final _that = this;
switch (_that) {
case _MenuNode() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String code,  String name, @JsonKey(name: 'sort_order')  int sortOrder,  List<MenuNode> children,  List<MenuOption> options)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MenuNode() when $default != null:
return $default(_that.id,_that.code,_that.name,_that.sortOrder,_that.children,_that.options);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String code,  String name, @JsonKey(name: 'sort_order')  int sortOrder,  List<MenuNode> children,  List<MenuOption> options)  $default,) {final _that = this;
switch (_that) {
case _MenuNode():
return $default(_that.id,_that.code,_that.name,_that.sortOrder,_that.children,_that.options);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String code,  String name, @JsonKey(name: 'sort_order')  int sortOrder,  List<MenuNode> children,  List<MenuOption> options)?  $default,) {final _that = this;
switch (_that) {
case _MenuNode() when $default != null:
return $default(_that.id,_that.code,_that.name,_that.sortOrder,_that.children,_that.options);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MenuNode implements MenuNode {
  const _MenuNode({required this.id, required this.code, required this.name, @JsonKey(name: 'sort_order') this.sortOrder = 0,  List<MenuNode> children = const <MenuNode>[],  List<MenuOption> options = const <MenuOption>[]}): _children = children,_options = options;
  factory _MenuNode.fromJson(Map<String, dynamic> json) => _$MenuNodeFromJson(json);

@override final  String id;
@override final  String code;
@override final  String name;
@override@JsonKey(name: 'sort_order') final  int sortOrder;
 final  List<MenuNode> _children;
@override@JsonKey() List<MenuNode> get children {
  if (_children is EqualUnmodifiableListView) return _children;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_children);
}

 final  List<MenuOption> _options;
@override@JsonKey() List<MenuOption> get options {
  if (_options is EqualUnmodifiableListView) return _options;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_options);
}


/// Create a copy of MenuNode
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MenuNodeCopyWith<_MenuNode> get copyWith => __$MenuNodeCopyWithImpl<_MenuNode>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MenuNodeToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _MenuNode&&(identical(other.id, id) || other.id == id)&&(identical(other.code, code) || other.code == code)&&(identical(other.name, name) || other.name == name)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder)&&const DeepCollectionEquality().equals(other.children, _children)&&const DeepCollectionEquality().equals(other.options, _options));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,code,name,sortOrder,const DeepCollectionEquality().hash(_children),const DeepCollectionEquality().hash(_options));
}

@override
String toString() {
    return 'MenuNode(id: $id, code: $code, name: $name, sortOrder: $sortOrder, children: $children, options: $options)';
}


}

/// @nodoc
abstract mixin class _$MenuNodeCopyWith<$Res> implements $MenuNodeCopyWith<$Res> {
  factory _$MenuNodeCopyWith(_MenuNode value, $Res Function(_MenuNode) _then) = __$MenuNodeCopyWithImpl;
@override @useResult
$Res call({
 String id, String code, String name,@JsonKey(name: 'sort_order') int sortOrder, List<MenuNode> children, List<MenuOption> options
});




}
/// @nodoc
class __$MenuNodeCopyWithImpl<$Res>
    implements _$MenuNodeCopyWith<$Res> {
  __$MenuNodeCopyWithImpl(this._self, this._then);

  final _MenuNode _self;
  final $Res Function(_MenuNode) _then;

/// Create a copy of MenuNode
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? code = null,Object? name = null,Object? sortOrder = null,Object? children = null,Object? options = null,}) {
  return _then(_MenuNode(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int,children: null == children ? _self._children : children // ignore: cast_nullable_to_non_nullable
as List<MenuNode>,options: null == options ? _self._options : options // ignore: cast_nullable_to_non_nullable
as List<MenuOption>,
  ));
}


}


/// @nodoc
mixin _$MenuOption {

 String get id; String get code; String get name; String get icon; String get route;@JsonKey(name: 'sort_order') int get sortOrder;
/// Create a copy of MenuOption
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MenuOptionCopyWith<MenuOption> get copyWith => _$MenuOptionCopyWithImpl<MenuOption>(this as MenuOption, _$identity);

  /// Serializes this MenuOption to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as MenuOption;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MenuOption&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.code, _this.code) || other.code == _this.code)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.icon, _this.icon) || other.icon == _this.icon)&&(identical(other.route, _this.route) || other.route == _this.route)&&(identical(other.sortOrder, _this.sortOrder) || other.sortOrder == _this.sortOrder));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as MenuOption;
  return Object.hash(runtimeType,_this.id,_this.code,_this.name,_this.icon,_this.route,_this.sortOrder);
}

@override
String toString() {
  final _this = this as MenuOption;
  return 'MenuOption(id: ${_this.id}, code: ${_this.code}, name: ${_this.name}, icon: ${_this.icon}, route: ${_this.route}, sortOrder: ${_this.sortOrder})';
}


}

/// @nodoc
abstract mixin class $MenuOptionCopyWith<$Res>  {
  factory $MenuOptionCopyWith(MenuOption value, $Res Function(MenuOption) _then) = _$MenuOptionCopyWithImpl;
@useResult
$Res call({
 String id, String code, String name, String icon, String route,@JsonKey(name: 'sort_order') int sortOrder
});




}
/// @nodoc
class _$MenuOptionCopyWithImpl<$Res>
    implements $MenuOptionCopyWith<$Res> {
  _$MenuOptionCopyWithImpl(this._self, this._then);

  final MenuOption _self;
  final $Res Function(MenuOption) _then;

/// Create a copy of MenuOption
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? code = null,Object? name = null,Object? icon = null,Object? route = null,Object? sortOrder = null,}) {
  return _then(MenuOption(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String,route: null == route ? _self.route : route // ignore: cast_nullable_to_non_nullable
as String,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [MenuOption].
extension MenuOptionPatterns on MenuOption {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MenuOption value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MenuOption() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MenuOption value)  $default,){
final _that = this;
switch (_that) {
case _MenuOption():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MenuOption value)?  $default,){
final _that = this;
switch (_that) {
case _MenuOption() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String code,  String name,  String icon,  String route, @JsonKey(name: 'sort_order')  int sortOrder)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MenuOption() when $default != null:
return $default(_that.id,_that.code,_that.name,_that.icon,_that.route,_that.sortOrder);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String code,  String name,  String icon,  String route, @JsonKey(name: 'sort_order')  int sortOrder)  $default,) {final _that = this;
switch (_that) {
case _MenuOption():
return $default(_that.id,_that.code,_that.name,_that.icon,_that.route,_that.sortOrder);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String code,  String name,  String icon,  String route, @JsonKey(name: 'sort_order')  int sortOrder)?  $default,) {final _that = this;
switch (_that) {
case _MenuOption() when $default != null:
return $default(_that.id,_that.code,_that.name,_that.icon,_that.route,_that.sortOrder);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MenuOption implements MenuOption {
  const _MenuOption({required this.id, required this.code, required this.name, this.icon = '', this.route = '', @JsonKey(name: 'sort_order') this.sortOrder = 0});
  factory _MenuOption.fromJson(Map<String, dynamic> json) => _$MenuOptionFromJson(json);

@override final  String id;
@override final  String code;
@override final  String name;
@override@JsonKey() final  String icon;
@override@JsonKey() final  String route;
@override@JsonKey(name: 'sort_order') final  int sortOrder;

/// Create a copy of MenuOption
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MenuOptionCopyWith<_MenuOption> get copyWith => __$MenuOptionCopyWithImpl<_MenuOption>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MenuOptionToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _MenuOption&&(identical(other.id, id) || other.id == id)&&(identical(other.code, code) || other.code == code)&&(identical(other.name, name) || other.name == name)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.route, route) || other.route == route)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,code,name,icon,route,sortOrder);
}

@override
String toString() {
    return 'MenuOption(id: $id, code: $code, name: $name, icon: $icon, route: $route, sortOrder: $sortOrder)';
}


}

/// @nodoc
abstract mixin class _$MenuOptionCopyWith<$Res> implements $MenuOptionCopyWith<$Res> {
  factory _$MenuOptionCopyWith(_MenuOption value, $Res Function(_MenuOption) _then) = __$MenuOptionCopyWithImpl;
@override @useResult
$Res call({
 String id, String code, String name, String icon, String route,@JsonKey(name: 'sort_order') int sortOrder
});




}
/// @nodoc
class __$MenuOptionCopyWithImpl<$Res>
    implements _$MenuOptionCopyWith<$Res> {
  __$MenuOptionCopyWithImpl(this._self, this._then);

  final _MenuOption _self;
  final $Res Function(_MenuOption) _then;

/// Create a copy of MenuOption
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? code = null,Object? name = null,Object? icon = null,Object? route = null,Object? sortOrder = null,}) {
  return _then(_MenuOption(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String,route: null == route ? _self.route : route // ignore: cast_nullable_to_non_nullable
as String,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
