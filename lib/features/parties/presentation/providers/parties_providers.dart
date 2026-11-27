import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/dio_client.dart';
import '../../data/repositories/party_repository_impl.dart';
import '../../domain/repositories/parties_repository.dart';
import '../../domain/usecases/party_usecases.dart';

final partiesRepositoryProvider = FutureProvider<PartiesRepository>((
  ref,
) async {
  final dio = await ref.watch(dioProvider.future);
  return PartyRepositoryImpl(dio);
});

final getPartiesUseCaseProvider = FutureProvider<GetPartiesUseCase>((
  ref,
) async {
  final repository = await ref.watch(partiesRepositoryProvider.future);
  return GetPartiesUseCase(repository);
});

final getPartyDetailUseCaseProvider = FutureProvider<GetPartyDetailUseCase>((
  ref,
) async {
  final repository = await ref.watch(partiesRepositoryProvider.future);
  return GetPartyDetailUseCase(repository);
});

final createPartyUseCaseProvider = FutureProvider<CreatePartyUseCase>((
  ref,
) async {
  final repository = await ref.watch(partiesRepositoryProvider.future);
  return CreatePartyUseCase(repository);
});

final mergePartiesUseCaseProvider = FutureProvider<MergePartiesUseCase>((
  ref,
) async {
  final repository = await ref.watch(partiesRepositoryProvider.future);
  return MergePartiesUseCase(repository);
});

final updatePartyUseCaseProvider = FutureProvider<UpdatePartyUseCase>((
  ref,
) async {
  final repository = await ref.watch(partiesRepositoryProvider.future);
  return UpdatePartyUseCase(repository);
});
