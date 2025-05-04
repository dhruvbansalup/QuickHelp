import 'package:flutter/material.dart';
import 'package:quick_help/utils/constants/appcolors.dart';

class QElevatedButtonTheme {
  QElevatedButtonTheme._(); // Private constructor to prevent instantiation

  static final LightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      backgroundColor: QAppColors.buttonColor,
      foregroundColor: QAppColors.scaffoldBackground,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
      textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      side: const BorderSide(color: QAppColors.shade3),
    ),
  );

}
