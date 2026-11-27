import 'dart:async';

import 'package:dio/dio.dart';
import 'package:enterprise_app/core/network/secure_storage_service.dart';
import 'package:enterprise_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:enterprise_app/features/auth/domain/entities/auth_result.dart';
import 'package:enterprise_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:enterprise_app/features/auth/presentation/providers/auth_providers.dart';
import 'package:enterprise_app/features/auth/presentation/providers/logout_notifier.dart';
import 'package:enterprise_app/features/parties/domain/entities/merge_parties_result.dart';
import 'package:enterprise_app/features/parties/domain/entities/party.dart';
import 'package:enterprise_app/features/parties/domain/entities/party_detail.dart';
import 'package:enterprise_app/features/parties/domain/repositories/parties_repository.dart';
import 'package:enterprise_app/features/parties/presentation/providers/parties_notifier.dart';
import 'package:enterprise_app/features/parties/presentation/providers/parties_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/mock_dio.dart';

class FakeAuthRepository implements AuthRepository {
  int logoutCalls = 0;
  Completer<void>? logoutCompleter;

  @override
  Future<void> logout() {
    logoutCalls++;
    return logoutCompleter?.future ?? Future.value();
  }

  @override
  Future<AuthResult> login({
    required String email,
    required String password,
    required String tenantId,
  }) => throw UnimplementedError();

  @override
  Future<AuthSession> verifyTwoFactor({
    required String tempToken,
    required String code,
  }) => throw UnimplementedError();
}

class FakeSecureStorage extends SecureStorageService {
  String? token;
  String? tenantId;

  @override
  Future<String?> readAccessToken() async => token;

  @override
  Future<String?> readTenantId() async => tenantId;

  @override
  Future<void> clear() async {
    token = null;
    tenantId = null;
  }
}

class FakePartiesRepository implements PartiesRepository {
  int fetchCalls = 0;

  @override
  Future<List<Party>> getParties() async {
    fetchCalls++;
    return const [];
  }

  @override
  Future<PartyDetail> getPartyById(String partyId) =>
      throw UnimplementedError();

  @override
  Future<Party> createParty(CreatePartyParams params) =>
      throw UnimplementedError();

  @override
  Future<void> updateParty(String partyId, UpdatePartyParams params) =>
      throw UnimplementedError();

  @override
  Future<MergePartiesResult> mergeParties({
    required String sourcePartyId,
    required String targetPartyId,
  }) => throw UnimplementedError();
}

void main() {
  late FakeAuthRepository repository;
  late ProviderContainer container;

  setUp(() {
    repository = FakeAuthRepository();
    container = ProviderContainer(
      overrides: [
        authRepositoryProvider.overrideWith((ref) async => repository),
      ],
    );
    addTearDown(container.dispose);
  });

  test('ejecuta logout y deja el estado en data', () async {
    final sub = container.listen(logoutProvider, (previous, next) {});
    addTearDown(sub.close);

    await container.read(logoutProvider.notifier).logout();

    expect(repository.logoutCalls, 1);
    expect(container.read(logoutProvider), isA<AsyncData<void>>());
  });

  test('expone AsyncLoading mientras cierra la sesión', () async {
    final sub = container.listen(logoutProvider, (previous, next) {});
    addTearDown(sub.close);
    repository.logoutCompleter = Completer<void>();

    final future = container.read(logoutProvider.notifier).logout();
    expect(container.read(logoutProvider), isA<AsyncLoading<void>>());

    repository.logoutCompleter!.complete();
    await future;
    expect(container.read(logoutProvider), isA<AsyncData<void>>());
  });

  test('invalida la caché de Parties al cerrar sesión', () async {
    final parties = FakePartiesRepository();
    final local = ProviderContainer(
      overrides: [
        authRepositoryProvider.overrideWith((ref) async => repository),
        partiesRepositoryProvider.overrideWith((ref) async => parties),
      ],
    );
    addTearDown(local.dispose);

    final partiesSub = local.listen(partiesProvider, (previous, next) {});
    addTearDown(partiesSub.close);
    final logoutSub = local.listen(logoutProvider, (previous, next) {});
    addTearDown(logoutSub.close);

    await local.read(partiesProvider.future);
    expect(parties.fetchCalls, 1);

    await local.read(logoutProvider.notifier).logout();
    await local.read(partiesProvider.future);

    expect(parties.fetchCalls, 2);
  });

  test(
    'a través del flujo real llama al endpoint y limpia el storage',
    () async {
      final storage = FakeSecureStorage()
        ..token = 'token-123'
        ..tenantId = 'tenant-1';
      final adapter = MockAdapter((options, body) async {
        expect(options.method, 'POST');
        expect(options.path, '/auth/logout');
        return ResponseBody.fromString('', 204);
      });
      final dio = Dio(BaseOptions(baseUrl: 'http://test.local/api/v1'))
        ..httpClientAdapter = adapter;
      final realRepository = AuthRepositoryImpl(dio, storage);

      final local = ProviderContainer(
        overrides: [
          authRepositoryProvider.overrideWith((ref) async => realRepository),
        ],
      );
      addTearDown(local.dispose);
      final sub = local.listen(logoutProvider, (previous, next) {});
      addTearDown(sub.close);

      await local.read(logoutProvider.notifier).logout();

      expect(adapter.lastOptions?.path, '/auth/logout');
      expect(storage.token, isNull);
      expect(storage.tenantId, isNull);
    },
  );
}
