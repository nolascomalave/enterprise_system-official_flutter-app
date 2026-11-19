import 'package:material_ui/material_ui.dart';

/// Tokens de color del Design System V5 Premium.
///
/// Paleta Zinc + acento Indigo/Violeta.
abstract final class AppColors {
  // --- Marca / acento ---
  static const Color indigo = Color(0xFF6366F1); // indigo-500 (dark accent)
  static const Color indigoStrong = Color(0xFF4F46E5); // indigo-600 (light accent)
  static const Color indigoSoft = Color(0xFF818CF8); // indigo-400 (dark text accent)
  static const Color violet = Color(0xFF8B5CF6); // violet-500
  static const Color purple = Color(0xFF9333EA); // purple-600

  // --- Light mode ---
  static const Color lightBackground = Color(0xFFF4F4F5); // zinc-100
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color lightSurfaceMuted = Color(0xFFF4F4F5);
  static const Color lightTextPrimary = Color(0xFF09090B); // zinc-950
  static const Color lightTextSecondary = Color(0xFF71717A); // zinc-500
  static const Color lightBorder = Color(0x0D000000); // black/5

  // --- Dark mode ---
  static const Color darkBackground = Color(0xFF09090B); // zinc-950
  static const Color darkSurface = Color(0xFF121212);
  static const Color darkSurfaceElevated = Color(0xFF18181B); // zinc-900
  static const Color darkTextPrimary = Color(0xFFFAFAFA); // zinc-50
  static const Color darkTextSecondary = Color(0xFFA1A1AA); // zinc-400
  static const Color darkBorder = Color(0x0DFFFFFF); // white/5

  // --- Semánticos ---
  static const Color success = Color(0xFF10B981); // emerald-500
  static const Color warning = Color(0xFFF59E0B); // amber-500
  static const Color danger = Color(0xFFEF4444); // red-500
}

/// Sombras premium (equivalente a `.shadow-premium` del mockup V5).
abstract final class AppShadows {
  /// Light: `0 0 0 1px rgba(0,0,0,.03), 0 2px 4px rgba(0,0,0,.05), 0 12px 24px rgba(0,0,0,.05)`
  static const List<BoxShadow> premiumLight = [
    BoxShadow(offset: Offset.zero, blurRadius: 0, spreadRadius: 1, color: Color(0x08000000)),
    BoxShadow(offset: Offset(0, 2), blurRadius: 4, color: Color(0x0D000000)),
    BoxShadow(offset: Offset(0, 12), blurRadius: 24, color: Color(0x0D000000)),
  ];

  /// Dark: `inset 0 1px 0 white/5, 0 0 0 1px white/5, 0 20px 40px -10px black/50`
  static const List<BoxShadow> premiumDark = [
    BoxShadow(offset: Offset(0, 1), blurRadius: 0, spreadRadius: 0, color: Color(0x0DFFFFFF)),
    BoxShadow(offset: Offset.zero, blurRadius: 0, spreadRadius: 1, color: Color(0x0DFFFFFF)),
    BoxShadow(offset: Offset(0, 20), blurRadius: 40, spreadRadius: -10, color: Color(0x80000000)),
  ];
}
