import 'package:enterprise_app/core/theme/app_colors.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AppColors (V5 Premium)', () {
    test('dark mode usa los tokens Zinc del design system', () {
      expect(AppColors.darkBackground, const Color(0xFF09090B));
      expect(AppColors.darkSurface, const Color(0xFF121212));
      expect(AppColors.darkTextPrimary, const Color(0xFFFAFAFA));
      expect(AppColors.darkTextSecondary, const Color(0xFFA1A1AA));
    });

    test('light mode usa los tokens Zinc del design system', () {
      expect(AppColors.lightBackground, const Color(0xFFF4F4F5));
      expect(AppColors.lightSurface, const Color(0xFFFFFFFF));
      expect(AppColors.lightTextPrimary, const Color(0xFF09090B));
      expect(AppColors.lightTextSecondary, const Color(0xFF71717A));
    });

    test('acento indigo del design system', () {
      expect(AppColors.indigo, const Color(0xFF6366F1));
    });
  });
}
