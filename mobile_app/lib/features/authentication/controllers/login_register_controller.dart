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

  // Form key for form validation
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> loginSignUp() async {
    try {
      //Start Loading
      QFullScreenLoadingAnimation.start(Get.isDarkMode);

      // Check Internet Connection
      final hasInternet = await QDeviceUtility.hasInternetConnection();
      if (!hasInternet) {
        Qsnackbars.warningSnackbar(message: 'No Internet Connection');
        return;
      }

      //Form Validation
      if (!formKey.currentState!.validate()) {
        //Form is not valid
        Qsnackbars.warningSnackbar(
          message: 'Please fill all the fields correctly',
        );
        return;
      }

      // Check if user is already registered

      bool isUserExist = false;

      await http
          .post(
            Uri.parse(QApiEndpoints.doesUserExist!),
            body: {'email': email.text.trim(), 'role': role.value},
          )
          .then((response) {
            if (response.statusCode == 200) {
              isUserExist = true;
            } else if (response.statusCode == 500) {
              isUserExist = false;
            } else {
              Qsnackbars.errorSnackbar(
                message: 'Something went wrong: ${response.body}',
              );
              return;
            }
          });

      //Register User if not exist
      if (!isUserExist) {
        await http
            .post(
              Uri.parse(QApiEndpoints.registerUser!),
              body: {
                'email': email.text.trim(),
                'password': password.text.trim(),
                'role': role.value,
              },
            )
            .then((response) {
              if (response.statusCode == 200) {
                Qsnackbars.successSnackbar(message: 'Registered successfully!');
              } else if (response.statusCode == 500) {
                Qsnackbars.warningSnackbar(
                  message: 'User registration failed!',
                );
                return;
              } else {
                Qsnackbars.errorSnackbar(
                  message: jsonDecode(response.body)['message'],
                );
                return;
              }
            });
      }

      // Login User
      http
          .post(
            Uri.parse(QApiEndpoints.loginUser!),
            body: {
              'email': email.text.trim(),
              'password': password.text.trim(),
              'role': role.value,
            },
          )
          .then((response) {
            if (response.statusCode == 200) {
              Qsnackbars.successSnackbar(
                title: "Login Successfull!!",
                message: jsonDecode(response.body)['message'],
              );
            } else if (response.statusCode == 500) {
              Qsnackbars.warningSnackbar(
                title: 'Login failed!',
                message: jsonDecode(response.body)['message'],
              );
              return;
            } else {
              Qsnackbars.errorSnackbar(
                message: jsonDecode(response.body)['message'],
              );
              return;
            }
          });

      // move to required screen based on role

      if (role.value == "consumer") {
        // Navigate to Consumer Home Screen
        Get.offAll(() => const ConsumerHome());
      } else if (role.value == "service_provider") {
        // Navigate to Service Provider Home Screen
        Get.offAll(() => const ServiceProviderHome());
      } else if (role.value == "admin") {
        Qsnackbars.errorSnackbar(message: 'Admin login not supported!');
      } else {
        Qsnackbars.errorSnackbar(message: 'Role not recognized');
      }
    } catch (e) {
      Qsnackbars.errorSnackbar(message: 'Something went wrong: $e');
    } finally {
      //Stop Loading
      QFullScreenLoadingAnimation.stop();
    }
  }
}
