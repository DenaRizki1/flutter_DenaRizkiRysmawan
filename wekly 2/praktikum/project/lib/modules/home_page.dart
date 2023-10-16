import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart' as intl;
import 'package:project/provider/provider.dart';
import 'package:project/utils/app_images.dart';
import 'package:project/utils/helper.dart';
import 'package:project/widgets/my_appbar.dart';
import 'package:project/widgets/my_drawer.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController problem = TextEditingController();

  late MainProvider jamProvider;
  Timer? _timer;
  Timer? _bgtimer;

  List bgimage = [
    AppImages.bg_night,
    AppImages.bg_afternoon,
  ];

  bool afternoon = false;

  String _bgimage = AppImages.bg_night;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    jamProvider = context.read<MainProvider>();

    _timer = Timer.periodic(const Duration(seconds: 1), (Timer t) => jamProvider.getTimeJam());
    _bgtimer = Timer.periodic(const Duration(minutes: 1), (Timer t) => getTimebg());
    getTimebg();
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _bgtimer?.cancel();
    super.dispose();
  }

  void getTimebg() {
    DateTime now = DateTime.now();
    DateTime night = DateTime.parse("${parseDateInd(DateTime.now().toString(), "yyyy-MM-dd")} 18:00:00");
    DateTime timeafternoon = DateTime.parse("${parseDateInd(DateTime.now().toString(), "yyyy-MM-dd")} 05:00:00");

    final diff = now.difference(night).inMinutes;
    final diff1 = now.difference(timeafternoon).inMinutes;
    if (diff1 > 0 && diff < 0) {
      _bgimage = bgimage[1];
      afternoon = true;
      // log("Siang");
    } else if (diff > 0) {
      afternoon = false;
      _bgimage = bgimage[0];
      // log("malam");
    } else {
      afternoon = false;
      _bgimage = bgimage[0];
      // log("malam jam 1 ");
    }
    log("message");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      endDrawer: myDrawer(context: context),
      appBar: AppBar(
        foregroundColor: Colors.black,
        elevation: 0,
        backgroundColor: !afternoon ? Color.fromARGB(255, 6, 30, 56) : Colors.white,
        actions: [
          IconButton(
            onPressed: () {
              scaffoldKey.currentState?.openEndDrawer();
            },
            icon: Icon(
              Icons.menu,
              color: !afternoon ? Colors.white : Colors.black,
            ),
          ),
        ],
        title: Text(
          "My Apps",
          style: GoogleFonts.aBeeZee(
            color: !afternoon ? Colors.white : Colors.black,
          ),
        ),
      ),
      body: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Image(
              image: AssetImage(_bgimage),
              fit: BoxFit.cover,
            ),
          ),
          ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50, left: 12, right: 12),
                child: SizedBox(
                  height: 550,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        afternoon == false ? "Good Night" : "Welcome In My Apps",
                        style: GoogleFonts.aBeeZee(
                          color: afternoon == false ? Colors.white : Colors.black,
                          fontSize: 25,
                        ),
                      ),
                      SizedBox(height: 10),
                      Consumer<MainProvider>(
                        builder: (context, value, child) {
                          return Text(
                            value.timeString,
                            style: GoogleFonts.aBeeZee(
                              color: afternoon == false ? Colors.white : Colors.black,
                              fontSize: 20,
                            ),
                          );
                        },
                      )
                    ],
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.zero,
                elevation: 5,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Contact Us",
                        style: GoogleFonts.montserrat(fontSize: 30),
                      ),
                      const SizedBox(height: 12),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'This field is required';
                                      }
                                      return null;
                                    },
                                    controller: firstname,
                                    keyboardType: TextInputType.name,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(3)),
                                      label: const Text('First Name'),
                                      filled: true,
                                      fillColor: const Color(0xFFE7E0EC),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'This field is required';
                                      }
                                      return null;
                                    },
                                    controller: lastname,
                                    keyboardType: TextInputType.name,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(3)),
                                      label: const Text('Last Name'),
                                      filled: true,
                                      fillColor: const Color(0xFFE7E0EC),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              validator: (value) {
                                // Check if this field is empty
                                if (value == null || value.isEmpty) {
                                  return 'This field is required';
                                }

                                // using regular expression
                                if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                                  return "Please enter a valid email address";
                                }

                                // the email is valid
                                return null;
                              },
                              controller: email,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(3)),
                                label: const Text('Your Email Address'),
                                filled: true,
                                fillColor: const Color(0xFFE7E0EC),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'This field is required';
                                }
                                return null;
                              },
                              maxLines: 7,
                              controller: problem,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(3)),
                                label: const Text('What can We help you?'),
                                filled: true,
                                fillColor: const Color(0xFFE7E0EC),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: ElevatedButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      final fname = firstname.text;
                                      final lname = lastname.text;
                                      final emaill = email.text;
                                      final prob = problem.text;
                                      showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                          title: const Text(
                                            'Submit Form',
                                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                          ),
                                          content: SingleChildScrollView(
                                            child: ListBody(
                                              children: [
                                                const Text(
                                                  'Nama Lengkap',
                                                  style: TextStyle(fontWeight: FontWeight.bold),
                                                ),
                                                Text('$fname $lname'),
                                                const Text(
                                                  'Alamat Email Anda',
                                                  style: TextStyle(fontWeight: FontWeight.bold),
                                                ),
                                                Text(emaill),
                                                const Text(
                                                  'Keluhan anda',
                                                  style: TextStyle(fontWeight: FontWeight.bold),
                                                ),
                                                Text(prob),
                                              ],
                                            ),
                                          ),
                                          actions: [
                                            TextButton(
                                              child: const Text('Submit'),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                          ],
                                        ),
                                      );
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: const StadiumBorder(),
                                  ),
                                  child: const Text('Submit')),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
    ;
  }
}
