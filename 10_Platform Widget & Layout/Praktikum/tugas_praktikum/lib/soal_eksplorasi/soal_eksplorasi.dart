import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tugas_praktikum/soal_eksplorasi/app_color.dart';

class SoalEksplorasi extends StatefulWidget {
  const SoalEksplorasi({super.key});

  @override
  State<SoalEksplorasi> createState() => _SoalEksplorasiState();
}

class _SoalEksplorasiState extends State<SoalEksplorasi> {
  final List<Map<String, String>> listItem = [
    {'course': "Learn Flutter"},
    {'course': "Learn ReactJs"},
    {'course': "Learn VueJs"},
    {'course': "Learn Tailwind CSS"},
    {'course': "Learn UI/UX"},
    {'course': "Learn Figma"},
    {'course': "Learn Digital Marketing"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.primaryColor,
        title: const Text("My Flutter App"),
        actions: const [
          Icon(Icons.search),
          SizedBox(width: 15),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColor.primaryColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(0.7),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
            ),
            label: "Favorite",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.priority_high_outlined),
            label: "Informasi",
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColor.secondaryColor,
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: ListView.builder(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          itemCount: listItem.length,
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.all(10),
              child: Text(
                listItem[index]['course'].toString(),
                style: TextStyle(fontSize: 20),
              ),
            );
          },
        ),
      ),
    );
  }
}
