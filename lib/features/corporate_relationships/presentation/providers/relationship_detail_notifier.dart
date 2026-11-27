import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/entities/corporate_relationship.dart';
import '../../domain/errors/relationship_not_found_exception.dart';
import 'relationships_notifier.dart';

part 'relationship_detail_notifier.g.dart';

/// Detalle de una relación corporativa.
///
/// El backend aún no expone `GET /tenant-relationships/{id}`: se filtra el
/// listado en memoria reutilizando [relationshipsProvider].
@riverpod
class RelationshipDetailNotifier extends _$RelationshipDetailNotifier {
  @override
  Future<CorporateRelationship> build(String relationshipId) async {
    final relationships = await ref.watch(relationshipsProvider.future);
    for (final relationship in relationships) {
      if (relationship.id == relationshipId) return relationship;
    }
    throw RelationshipNotFoundException(relationshipId);
  }
}
