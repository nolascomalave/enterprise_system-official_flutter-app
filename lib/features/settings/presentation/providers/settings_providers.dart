import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/dio_client.dart';
import '../../data/repositories/settings_repository_impl.dart';
import '../../domain/repositories/settings_repository.dart';
import '../../domain/usecases/settings_usecases.dart';

final settingsRepositoryProvider = FutureProvider<SettingsRepository>((ref) async {
  final dio = await ref.watch(dioProvider.future);
  return SettingsRepositoryImpl(dio);
});

final updateMfaPreferencesUseCaseProvider =
    FutureProvider<UpdateMfaPreferencesUseCase>((ref) async {
  final repository = await ref.watch(settingsRepositoryProvider.future);
  return UpdateMfaPreferencesUseCase(repository);
});

final setupTotpUseCaseProvider = FutureProvider<SetupTotpUseCase>((ref) async {
  final repository = await ref.watch(settingsRepositoryProvider.future);
  return SetupTotpUseCase(repository);
});

final verifyTotpUseCaseProvider = FutureProvider<VerifyTotpUseCase>((ref) async {
  final repository = await ref.watch(settingsRepositoryProvider.future);
  return VerifyTotpUseCase(repository);
});

final requestOtpUseCaseProvider = FutureProvider<RequestOtpUseCase>((ref) async {
  final repository = await ref.watch(settingsRepositoryProvider.future);
  return RequestOtpUseCase(repository);
});
