/// Resultado de una fusión de parties (Golden Record).
class MergePartiesResult {
  const MergePartiesResult({
    required this.sourceId,
    required this.targetId,
    this.compressedPartyIds = const [],
    this.mergedAt,
  });

  final String sourceId;
  final String targetId;

  /// Parties que fueron comprimidas hacia el target.
  final List<String> compressedPartyIds;
  final String? mergedAt;
}
