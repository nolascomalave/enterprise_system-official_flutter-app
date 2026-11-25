import 'package:enterprise_app/features/parties/domain/entities/party.dart';
import 'package:enterprise_app/features/parties/domain/entities/party_detail.dart';
import 'package:enterprise_app/features/parties/domain/repositories/parties_repository.dart';
import 'package:enterprise_app/features/parties/presentation/pages/party_detail_page.dart';
import 'package:enterprise_app/features/parties/presentation/providers/parties_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

class FakePartiesRepository implements PartiesRepository {
  @override
  Future<PartyDetail> getPartyById(String partyId) async => detail;

  @override
  Future<List<Party>> getParties() async => const [];

  @override
  Future<Party> createParty(CreatePartyParams params) {
    throw UnimplementedError();
  }
}

const detail = PartyDetail(
  id: 'p1',
  displayName: 'Acme Corp',
  partyType: 'ORGANIZATION',
  recordStatus: 'ACTIVE',
  createdAt: '2026-01-15T10:00:00Z',
  organization: OrganizationInfo(
    legalName: 'Acme Corporation S.A.',
    tradeName: 'Acme',
    taxId: 'B12345678',
  ),
  contacts: [
    PartyContact(type: 'EMAIL', value: 'ana@acme.com', isPrimary: true),
    PartyContact(type: 'PHONE', value: '+34 600 000 000'),
  ],
  addresses: [
    PartyAddress(type: 'LEGAL', text: 'Av. Principal 123, Madrid'),
  ],
  names: [
    PartyNameEntry(name: 'Acme Corp', validFrom: '2026-01-01', validTo: '2026-11-01'),
  ],
);

Widget buildPage() {
  return ProviderScope(
    overrides: [
      partiesRepositoryProvider.overrideWith((ref) async => FakePartiesRepository()),
    ],
    child: MaterialApp(
      theme: ThemeData.dark(useMaterial3: true)
          .copyWith(splashFactory: InkRipple.splashFactory),
      home: const PartyDetailPage(partyId: 'p1'),
    ),
  );
}

void main() {
  testWidgets('renderiza el perfil de la party', (tester) async {
    await tester.pumpWidget(buildPage());
    await tester.pump();
    await tester.pumpAndSettle();

    // Header.
    expect(find.text('Acme Corp'), findsOneWidget);
    expect(find.text('Organización'), findsOneWidget);
    expect(find.text('Activo'), findsOneWidget);

    // Perfil (organización).
    expect(find.text('Razón social'), findsOneWidget);
    expect(find.text('Acme Corporation S.A.'), findsOneWidget);
    expect(find.text('Tax ID'), findsOneWidget);
    expect(find.text('B12345678'), findsOneWidget);
  });

  testWidgets('muestra contactos con badge Principal', (tester) async {
    await tester.pumpWidget(buildPage());
    await tester.pump();
    await tester.pumpAndSettle();

    await tester.tap(find.text('Contactos'));
    await tester.pumpAndSettle();

    expect(find.text('ana@acme.com'), findsOneWidget);
    expect(find.text('Principal'), findsOneWidget);
    expect(find.text('+34 600 000 000'), findsOneWidget);
  });

  testWidgets('muestra direcciones y nombres históricos', (tester) async {
    await tester.pumpWidget(buildPage());
    await tester.pump();
    await tester.pumpAndSettle();

    await tester.tap(find.text('Direcciones'));
    await tester.pumpAndSettle();
    expect(find.text('Av. Principal 123, Madrid'), findsOneWidget);
    expect(find.text('LEGAL'), findsOneWidget);

    await tester.tap(find.text('Nombres'));
    await tester.pumpAndSettle();
    // El nombre aparece en el header y en el histórico.
    expect(find.text('Acme Corp'), findsNWidgets(2));
    expect(find.textContaining('2026-01-01'), findsOneWidget);
  });
}
