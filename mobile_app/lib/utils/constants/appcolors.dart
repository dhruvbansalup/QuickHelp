import "package:flutter/material.dart";

class QAppColors {
  QAppColors._(); // Private constructor to prevent instantiation
  
  static const Color scaffoldBackground = Color(0xFFFDF4E8);
  static const Color scaffoldBackgroundDark = Color(0xFF1A1A1A);

  static const Color shade0 = Color(0xFFE5FFFE);
  static const Color shade1 = Color(0xFFB0EEEB);
  static const Color shade2 = Color(0xFF8AE5E1);
  static const Color shade3 = Color(0xFF54D9D3);
  static const Color shade4 = Color(0xFF33D2CB);
  static const Color shade5 = Color(0xFF00C7BE);
  static const Color shade6 = Color(0xFF00B5AD);
  static const Color shade7 = Color(0xFF008D87);
  static const Color shade8 = Color(0xFF006D69);
  static const Color shade9 = Color(0xFF005450);

  static const Color text = Color(0xFF052C2A);
  static const Color subText = Color(0xFF4B5B5A);
  static const Color textBlue = Color(0xFF0033A0);

  static const Color lightText = QAppColors.shade9;
  static const Color darkText = Color(0xFFFFFFFF);

  static const Color transparentBlack = Color.fromRGBO(0, 0, 0, 0.5); // 50% opacity
  static const Color transparentWhite = Color.fromRGBO(255, 255, 255, 0.5);
  

  static const Color buttonColor = Color.fromARGB(255, 9, 22, 22);
  static const Color lightButtonColor = Color(0xFFFFFFFF);
}
  