import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/dio_client.dart';
import '../../data/repositories/relationships_repository_impl.dart';
import '../../domain/repositories/relationships_repository.dart';
import '../../domain/usecases/relationships_usecases.dart';

final relationshipsRepositoryProvider = FutureProvider<RelationshipsRepository>(
  (ref) async {
    final dio = await ref.watch(dioProvider.future);
    return RelationshipsRepositoryImpl(dio);
  },
);

final getRelationshipsUseCaseProvider = FutureProvider<GetRelationshipsUseCase>(
  (ref) async {
    final repository = await ref.watch(relationshipsRepositoryProvider.future);
    return GetRelationshipsUseCase(repository);
  },
);

final initiateRelationshipUseCaseProvider =
    FutureProvider<InitiateRelationshipUseCase>((ref) async {
      final repository = await ref.watch(
        relationshipsRepositoryProvider.future,
      );
      return InitiateRelationshipUseCase(repository);
    });

final emitInviteTokenUseCaseProvider = FutureProvider<EmitInviteTokenUseCase>((
  ref,
) async {
  final repository = await ref.watch(relationshipsRepositoryProvider.future);
  return EmitInviteTokenUseCase(repository);
});

final consumeInviteTokenUseCaseProvider =
    FutureProvider<ConsumeInviteTokenUseCase>((ref) async {
      final repository = await ref.watch(
        relationshipsRepositoryProvider.future,
      );
      return ConsumeInviteTokenUseCase(repository);
    });

final rejectRelationshipUseCaseProvider =
    FutureProvider<RejectRelationshipUseCase>((ref) async {
      final repository = await ref.watch(
        relationshipsRepositoryProvider.future,
      );
      return RejectRelationshipUseCase(repository);
    });

final revokeRelationshipUseCaseProvider =
    FutureProvider<RevokeRelationshipUseCase>((ref) async {
      final repository = await ref.watch(
        relationshipsRepositoryProvider.future,
      );
      return RevokeRelationshipUseCase(repository);
    });

final cancelRelationshipUseCaseProvider =
    FutureProvider<CancelRelationshipUseCase>((ref) async {
      final repository = await ref.watch(
        relationshipsRepositoryProvider.future,
      );
      return CancelRelationshipUseCase(repository);
    });

/// Tenant actual (guardado en login) para determinar el rol holding/filial.
final currentTenantIdProvider = FutureProvider<String?>((ref) async {
  final storage = ref.watch(secureStorageProvider);
  return storage.readTenantId();
});
