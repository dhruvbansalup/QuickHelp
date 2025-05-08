import 'package:flutter/material.dart';

class ConsumerHome extends StatelessWidget {
  const ConsumerHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Consumer Home'),
      ),
      body: Text(
        'Welcome to the Consumer Home Screen!',
        style: Theme.of(context).textTheme.headlineLarge,
      ),
    );
  }
}
