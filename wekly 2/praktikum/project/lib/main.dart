import 'package:flutter/material.dart';
import 'package:project/modules/about_page.dart';
import 'package:project/modules/home_page.dart';
import 'package:project/modules/login_page.dart';
import 'package:project/provider/provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MainProvider(),
        )
      ],
      child: MaterialApp(
        title: 'My Apps',
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        routes: {
          '/': (context) => HomePage(),
          '/login': (context) => LoginPage(),
          '/aboutus': (context) => AboutUsPage(),
        },
      ),
    );
  }
}
