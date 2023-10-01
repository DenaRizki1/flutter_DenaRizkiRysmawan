import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_praktikum/bloc/contacts_bloc.dart';
import 'package:project_praktikum/gallery.dart';
import 'package:project_praktikum/my_app.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<ContactsBloc>(
        create: (context) => ContactsBloc(),
      ),
    ],
    child: MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const MyApp(),
        '/gallery': (context) => const Gallery(),
      },
    ),
  ));
}
