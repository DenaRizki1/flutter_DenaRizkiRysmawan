import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tugas_praktikum/app_ios.dart';
import 'package:tugas_praktikum/my_app.dart';
import 'package:tugas_praktikum/soal_eksplorasi/soal_eksplorasi.dart';

void main() {
  runApp(
    // Android
    // MaterialApp(
    //   theme: ThemeData(
    //     brightness: Brightness.light,
    //   ),
    //   darkTheme: ThemeData(
    //     brightness: Brightness.dark,
    //   ),
    //   themeMode: ThemeMode.dark,
    //   debugShowCheckedModeBanner: false,
    //   home: MyApp(),
    // ),

    //IOS
    // const CupertinoApp(
    //   theme: CupertinoThemeData(brightness: Brightness.dark),
    //   home: AppIos(),
    // ),

    //Soal Eksplorasi
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SoalEksplorasi(),
    ),
  );
}
