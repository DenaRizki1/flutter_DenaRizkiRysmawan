import 'package:flutter/material.dart';
import 'package:openai/screen/smartphone.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: SmartphoneScreen(),
    );
  }
}
