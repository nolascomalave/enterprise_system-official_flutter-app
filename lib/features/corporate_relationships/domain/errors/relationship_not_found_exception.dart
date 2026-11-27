/// La relación solicitada no existe en el listado del tenant.
class RelationshipNotFoundException implements Exception {
  const RelationshipNotFoundException(this.relationshipId);

  final String relationshipId;

  @override
  String toString() => 'RelationshipNotFoundException($relationshipId)';
}
