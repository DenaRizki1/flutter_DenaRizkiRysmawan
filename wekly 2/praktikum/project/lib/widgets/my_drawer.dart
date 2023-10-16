import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Drawer myDrawer({required context}) {
  return Drawer(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          ListTile(
            title: TextButton(
              style: const ButtonStyle(alignment: Alignment.centerLeft),
              child: Text(
                'Contact Us',
                style: GoogleFonts.actor(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/');
              },
            ),
          ),
          ListTile(
            title: TextButton(
                style: const ButtonStyle(alignment: Alignment.centerLeft),
                child: Text(
                  'About Us',
                  style: GoogleFonts.actor(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/aboutus');
                }),
          ),
          ListTile(
            title: TextButton(
              style: const ButtonStyle(alignment: Alignment.centerLeft),
              child: Text(
                'Login',
                style: GoogleFonts.actor(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/login');
              },
            ),
          )
        ],
      ),
    ),
  );
}
