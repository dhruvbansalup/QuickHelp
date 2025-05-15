import 'package:flutter/material.dart';

class MyServicePage extends StatelessWidget {
  const MyServicePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Service Page'),
      ),
      body: const Center(
        child: Text(
          'Welcome to My Service Page!',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}