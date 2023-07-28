import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: Draft()));
}

class Draft extends StatelessWidget {
  const Draft({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Column()),
    );
  }
}
