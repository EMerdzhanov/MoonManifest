import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get dark {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.deepIndigo,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.mutedGold,
        secondary: AppColors.moonSilver,
        surface: AppColors.darkNavy,
        error: AppColors.error,
        onPrimary: AppColors.deepIndigo,
        onSecondary: AppColors.deepIndigo,
        onSurface: AppColors.textPrimary,
        onError: AppColors.deepIndigo,
      ),
      fontFamily: 'Inter',
      textTheme: const TextTheme(
        displayLarge: TextStyle(fontFamily: 'CormorantGaramond', fontSize: 36, fontWeight: FontWeight.w600, color: AppColors.textPrimary, letterSpacing: 0.5),
        displayMedium: TextStyle(fontFamily: 'CormorantGaramond', fontSize: 28, fontWeight: FontWeight.w600, color: AppColors.textPrimary),
        displaySmall: TextStyle(fontFamily: 'CormorantGaramond', fontSize: 22, fontWeight: FontWeight.w500, color: AppColors.textPrimary),
        headlineMedium: TextStyle(fontFamily: 'CormorantGaramond', fontSize: 20, fontWeight: FontWeight.w500, color: AppColors.textSecondary),
        bodyLarge: TextStyle(fontFamily: 'Inter', fontSize: 16, fontWeight: FontWeight.w400, color: AppColors.textPrimary, height: 1.6),
        bodyMedium: TextStyle(fontFamily: 'Inter', fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.textSecondary, height: 1.5),
        bodySmall: TextStyle(fontFamily: 'Inter', fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.textMuted),
        labelLarge: TextStyle(fontFamily: 'Inter', fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.mutedGold),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.mutedGold,
          foregroundColor: AppColors.deepIndigo,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          textStyle: const TextStyle(fontFamily: 'Inter', fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.cardDark,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: AppColors.mutedGold, width: 1)),
        hintStyle: const TextStyle(color: AppColors.textMuted),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      ),
      cardTheme: CardThemeData(color: AppColors.cardDark, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)), elevation: 0),
      appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent, elevation: 0, centerTitle: true),
    );
  }
}
