import 'package:flutter/material.dart';

class AppColors extends ThemeExtension<AppColors> {
  final Color primary;
  final Color secondary;
  final Color lightGrey;
  final Color white;
  final Color richBlack;
  final Color success;
  final Color error;

  AppColors({
    required this.primary,
    required this.secondary,
    required this.lightGrey,
    required this.white,
    required this.richBlack,
    required this.success,
    required this.error,
  });

  @override
  ThemeExtension<AppColors> copyWith() => this;

  @override
  ThemeExtension<AppColors> lerp(
          covariant ThemeExtension<AppColors>? other, double t) =>
      this;
}

class LightColor extends AppColors {
  LightColor()
      : super(
          primary: const Color(0xff0C54BE),
          secondary: const Color(0xFF303F60),
          lightGrey: const Color(0xFFced3dc),
          white: const Color(0xFFf5f9fd),
          richBlack: const Color(0xFF010B13),
          success: const Color(0xFF008F00),
          error: const Color(0xFFEC0000),
        );
}
