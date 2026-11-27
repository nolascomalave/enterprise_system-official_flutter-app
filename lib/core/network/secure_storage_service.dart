import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Persistencia segura de tokens y datos de sesión.
///
/// Los tokens se guardan cifrados en el keychain/keystore nativo
/// (WebCrypto en web). Las cookies de refresh las gestiona `cookie_jar`.
class SecureStorageService {
  SecureStorageService({FlutterSecureStorage? storage})
    : _storage = storage ?? const FlutterSecureStorage();

  final FlutterSecureStorage _storage;

  static const String accessTokenKey = 'access_token';
  static const String tenantIdKey = 'tenant_id';
  static const String appClientIdKey = 'app_client_id';

  Future<String?> readAccessToken() => _storage.read(key: accessTokenKey);

  Future<void> saveAccessToken(String token) =>
      _storage.write(key: accessTokenKey, value: token);

  Future<String?> readTenantId() => _storage.read(key: tenantIdKey);

  Future<void> saveTenantId(String tenantId) =>
      _storage.write(key: tenantIdKey, value: tenantId);

  Future<bool> hasSession() async {
    final token = await readAccessToken();
    return token != null && token.isNotEmpty;
  }

  /// Limpia la sesión local (logout / refresh fallido).
  Future<void> clear() async {
    await _storage.delete(key: accessTokenKey);
    await _storage.delete(key: tenantIdKey);
  }
}
