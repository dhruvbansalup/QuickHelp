import 'package:flutter/material.dart';
import 'package:quick_help/features/authentication/controllers/login_register.controller.dart';
import 'package:quick_help/utils/theme/theme.dart';
import 'package:quick_help/features/authentication/screens/splash_screen.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Quick Help',
      
      initialBinding: BindingsBuilder(() {
        Get.put(LoginRegisterController());
      }),

      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,

      // Define the theme for the app
      themeMode: ThemeMode.system,
      theme: QAppTheme.lightTheme, // Light theme
      darkTheme: QAppTheme.darkTheme, // Dark theme
    );
  }
}
