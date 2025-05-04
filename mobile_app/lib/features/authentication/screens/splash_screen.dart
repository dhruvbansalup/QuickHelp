import 'package:flutter/material.dart';
import 'dart:async' show Timer;
import 'package:quick_help/features/authentication/screens/welcome_screen.dart' show WelcomeScreen;
import 'package:quick_help/utils/constants/appcolors.dart' show QAppColors;
import 'package:quick_help/utils/constants/image_strings.dart';


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
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const WelcomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: QAppColors.scaffoldBackground,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            Image.asset(
              QImages.logoBlue,
              width: 350,
              height: 350,
            ),
          ],
        ),
      ),
    );
  }
}
