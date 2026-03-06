import 'package:flutter/material.dart';

class AppColors {

  static const Color darkBg2 = Color(0xFF1a1f2e);   
  static const Color disney_blue = Color(0xFF113CCF);
  static const Color disney_gold = Color(0xFFFFD700);
  static const Color disney_purple = Color(0xFF6B2D8F); 
  static const Color white = Color(0xFFFFFFFF);
  static const Color lightGrey = Color(0xFFE0E0E0);
  static const Color grey = Color(0xFF808080);
  static const Color darkGrey = Color(0xFF333333);
  static const Color darkBg = Color(0xFF0F1014);

}

class AppTypography {
  static const TextStyle heading1 = TextStyle(
    fontSize: 48,
    fontWeight: FontWeight.bold,
    letterSpacing: 2,
    color: AppColors.white,
  );

  static const TextStyle heading2 = TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.bold,
    letterSpacing: 1,
    color: AppColors.white,
  );

  static const TextStyle body = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    height: 1.6,
    color: AppColors.white,
  );
}