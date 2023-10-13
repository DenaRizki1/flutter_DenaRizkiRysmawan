import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:tugas_praktikum/prioritas1/data/provider/register_provider.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final usernameEc = TextEditingController();
  final passwordEc = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My App"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          children: [
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: usernameEc,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "username tidak boleh kosong";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        label: const Text("Username"),
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: passwordEc,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "password tidak boleh kosong";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        label: const Text("Password"),
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ],
                )),
            Consumer<RegisterProvider>(
              builder: (context, provider, child) {
                return ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      provider.register(username: usernameEc.text, passwoord: passwordEc.text);
                    }
                  },
                  child: Text("Register"),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
