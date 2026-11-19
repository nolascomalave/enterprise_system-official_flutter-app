import 'package:enterprise_app/core/ui/app_shell.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('breakpoint responsive: sidebar en desktop, bottom nav en móvil', () {
    expect(isDesktopLayout(375), isFalse);
    expect(isDesktopLayout(768), isFalse);
    expect(isDesktopLayout(769), isTrue);
    expect(isDesktopLayout(1440), isTrue);
  });
}
