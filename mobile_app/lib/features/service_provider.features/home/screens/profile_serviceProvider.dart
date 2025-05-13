import 'package:flutter/material.dart';

class ProfileServiceProviderPage extends StatelessWidget {
  const ProfileServiceProviderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Service Provider Profile'),
      ),
      body: const Center(
        child: Text('Profile Service Provider Page'),
      ),
    );
  }
}