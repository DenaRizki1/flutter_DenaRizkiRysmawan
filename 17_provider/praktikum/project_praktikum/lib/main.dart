import 'package:flutter/material.dart';
import 'package:project_praktikum/gallery.dart';
import 'package:project_praktikum/my_app.dart';
import 'package:project_praktikum/provider/contact_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Contact(),
        ),
      ],
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => const MyApp(),
          '/gallery': (context) => const Gallery(),
        },
      ),
    ),
  );
}
