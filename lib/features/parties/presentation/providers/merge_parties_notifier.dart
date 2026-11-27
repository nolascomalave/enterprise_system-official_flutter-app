import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/entities/merge_parties_result.dart';
import 'parties_notifier.dart';
import 'parties_providers.dart';

part 'merge_parties_notifier.g.dart';

/// Acción de fusión (Golden Record) + refresco de la lista de parties.
@riverpod
class MergePartiesNotifier extends _$MergePartiesNotifier {
  @override
  Future<MergePartiesResult?> build() async => null;

  Future<MergePartiesResult> merge({
    required String sourcePartyId,
    required String targetPartyId,
  }) async {
    state = const AsyncLoading();
    try {
      final useCase = await ref.read(mergePartiesUseCaseProvider.future);
      final result = await useCase(
        sourcePartyId: sourcePartyId,
        targetPartyId: targetPartyId,
      );
      ref.invalidate(partiesProvider);
      state = AsyncData(result);
      return result;
    } catch (error, stack) {
      state = AsyncError(error, stack);
      rethrow;
    }
  }
}
