import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';

class QDeviceUtility {
  static double getDeviceWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double getDeviceHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double getDeviceAspectRatio(BuildContext context) {
    return getDeviceWidth(context) / getDeviceHeight(context);
  }

  static bool isPortrait(BuildContext context) {
    return getDeviceAspectRatio(context) < 1;
  }

  static bool isLandscape(BuildContext context) {
    return getDeviceAspectRatio(context) > 1;
  }

  static void vibrateDevice(Duration duration) {
    HapticFeedback.vibrate();
    Future.delayed(duration, () {
      HapticFeedback.vibrate();
    });
  }

  static Future<bool> hasInternetConnection() async {
    try{
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
    } on SocketException catch (_) {
      return false;
    }
    return false; // Ensure a return value in all cases
  }
  

}
