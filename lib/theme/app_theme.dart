import 'package:flutter/material.dart';

class AppTheme {
  static const Color background = Color(0xFF0F0E12);
  static const Color card = Color(0xFF17161B);
  static const Color line = Color(0xFF302E36);
  static const Color text = Color(0xFFF4F1EA);
  static const Color muted = Color(0xFF8D8982);
  static const Color gold = Color(0xFFD6AF36);

  static ThemeData get theme {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: background,

      colorScheme: const ColorScheme.dark(
        primary: gold,
        secondary: gold,
        surface: card,
      ),

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: card,

        labelStyle: const TextStyle(
          color: muted,
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: line,
          ),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: gold,
            width: 1.5,
          ),
        ),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: gold,
          foregroundColor: Colors.black,
          padding: const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 13,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),

      textTheme: const TextTheme(
        bodyMedium: TextStyle(
          color: text,
        ),
      ),
    );
  }
}