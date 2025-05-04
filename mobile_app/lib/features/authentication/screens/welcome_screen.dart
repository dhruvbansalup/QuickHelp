import 'package:flutter/material.dart';
import 'package:quick_help/utils/constants/appcolors.dart' show QAppColors;
import 'package:quick_help/features/authentication/screens/login_screen.dart' show LoginScreen;

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF5E9), // light beige background
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),

              // App Logo
              Center(
                child: Image.asset(
                  'logos/logo.png',
                  width: 180,
                  height: 180,
                ),
              ),

              const SizedBox(height: 16),

              // App Name and Tagline
              const Text(
                'QUICK HELP',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0033A0), // Dark blue
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'LOCAL HELP, INSTANTLY!',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.indigo,
                  letterSpacing: 1.2,
                ),
              ),

              const SizedBox(height: 40),

              // Choose Your Account Type
              const Text(
                'Choose Your Account Type',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF235953),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Choose one option from the given choices',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF235953),
                ),
              ),
              const SizedBox(height: 30),

              // Consumer Card
              buildAccountOptionCard(
                context,
                image: 'icons/consumer.png',
                title: 'Consumer',
                subtitle: 'Click here to continue as a consumer',
                onTap: () {
                  // Navigate to consumer screen
                    Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                      return const LoginScreen();
                      },
                    ),
                    );
                },
              ),
              const SizedBox(height: 16),

              // Service Provider Card
              buildAccountOptionCard(
                context,
                image: 'icons/worker.png',
                title: 'Service Provider',
                subtitle: 'Click here to continue as a service provider',
                onTap: () {
                  // Navigate to provider screen
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return const LoginScreen();
                      },
                    ),
                  );
                },
              ),

              const SizedBox(height: 24),

              // Divider
              Row(
                children: const [
                  Expanded(child: Divider(color: Color(0xFF235953))),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'or',
                      style: TextStyle(color: Color(0xFF235953)),
                    ),
                  ),
                  Expanded(child: Divider(color: Color(0xFF235953))),
                ],
              ),
              const SizedBox(height: 24),

              // Guest button
              GestureDetector(
                onTap: () {
                  // Continue as guest
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xFFB2EBF2), width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.person_outline, color: Color(0xFF235953)),
                      SizedBox(width: 8),
                      Text(
                        'Continue as a guest',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF235953),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildAccountOptionCard(
    BuildContext context, {
    required String image,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: QAppColors.scaffoldBackground,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFFB2EBF2), width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
             Image.asset(
                image,
                width: 50,
                height: 50,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF235953),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color(0xFF235953),
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward_ios, color: Color(0xFF235953)),
            ],
          ),
        ),
      ),
    );
  }
}