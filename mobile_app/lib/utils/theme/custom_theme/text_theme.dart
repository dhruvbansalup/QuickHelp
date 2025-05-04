import 'package:flutter/material.dart';
import 'package:quick_help/utils/constants/appcolors.dart';

class QTextTheme {
  QTextTheme._(); // Private constructor to prevent instantiation

  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: TextStyle().copyWith(fontSize: 28, fontWeight: FontWeight.bold, color: QAppColors.lightText),
    headlineMedium: TextStyle().copyWith(fontSize: 24, fontWeight: FontWeight.bold, color: QAppColors.lightText),
    headlineSmall: TextStyle().copyWith(fontSize: 20, fontWeight: FontWeight.bold, color: QAppColors.lightText),
    titleLarge: TextStyle().copyWith(fontSize: 18, fontWeight: FontWeight.bold, color: QAppColors.lightText),
    titleMedium: TextStyle().copyWith(fontSize: 16, fontWeight: FontWeight.bold, color: QAppColors.lightText),
    titleSmall: TextStyle().copyWith(fontSize: 14, fontWeight: FontWeight.bold, color: QAppColors.lightText),
    bodyLarge: TextStyle().copyWith(fontSize: 16, fontWeight: FontWeight.normal, color: QAppColors.lightText),
    bodyMedium: TextStyle().copyWith(fontSize: 14, fontWeight: FontWeight.normal, color: QAppColors.lightText),
    bodySmall: TextStyle().copyWith(fontSize: 12, fontWeight: FontWeight.normal, color: QAppColors.lightText),
    
  );

  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: TextStyle().copyWith(fontSize: 28, fontWeight: FontWeight.bold, color: QAppColors.darkText),
    headlineMedium: TextStyle().copyWith(fontSize: 24, fontWeight: FontWeight.bold, color: QAppColors.darkText),
    headlineSmall: TextStyle().copyWith(fontSize: 20, fontWeight: FontWeight.bold, color: QAppColors.darkText),
    titleLarge: TextStyle().copyWith(fontSize: 18, fontWeight: FontWeight.bold, color: QAppColors.darkText),
    titleMedium: TextStyle().copyWith(fontSize: 16, fontWeight: FontWeight.bold, color: QAppColors.darkText),
    titleSmall: TextStyle().copyWith(fontSize: 14, fontWeight: FontWeight.bold, color: QAppColors.darkText),
    bodyLarge: TextStyle().copyWith(fontSize: 16, fontWeight: FontWeight.normal, color: QAppColors.darkText),
    bodyMedium: TextStyle().copyWith(fontSize: 14, fontWeight: FontWeight.normal, color: QAppColors.darkText),
    bodySmall: TextStyle().copyWith(fontSize: 12, fontWeight: FontWeight.normal, color: QAppColors.darkText),
  );
}
