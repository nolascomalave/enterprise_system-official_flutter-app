import 'package:enterprise_app/core/i18n/app_localizations_delegates.dart';
import 'package:enterprise_app/features/parties/domain/entities/merge_parties_result.dart';
import 'package:enterprise_app/features/parties/domain/entities/party.dart';
import 'package:enterprise_app/features/parties/domain/entities/party_detail.dart';
import 'package:enterprise_app/features/parties/domain/repositories/parties_repository.dart';
import 'package:enterprise_app/features/parties/presentation/pages/parties_list_page.dart';
import 'package:enterprise_app/features/parties/presentation/providers/parties_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

class _FakePartiesRepository implements PartiesRepository {
  @override
  Future<List<Party>> getParties() async => const [
    Party(
      id: 'p1',
      displayName: 'Acme Corporation',
      partyType: PartyType.organization,
      legalName: 'Acme S.A.',
    ),
  ];

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

Widget _buildPage(Locale locale) {
  return ProviderScope(
    overrides: [
      partiesRepositoryProvider.overrideWith(
        (ref) async => _FakePartiesRepository(),
      ),
    ],
    child: MaterialApp(
      locale: locale,
      localizationsDelegates: appLocalizationsDelegates,
      supportedLocales: appSupportedLocales,
      theme: ThemeData.dark(useMaterial3: true)
          .copyWith(splashFactory: InkRipple.splashFactory),
      home: const Scaffold(body: PartiesListPage()),
    ),
  );
}

void main() {
  testWidgets('el título de Parties cambia al inglés al cambiar el locale', (
    tester,
  ) async {
    await tester.pumpWidget(_buildPage(const Locale('es')));
    await tester.pumpAndSettle();

    expect(find.text('Partes'), findsOneWidget);
    expect(find.text('Nueva Party'), findsOneWidget);
    expect(
      find.text('Personas y organizaciones de Acme Corporation'),
      findsOneWidget,
    );

    await tester.pumpWidget(_buildPage(const Locale('en')));
    await tester.pumpAndSettle();

    expect(find.text('Parties'), findsOneWidget);
    expect(find.text('New Party'), findsOneWidget);
    expect(
      find.text('People and organizations of Acme Corporation'),
      findsOneWidget,
    );
  });
}
