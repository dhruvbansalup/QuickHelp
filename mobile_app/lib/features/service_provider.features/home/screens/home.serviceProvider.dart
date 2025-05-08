import 'package:flutter/material.dart';

class ServiceProviderHome extends StatelessWidget {
  const ServiceProviderHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Service Provider Home'),
      ),
      body: Text(
        'Welcome to the Setvice Provider Home Screen!',
        style: Theme.of(context).textTheme.headlineLarge,
      ),
    );
  }
}
