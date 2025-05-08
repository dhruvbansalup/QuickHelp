import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_help/utils/constants/appcolors.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class QFullScreenLoadingAnimation {
  static void start(bool isDark) {
    showDialog(
      context:
          Get.overlayContext!, // Ensuring non-null context for Overlay context
      barrierDismissible:
          false, // Prevents the dialog from being dismissed by tapping outside of it
      builder:
          (_) => PopScope(
            canPop:
                false, // Prevents the dialog from being dismissed by the back button
            child: Container(
              color: Colors.transparent,
              width: double.infinity,
              height: double.infinity,
              child: Column(
                children: [
                  const SizedBox(height: 100), // Space from the top

                  Center(
                    child: Column(
                      children: [
                        //Loading animation
                        LoadingAnimationWidget.staggeredDotsWave(
                          color:
                              isDark
                                  ? QAppColors.darkText
                                  : QAppColors.lightText,
                          size: 50.0,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
    );
  }

  static void stop() {
    // This method is used to close the loading dialog.
    if (Get.overlayContext != null) {
      // Check if the dialog is open before trying to close it
      Navigator.of(Get.overlayContext!).pop(); // Closes the dialog
    }
  }
}
