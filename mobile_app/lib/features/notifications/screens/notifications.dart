import 'package:flutter/material.dart';

class ServiceProviderNotiPage extends StatelessWidget {
  const ServiceProviderNotiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Service Provider Notifications'),
      ),
      body: const Center(
        child: Text('This is the Service Provider Notifications page.'),
      ),
    );
  }
}