import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/dio_client.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/verify_two_factor_usecase.dart';

/// Repositorio de autenticación (implementación real).
final authRepositoryProvider = FutureProvider<AuthRepository>((ref) async {
  final dio = await ref.watch(dioProvider.future);
  final storage = ref.watch(secureStorageProvider);
  return AuthRepositoryImpl(dio, storage);
});

final loginUseCaseProvider = FutureProvider<LoginUseCase>((ref) async {
  final repository = await ref.watch(authRepositoryProvider.future);
  return LoginUseCase(repository);
});

final verifyTwoFactorUseCaseProvider =
    FutureProvider<VerifyTwoFactorUseCase>((ref) async {
  final repository = await ref.watch(authRepositoryProvider.future);
  return VerifyTwoFactorUseCase(repository);
});
