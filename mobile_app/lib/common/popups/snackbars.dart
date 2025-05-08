import 'package:get/get.dart';
import 'package:flutter/material.dart';

class Qsnackbars {
  Qsnackbars._();


  static successSnackbar({title="Success", required message}) {
    return Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      snackPosition: SnackPosition.BOTTOM,
      colorText: Colors.white,
      backgroundColor: Colors.greenAccent,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(20),
      icon: const Icon(Icons.check_circle_outline),
      snackStyle: SnackStyle.FLOATING,
    );
  }


  static warningSnackbar({title="Warning", required message}) {
    return Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      snackPosition: SnackPosition.BOTTOM,
      colorText: Colors.white,
      backgroundColor: Colors.orangeAccent,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(20),
      icon: const Icon(Icons.warning_amber_outlined),
      snackStyle: SnackStyle.FLOATING,
    );
  }

  static errorSnackbar({title="Error", required message}) {
    return Get.snackbar(
      "Error",
      message,
      isDismissible: true,
      shouldIconPulse: true,
      snackPosition: SnackPosition.BOTTOM,
      colorText: Colors.white,
      backgroundColor: Colors.redAccent,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(20),
      icon: const Icon(Icons.error_outline),
      snackStyle: SnackStyle.FLOATING,
    );
  }
}
