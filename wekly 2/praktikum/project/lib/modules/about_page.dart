import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/utils/app_images.dart';
import 'package:project/widgets/my_appbar.dart';
import 'package:project/widgets/my_drawer.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({super.key});

  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  List mountainList = [
    AppImages.mountain,
    AppImages.mountain1,
    AppImages.mountain2,
    AppImages.mountain3,
  ];

  Timer? _timer;

  @override
  void initState() {
    _timer = Timer.periodic(Duration(seconds: 20), (Timer t) => changeImage());
    super.initState();
  }

  void changeImage() {
    if (curIndex != mountainList.length - 1) {
      curIndex++;
    } else {
      curIndex = 0;
    }

    setState(() {});
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  int curIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: myDrawer(context: context),
      appBar: MyAppBar(titleApp: "About Us"),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        children: [
          Column(
            children: [
              SizedBox(
                height: 250,
                width: double.infinity,
                child: Image.asset(
                  mountainList[curIndex],
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                margin: EdgeInsets.only(left: 8, right: 8),
                height: 150,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: mountainList.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        curIndex = index;
                        setState(() {});
                      },
                      child: Card(
                        margin: EdgeInsets.symmetric(horizontal: 4),
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Image.asset(
                          mountainList[index],
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 10),
              Card(
                margin: EdgeInsets.zero,
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Mountain",
                          style: GoogleFonts.aBeeZee(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        const Text("Lorem Ipsum GeneratorGenerate Lorem Ipsum placeholder text. Select the number of characters, words, sentences or paragraphs, and hit generate!")
                      ],
                    ),
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
