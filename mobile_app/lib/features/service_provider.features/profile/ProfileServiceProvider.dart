import 'package:flutter/material.dart';

class ProfileServiceProvider extends StatelessWidget {
  const ProfileServiceProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Service Provider Profile'),
        
      ),
      body: const Center(
        child: Text(
          'Profile Service Provider Page',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}