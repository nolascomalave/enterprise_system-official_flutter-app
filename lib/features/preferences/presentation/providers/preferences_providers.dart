import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/menu/menu_providers.dart';
import '../../../../core/network/dio_client.dart';
import '../../data/repositories/preferences_repository_impl.dart';
import '../../domain/repositories/preferences_repository.dart';
import '../../domain/usecases/preferences_usecases.dart';

final preferencesRepositoryProvider =
    FutureProvider<PreferencesRepository>((ref) async {
  final dio = await ref.watch(dioProvider.future);
  return PreferencesRepositoryImpl(dio, ref.watch(appClientIdProvider));
});

final getPreferencesUseCaseProvider =
    FutureProvider<GetPreferencesUseCase>((ref) async {
  final repository = await ref.watch(preferencesRepositoryProvider.future);
  return GetPreferencesUseCase(repository);
});

final updatePreferencesUseCaseProvider =
    FutureProvider<UpdatePreferencesUseCase>((ref) async {
  final repository = await ref.watch(preferencesRepositoryProvider.future);
  return UpdatePreferencesUseCase(repository);
});
