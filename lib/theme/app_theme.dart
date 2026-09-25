import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {

  static const Color bg = Color(0xFF0F172A);
  static const Color blue = Color(0xFF3B82F6);
  static const Color lightBlue = Color(0xFF60A5FA);
  static const Color mist = Color(0xFFE2E8F0);

  static ThemeData get dark => _build(Brightness.dark);
  static ThemeData get light => _build(Brightness.light);

  static ThemeData _build(Brightness b) {
    final isDark = b == Brightness.dark;

    final scheme = ColorScheme.fromSeed(seedColor: blue, brightness: b).copyWith(
      primary: blue,
      onPrimary: Colors.white,
      secondary: lightBlue,
      surface: isDark ? const Color(0xFF162238) : Colors.white,
      onSurface: isDark ? mist : bg,
      outlineVariant: isDark ? const Color(0xFF26344F) : mist,
    );

    final base = ThemeData(useMaterial3: true, brightness: b, colorScheme: scheme);

    OutlineInputBorder border(Color c) => OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: c),
        );

    return base.copyWith(
      scaffoldBackgroundColor: isDark ? bg : const Color(0xFFF1F5F9),
      textTheme: GoogleFonts.poppinsTextTheme(base.textTheme).apply(
        bodyColor: scheme.onSurface,
        displayColor: scheme.onSurface,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        titleTextStyle: GoogleFonts.poppins(
            fontSize: 18, fontWeight: FontWeight.w600, color: scheme.onSurface),
      ),
      snackBarTheme: const SnackBarThemeData(behavior: SnackBarBehavior.floating),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: scheme.surface,
        border: border(scheme.outlineVariant),
        enabledBorder: border(scheme.outlineVariant),
        focusedBorder: border(blue),
      ),
    );
  }
}
