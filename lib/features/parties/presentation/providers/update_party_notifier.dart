import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/repositories/parties_repository.dart';
import 'parties_notifier.dart';
import 'parties_providers.dart';
import 'party_detail_notifier.dart';

part 'update_party_notifier.g.dart';

/// Acción de actualización de Party; refresca detalle y lista.
@riverpod
class UpdatePartyNotifier extends _$UpdatePartyNotifier {
  @override
  Future<void> build() async {}

  Future<void> updateParty({
    required String partyId,
    required UpdatePartyParams data,
  }) async {
    state = const AsyncLoading();
    try {
      final useCase = await ref.read(updatePartyUseCaseProvider.future);
      await useCase(partyId, data);

      ref.invalidate(partyDetailProvider(partyId));
      ref.invalidate(partiesProvider);

      // Espera el refresco del detalle para que la UI se actualice al cerrar.
      await ref.read(partyDetailProvider(partyId).future);

      state = const AsyncData(null);
    } catch (error, stack) {
      state = AsyncError(error, stack);
      rethrow;
    }
  }
}
