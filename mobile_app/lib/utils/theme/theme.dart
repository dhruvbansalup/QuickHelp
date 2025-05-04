import 'package:flutter/material.dart';
import 'package:quick_help/utils/constants/appcolors.dart';
import 'package:quick_help/utils/theme/custom_theme/appbar_theme.dart';
import 'package:quick_help/utils/theme/custom_theme/elevated_button_theme.dart';
import 'package:quick_help/utils/theme/custom_theme/text_theme.dart';

class QAppTheme {
  QAppTheme._(); // Private constructor to prevent instantiation

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: QAppColors.shade5,
    scaffoldBackgroundColor: QAppColors.scaffoldBackground,
    textTheme: QTextTheme.lightTextTheme,
    elevatedButtonTheme: QElevatedButtonTheme.LightElevatedButtonTheme,
    appBarTheme: QAppBarTheme.LightAppBarTheme,

  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: QAppColors.shade5,
    scaffoldBackgroundColor: Colors.black,
    textTheme: QTextTheme.darkTextTheme,
    appBarTheme: QAppBarTheme.DarkAppBarTheme
  );
}
