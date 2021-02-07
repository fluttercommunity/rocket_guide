import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rocket Guide'),
      ),
      body: const Center(
        child: Text('Hello, World!'),
      ),
    );
  }
}
