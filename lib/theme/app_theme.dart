import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppTheme {
  ThemeData get light => _base(LightColor());

  ThemeData _base(AppColors color) {
    return ThemeData(
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: color.primary,
        foregroundColor: color.lightGrey,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: color.white,
        elevation: 2,
        centerTitle: true,
      ),
      // TextEditingController
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: TextStyle(color: color.primary),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: color.primary),
        ),
      ),
      // default
      primaryTextTheme: TextTheme(
        labelLarge: GoogleFonts.poppins(
          fontSize: 24,
          color: color.primary,
          fontWeight: FontWeight.w600,
        ),
        labelMedium: GoogleFonts.poppins(
          fontSize: 20,
          color: color.primary,
          fontWeight: FontWeight.w600,
        ),
        labelSmall: GoogleFonts.poppins(
          fontSize: 14,
          color: color.richBlack,
          fontWeight: FontWeight.w500,
        ),
      ),
      textTheme: TextTheme(
        // heading
        displayLarge: GoogleFonts.poppins(
          fontSize: 36,
          color: color.primary,
          shadows: [
            const Shadow(
              color: Colors.grey,
              offset: Offset(1, 1),
              blurRadius: 2,
            ),
          ],
          fontWeight: FontWeight.bold,
        ),
        displayMedium: GoogleFonts.poppins(
          fontSize: 32,
          color: color.primary,
          shadows: [
            const Shadow(
              color: Colors.grey,
              offset: Offset(1, 1),
              blurRadius: 2,
            ),
          ],
          fontWeight: FontWeight.bold,
        ),
        displaySmall: GoogleFonts.poppins(
          fontSize: 28,
          color: color.primary,
          fontWeight: FontWeight.bold,
        ),
        // title
        titleLarge: GoogleFonts.poppins(
          fontSize: 24,
          color: color.primary,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.1,
        ),
        titleMedium: GoogleFonts.poppins(
          fontSize: 20,
          color: color.primary,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.1,
        ),
        titleSmall: GoogleFonts.poppins(
          fontSize: 16,
          color: color.primary,
          fontWeight: FontWeight.normal,
          letterSpacing: 0.1,
        ),
        // description
        bodyLarge: GoogleFonts.poppins(
          fontSize: 18,
          color: color.richBlack,
        ),
      ),
      useMaterial3: true,
      extensions: [color],
      scaffoldBackgroundColor: color.white,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(color.primary),
          foregroundColor: WidgetStatePropertyAll(color.white),
          textStyle: WidgetStateProperty.all(
            const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: WidgetStatePropertyAll(color.primary),
          textStyle: WidgetStateProperty.all(
            const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
