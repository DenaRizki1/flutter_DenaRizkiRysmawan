import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

AppBar MyAppBar({required String titleApp, Color colorBg = Colors.purple, Color colorText = Colors.white}) {
  return AppBar(
    foregroundColor: Colors.black,
    elevation: 0,
    backgroundColor: colorBg,
    title: Text(
      titleApp,
      style: GoogleFonts.aBeeZee(color: colorText),
    ),
  );
}
