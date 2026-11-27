import 'package:enterprise_app/core/i18n/app_localizations_delegates.dart';
import 'package:enterprise_app/features/corporate_relationships/domain/entities/corporate_relationship.dart';
import 'package:enterprise_app/features/corporate_relationships/domain/repositories/relationships_repository.dart';
import 'package:enterprise_app/features/corporate_relationships/presentation/pages/relationship_detail_page.dart';
import 'package:enterprise_app/features/corporate_relationships/presentation/providers/relationships_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

class FakeRelationshipsRepository implements RelationshipsRepository {
  FakeRelationshipsRepository(this.relationships);

  final List<CorporateRelationship> relationships;

  @override
  Future<List<CorporateRelationship>> getRelationships() async => relationships;

  @override
  Future<void> initiate({required String holdingTenantId}) async {}

  @override
  Future<InviteToken> emitToken(String relationshipId) async =>
      const InviteToken(token: 'token');

  @override
  Future<void> consumeToken(String token) async {}

  @override
  Future<void> reject(String relationshipId, {String? reason}) async {}

  @override
  Future<void> revoke(String relationshipId, {String? reason}) async {}

  @override
  Future<void> cancel(String relationshipId) async {}
}

Widget buildPage(CorporateRelationship relationship, {String role = 'h1'}) {
  return ProviderScope(
    overrides: [
      relationshipsRepositoryProvider.overrideWith(
        (ref) async => FakeRelationshipsRepository([relationship]),
      ),
      currentTenantIdProvider.overrideWith((ref) async => role),
    ],
    child: MaterialApp(
      locale: const Locale('es'),
      localizationsDelegates: appLocalizationsDelegates,
      supportedLocales: appSupportedLocales,
      theme: ThemeData.dark(useMaterial3: true)
          .copyWith(splashFactory: InkRipple.splashFactory),
      home: RelationshipDetailPage(relationshipId: relationship.id),
    ),
  );
}

void main() {
  testWidgets('timeline de relación aprobada', (tester) async {
    const relationship = CorporateRelationship(
      id: 'r1',
      status: RelationshipStatus.approved,
      holdingId: 'h1',
      subsidiaryId: 's1',
      holdingName: 'Acme Holding',
      subsidiaryName: 'Acme Sub',
      requestedAt: '2026-01-01T10:00:00Z',
      approvedAt: '2026-01-02T14:30:00Z',
    );

    await tester.pumpWidget(buildPage(relationship));
    await tester.pumpAndSettle();

    expect(find.text('Acme Holding'), findsOneWidget);
    expect(find.text('Acme Sub'), findsOneWidget);
    expect(find.text('Aprobada'), findsOneWidget);
    expect(find.text('Relación iniciada'), findsOneWidget);
    expect(find.text('Relación aprobada'), findsOneWidget);
    expect(find.text('2026-01-01'), findsOneWidget);
    expect(find.text('2026-01-02'), findsOneWidget);
    expect(find.byKey(const Key('relationship_action_revoke')), findsOneWidget);
  });

  testWidgets('timeline de relación rechazada con motivo', (tester) async {
    const relationship = CorporateRelationship(
      id: 'r2',
      status: RelationshipStatus.rejected,
      holdingId: 'h1',
      subsidiaryId: 's1',
      requestedAt: '2026-02-01T10:00:00Z',
      rejectedAt: '2026-02-02T10:00:00Z',
      rejectionReason: 'Datos fiscales incompletos',
    );

    await tester.pumpWidget(buildPage(relationship));
    await tester.pumpAndSettle();

    expect(find.text('Rechazada'), findsOneWidget);
    expect(find.text('Relación rechazada'), findsOneWidget);
    expect(find.text('Motivo de rechazo'), findsOneWidget);
    expect(find.text('Datos fiscales incompletos'), findsOneWidget);
    expect(find.text('Relación aprobada'), findsNothing);
  });

  testWidgets('timeline muestra token emitido y acción de la filial', (
    tester,
  ) async {
    const relationship = CorporateRelationship(
      id: 'r3',
      status: RelationshipStatus.pending,
      holdingId: 'h1',
      subsidiaryId: 's1',
      requestedAt: '2026-03-01T10:00:00Z',
      tokenEmittedAt: '2026-03-01T11:00:00Z',
    );

    await tester.pumpWidget(buildPage(relationship, role: 's1'));
    await tester.pumpAndSettle();

    expect(find.text('Pendiente'), findsOneWidget);
    expect(find.text('Token emitido'), findsOneWidget);
    expect(find.text('2026-03-01'), findsNWidgets(2));
    expect(
      find.byKey(const Key('relationship_action_consume')),
      findsOneWidget,
    );
  });

  testWidgets('timeline REVOKED muestra revocación y no cancelación', (
    tester,
  ) async {
    const relationship = CorporateRelationship(
      id: 'r4',
      status: RelationshipStatus.revoked,
      holdingId: 'h1',
      subsidiaryId: 's1',
      requestedAt: '2026-04-01T10:00:00Z',
      approvedAt: '2026-04-02T10:00:00Z',
      revokedAt: '2026-04-03T10:00:00Z',
      revocationReason: 'Incumplimiento contractual',
      cancellationReason: 'Este motivo no debe mostrarse',
    );

    await tester.pumpWidget(buildPage(relationship));
    await tester.pumpAndSettle();

    expect(find.text('Revocada'), findsOneWidget);
    expect(find.text('Relación revocada'), findsOneWidget);
    expect(find.text('Motivo de revocación'), findsOneWidget);
    expect(find.text('Incumplimiento contractual'), findsOneWidget);
    expect(find.text('Relación cancelada'), findsNothing);
    expect(find.text('Motivo de cancelación'), findsNothing);
    expect(find.text('Este motivo no debe mostrarse'), findsNothing);
  });

  testWidgets('timeline CANCELED muestra cancelación y no revocación', (
    tester,
  ) async {
    const relationship = CorporateRelationship(
      id: 'r5',
      status: RelationshipStatus.cancelled,
      holdingId: 'h1',
      subsidiaryId: 's1',
      requestedAt: '2026-05-01T10:00:00Z',
      canceledAt: '2026-05-02T10:00:00Z',
      cancellationReason: 'Solicitud de la filial',
      revocationReason: 'Este motivo no debe mostrarse',
    );

    await tester.pumpWidget(buildPage(relationship));
    await tester.pumpAndSettle();

    expect(find.text('Cancelada'), findsOneWidget);
    expect(find.text('Relación cancelada'), findsOneWidget);
    expect(find.text('Motivo de cancelación'), findsOneWidget);
    expect(find.text('Solicitud de la filial'), findsOneWidget);
    expect(find.text('Relación revocada'), findsNothing);
    expect(find.text('Motivo de revocación'), findsNothing);
    expect(find.text('Este motivo no debe mostrarse'), findsNothing);
  });
}
