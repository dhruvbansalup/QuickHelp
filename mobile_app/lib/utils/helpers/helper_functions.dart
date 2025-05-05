import 'package:flutter/material.dart';

class QHelperFunctions {
 QHelperFunctions._();

  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }
  
}