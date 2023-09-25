import 'package:flutter/material.dart';
import 'package:project_praktikum/gallery.dart';
import 'package:project_praktikum/my_app.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const MyApp(),
        '/gallery': (context) => const Gallery(),
      },
    ),
  );
}
