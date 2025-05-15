import 'package:flutter/material.dart';
import 'package:quick_help/features/authentication/screens/splash_screen.dart';
import 'package:quick_help/features/service_provider.features/home/screens/MyServicePage.dart';
import 'package:quick_help/features/service_provider.features/home/screens/NewServiceSelectionPage.dart';

class ProfileServiceProviderPage extends StatelessWidget {
  const ProfileServiceProviderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Service Provider Profile'),
      ),
            drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: const Text("Mohan Kumar"),
              accountEmail: const Text("mohankumar3423@gmail.com"),
              currentAccountPicture: const CircleAvatar(
                backgroundImage: AssetImage('assets/images/electrician.png'), // Add your local image here
              ),
              decoration: BoxDecoration(color: Color(0xFF00B5AD)),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text("My services"),
              onTap: () {
                 Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MyServicePage()),
                          );
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text("Add new services"),
              onTap: () {
                 Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => NewServiceSelectionPage()),
                          );
              },
            ),
            ListTile(
              leading: const Icon(Icons.attach_money),
              title: const Text("Earning"),
              onTap: () {
                // Navigate to earnings page
              },
            ),
            ListTile(
              leading: const Icon(Icons.inventory),
              title: const Text("Orders"),
              onTap: () {
                // Navigate to orders page
              },
            ),
            ListTile(
              leading: const Icon(Icons.history),
              title: const Text("Requested Orders"),
              onTap: () {
                // Navigate to requested orders page
              },
            ),
            ListTile(
              leading: const Icon(Icons.list),
              title: const Text("Deliveries List"),
              onTap: () {
                // Navigate to deliveries list page
              },
            ),
            ListTile(
              leading: const Icon(Icons.reviews),
              title: const Text("Reviews"),
              onTap: () {
                // Navigate to reviews page
              },
            ),
            ListTile(
              leading: const Icon(Icons.help_outline),
              title: const Text("Help"),
              onTap: () {
                // Navigate to help page
              },
            ),
            ListTile(
              leading: const Icon(Icons.power_settings_new),
              title: const Text("LogOut"),
              onTap: () {
                 Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SplashScreen()),
                          );
              },
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text('Profile Service Provider Page'),
      ),
    );
  }
}