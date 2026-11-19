import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/entities/party.dart';
import '../../domain/repositories/parties_repository.dart';
import 'parties_providers.dart';

part 'parties_notifier.g.dart';

/// Lista de parties + creación (refresca al crear).
@riverpod
class PartiesNotifier extends _$PartiesNotifier {
  @override
  Future<List<Party>> build() async {
    final useCase = await ref.watch(getPartiesUseCaseProvider.future);
    return useCase();
  }

  /// Crea una party y refresca la lista.
  Future<Party> createParty(CreatePartyParams params) async {
    final useCase = await ref.read(createPartyUseCaseProvider.future);
    final party = await useCase(params);
    ref.invalidateSelf();
    await future;
    return party;
  }

  /// Recarga manual (pull-to-refresh / reintento).
  Future<void> refresh() async {
    ref.invalidateSelf();
    await future;
  }
}
