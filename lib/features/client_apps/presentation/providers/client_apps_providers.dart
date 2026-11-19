import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/dio_client.dart';
import '../../data/repositories/client_apps_repository_impl.dart';
import '../../domain/repositories/client_apps_repository.dart';
import '../../domain/usecases/client_apps_usecases.dart';

final clientAppsRepositoryProvider =
    FutureProvider<ClientAppsRepository>((ref) async {
  final dio = await ref.watch(dioProvider.future);
  return ClientAppsRepositoryImpl(dio);
});

final getClientAppsUseCaseProvider =
    FutureProvider<GetClientAppsUseCase>((ref) async {
  final repository = await ref.watch(clientAppsRepositoryProvider.future);
  return GetClientAppsUseCase(repository);
});

final createClientAppUseCaseProvider =
    FutureProvider<CreateClientAppUseCase>((ref) async {
  final repository = await ref.watch(clientAppsRepositoryProvider.future);
  return CreateClientAppUseCase(repository);
});
