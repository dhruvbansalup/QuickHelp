import 'package:flutter/material.dart';

class ExplainNewServicePage extends StatelessWidget {
  const ExplainNewServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explain New Service'),
      ),
      body: const Center(
        child: Text(
          'This is the Explain New Service Page',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}