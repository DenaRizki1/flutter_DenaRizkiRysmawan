import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameEC = TextEditingController();
  TextEditingController passwordEC = TextEditingController();
  bool hidden = true;

  @override
  void dispose() {
    usernameEC.dispose();
    passwordEC.dispose();
    super.dispose();
  }

  @override
  void initState() {
    cekLogin();
    super.initState();
  }

  void cekLogin() async {
    final pref = await SharedPreferences.getInstance();
    final newUser = pref.getBool('Login') ?? true;

    if (newUser == false) {
      Navigator.pushNamedAndRemoveUntil(context, '/contact', (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                controller: usernameEC,
                decoration: InputDecoration(
                  label: const Text("Username"),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: passwordEC,
                obscureText: hidden,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      hidden == true ? hidden = false : hidden = true;
                      setState(() {});
                    },
                    icon: Icon(
                      hidden == true ? Icons.lock : Icons.lock_open_outlined,
                    ),
                  ),
                  label: const Text("Password"),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    backgroundColor: const Color(0xff6750a4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  onPressed: () async {
                    final pref = await SharedPreferences.getInstance();

                    pref.setBool('Login', false);
                    pref.setString('username', usernameEC.text);
                    cekLogin();
                  },
                  child: const Text("Login"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
