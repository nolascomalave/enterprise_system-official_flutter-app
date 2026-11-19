import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../network/dio_client.dart';
import 'data/menu_repository.dart';

/// Client application UUID usado por `/rbac/my-menu`.
///
/// Configurable en build/run:
/// `flutter run --dart-define=APP_CLIENT_ID=<uuid>`
const String defaultAppClientId = String.fromEnvironment(
  'APP_CLIENT_ID',
  defaultValue: 'first-party-app',
);

final appClientIdProvider = Provider<String>((ref) => defaultAppClientId);

final menuRepositoryProvider = FutureProvider<MenuRepository>((ref) async {
  final dio = await ref.watch(dioProvider.future);
  return MenuRepositoryImpl(dio);
});
