/// Aplicación cliente OAuth2 (M2M).
class ClientApplication {
  const ClientApplication({
    required this.id,
    required this.name,
    required this.clientId,
    required this.scopes,
    required this.isActive,
    this.clientSecret,
  });

  final String id;
  final String name;
  final String clientId;
  final List<String> scopes;
  final bool isActive;

  /// Solo presente en la respuesta de creación (se muestra una única vez).
  final String? clientSecret;

  String get statusLabel => isActive ? 'Activa' : 'Inactiva';
}
