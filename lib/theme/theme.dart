import 'package:flutter/material.dart';

class DodiddoneTheme {
  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF9f7bf6), // Фиолетовый
      brightness: Brightness.light,
      primary: const Color(0xFF9f7bf6), // Фиолетовый
      secondary: const Color(0xFF4ceb8b), // Зеленый
      error: Colors.red,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onError: Colors.white,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF9f7bf6), // Фиолетовый
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color(0xFF4ceb8b), // Зеленый
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF4ceb8b), // Зеленый
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: const Color(0xFF9f7bf6), // Фиолетовый
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: Color(0xFF9f7bf6)), // Фиолетовый
      ),
    ),
  );
}
