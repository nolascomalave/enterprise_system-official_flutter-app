// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_tree.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MenuNode _$MenuNodeFromJson(Map<String, dynamic> json) => _MenuNode(
  id: json['id'] as String,
  code: json['code'] as String,
  name: json['name'] as String,
  sortOrder: (json['sort_order'] as num?)?.toInt() ?? 0,
  children:
      (json['children'] as List<dynamic>?)
          ?.map((e) => MenuNode.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <MenuNode>[],
  options:
      (json['options'] as List<dynamic>?)
          ?.map((e) => MenuOption.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <MenuOption>[],
);

Map<String, dynamic> _$MenuNodeToJson(_MenuNode instance) => <String, dynamic>{
  'id': instance.id,
  'code': instance.code,
  'name': instance.name,
  'sort_order': instance.sortOrder,
  'children': instance.children,
  'options': instance.options,
};

_MenuOption _$MenuOptionFromJson(Map<String, dynamic> json) => _MenuOption(
  id: json['id'] as String,
  code: json['code'] as String,
  name: json['name'] as String,
  icon: json['icon'] as String? ?? '',
  route: json['route'] as String? ?? '',
  sortOrder: (json['sort_order'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$MenuOptionToJson(_MenuOption instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'icon': instance.icon,
      'route': instance.route,
      'sort_order': instance.sortOrder,
    };
