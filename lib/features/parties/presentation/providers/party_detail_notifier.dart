import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/entities/party_detail.dart';
import 'parties_providers.dart';

part 'party_detail_notifier.g.dart';

/// Detalle de una party por ID (family).
@riverpod
class PartyDetailNotifier extends _$PartyDetailNotifier {
  @override
  Future<PartyDetail> build(String partyId) async {
    final useCase = await ref.watch(getPartyDetailUseCaseProvider.future);
    return useCase(partyId);
  }

  Future<void> refresh() async {
    ref.invalidateSelf();
    await future;
  }
}
