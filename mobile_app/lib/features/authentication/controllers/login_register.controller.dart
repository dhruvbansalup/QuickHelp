import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:quick_help/common/popups/snackbars.dart';
import 'package:quick_help/features/consumer.features/home/screens/home.consumer.dart';
import 'package:quick_help/features/service_provider.features/home/screens/home.serviceProvider.dart';
import 'package:quick_help/utils/constants/api_endpoints.dart';
import 'package:quick_help/utils/device/device_utility.dart';
import 'package:quick_help/common/popups/full_screen_loading_animation.dart';

class LoginRegisterController extends GetxController {
  // Singleton pattern to ensure only one instance of the controller exists
  static LoginRegisterController get instace => Get.find();

  // UI state variables
  final hidePassword = true.obs; // For password visibility toggle
  final rememberMe = false.obs; //checkbox

  // Fields
  final email = TextEditingController();
  final password = TextEditingController();
  final role = 'consumer'.obs; // Default role is 'consumer'

  //Snackbar variables
  String? snackbarMessage = "";
  int? snackbarType = -1; // 0 = success, 1 = error, 2 = warning

  // Form key for form validation
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> loginSignUp() async {
    try {
      //Start Loading
      QFullScreenLoadingAnimation.start(Get.isDarkMode);

      // Check Internet Connection
      final hasInternet = await QDeviceUtility.hasInternetConnection();
      if (!hasInternet) {
        snackbarType = 1; // Warning
        snackbarMessage = '${snackbarMessage ?? ''}No Internet Connection';
        return;
      }

      //Form Validation
      if (!formKey.currentState!.validate()) {
        snackbarType = 2; // Warning
        snackbarMessage =
            '${snackbarMessage ?? ''}Please fill all the fields correctly';
        return;
      }

      // Check if user is already registered
      bool isUserExist = false;

      final userExistResponse = await http.post(
        Uri.parse(QApiEndpoints.doesUserExist!),
        body: {'email': email.text.trim(), 'role': role.value},
      );

      if (userExistResponse.statusCode == 200) {
        isUserExist = true;
      } else if (userExistResponse.statusCode == 500) {
        isUserExist = false;
      } else {
        snackbarType = 1; // Error
        snackbarMessage =
            (snackbarMessage ?? '') +
            jsonDecode(userExistResponse.body)['message'];
        return; // Stop execution if the check fails
      }

      //Register User if not exist
      if (!isUserExist) {
        final registerResponse = await http.post(
          Uri.parse(QApiEndpoints.registerUser!),
          body: {
            'email': email.text.trim(),
            'password': password.text.trim(),
            'role': role.value,
          },
        );

        if (registerResponse.statusCode == 201) {
          snackbarType = 0; // Success
          snackbarMessage =
              (snackbarMessage ?? '') +
              jsonDecode(registerResponse.body)['message'];
        } else {
          snackbarType = 1; // Error
          snackbarMessage =
              (snackbarMessage ?? '') +
              jsonDecode(registerResponse.body)['message'];
          return; // Stop execution if registration fails
        }
      }

      // Login User
      final loginResponse = await http.post(
        Uri.parse(QApiEndpoints.loginUser!),
        body: {
          'email': email.text.trim(),
          'password': password.text.trim(),
          'role': role.value,
        },
      );
      if (loginResponse.statusCode == 200) {
        snackbarType = 0; // Success
        snackbarMessage =
            (snackbarMessage ?? '') + jsonDecode(loginResponse.body)['message'];
      } else {
        snackbarType = 1; // Error
        snackbarMessage =
            (snackbarMessage ?? '') + jsonDecode(loginResponse.body)['message'];
        return; // Stop execution if login fails
      }

      // // move to required screen based on role
      if (role.value == "consumer") {
        // Navigate to Consumer Home Screen
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Get.offAll(() => const ConsumerHome());
        });
      } else if (role.value == "service_provider") {
        // Navigate to Service Provider Home Screen
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Get.offAll(() => const ServiceProviderHome());
        });
      } else if (role.value == "admin") {
        snackbarType = 1; // Error
        snackbarMessage =
            '${snackbarMessage ?? ''}Admin login not supported!';
      } else {
        snackbarType = 1; // Error
        snackbarMessage = '${snackbarMessage ?? ''}Role not recognized';
      }
    } catch (e) {
      snackbarType = 1; // Error
      snackbarMessage = e.toString();
    } finally {
      //Clear the text fields
      email.clear();
      password.clear();

      //Stop Loading
      QFullScreenLoadingAnimation.stop();

      //Show snackbars
      if (snackbarMessage != null) {
        if (snackbarType == 0) {
          Qsnackbars.successSnackbar(message: snackbarMessage!);
        } else if (snackbarType == 1) {
          Qsnackbars.errorSnackbar(message: snackbarMessage!);
        } else if (snackbarType == 2) {
          Qsnackbars.warningSnackbar(message: snackbarMessage!);
        }
      }
    }
  }
}
