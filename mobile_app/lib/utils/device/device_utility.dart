import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;

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
    
    // Check if the device is connected to a network (Wi-Fi or mobile data) but not necessarily the internet
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      return false; // No internet connection
    }

    // Perform an actual internet check
  // try {
  //   final response = await http.get(Uri.parse('https://www.google.com')).timeout(
  //     const Duration(seconds: 5), // Timeout after 5 seconds
  //   );
  //   if (response.statusCode == 200) {
  //     return true; // Internet is accessible
  //   }
  // } catch (e) {
  //   // Handle exceptions like timeout or no response
  //   debugPrint('Internet check failed: $e');
  //   return false;
  // }

    return true; // Internet connection available
  }
}
