import 'package:flutter/material.dart';
import 'package:quick_help/utils/constants/appcolors.dart';

class QAppBarTheme {
  QAppBarTheme._(); // Private constructor to prevent instantiation

  static final LightAppBarTheme = AppBarTheme(
    backgroundColor: Colors.transparent,
    foregroundColor: Colors.transparent,
    elevation: 0,
    iconTheme: const IconThemeData(color: QAppColors.lightText),
    titleTextStyle: const TextStyle(
      color: QAppColors.lightText,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  );

  static final DarkAppBarTheme = AppBarTheme(
    backgroundColor: Colors.transparent,
    foregroundColor: Colors.transparent,
    elevation: 0,
    iconTheme: const IconThemeData(color: QAppColors.darkText),
    titleTextStyle: const TextStyle(
      color: QAppColors.darkText,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  );
}
