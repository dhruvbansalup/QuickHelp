import 'package:flutter/material.dart';
import 'dart:async';
import 'package:quick_help/utils/constants/appcolors.dart';
import 'package:quick_help/utils/constants/image_strings.dart';
import 'package:quick_help/features/authentication/screens/account_type_screen.dart';

import '../../../utils/helpers/helper_functions.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    super.initState();

    const delay = Duration(seconds: 3);
    Timer(delay, () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => AccountTypeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = QHelperFunctions.isDarkMode(context);
    return Scaffold(

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [Image.asset(isDark?QImages.logoWhite: QImages.logoBlue, width: 350, height: 350)],
        ),
      ),
    );
  }
}
