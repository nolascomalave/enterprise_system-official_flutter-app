/// Grupo corporativo (agrupa departamentos de distintas unidades).
class CorporateGroup {
  const CorporateGroup({required this.id, required this.name, this.description});

  final String id;
  final String name;
  final String? description;
}
