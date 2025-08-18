import 'package:flutter/material.dart';

class AppTheme {
  static const Color black = Color(0xFF171717);
  static const Color white = Color(0xFFFFFFFF);
  static const Color grey = Color(0xFFA0A0A0);

  static ThemeData lightTheme = ThemeData();
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppTheme.black,
    appBarTheme: AppBarTheme(
      backgroundColor: AppTheme.black,
      foregroundColor: AppTheme.white,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: white,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
    ),

    textTheme: TextTheme(
      titleLarge: TextStyle(
        color: white,
        fontSize: 24,
        fontWeight: FontWeight.w500,
      ),
      titleMedium: TextStyle(
        color: white,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      titleSmall: TextStyle(
        color: grey,
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}
