import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

void main() {
  test('app_en.arb y app_es.arb tienen exactamente las mismas claves', () {
    Map<String, dynamic> load(String path) =>
        jsonDecode(File(path).readAsStringSync()) as Map<String, dynamic>;

    final en = load('lib/core/i18n/l10n/app_en.arb');
    final es = load('lib/core/i18n/l10n/app_es.arb');

    final enKeys = en.keys.where((key) => !key.startsWith('@')).toSet();
    final esKeys = es.keys.where((key) => !key.startsWith('@')).toSet();

    expect(enKeys.difference(esKeys), isEmpty, reason: 'Faltan en español');
    expect(esKeys.difference(enKeys), isEmpty, reason: 'Faltan en inglés');
  });
}
