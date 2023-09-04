import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Map<String, String>> people = [
    {'name': "Leanne Graham", "code": "1-770-736 x56442"},
    {'name': "Ervin Howel", "code": "010-692-6593 x09125"},
    {'name': "Clementine Bauch", "code": "1-463-123-4447"},
    {'name': "Patricia Dietrich", "code": "493-170-9623 x156"},
    {'name': "Chelsey Dietrich", "code": "(254)954-1289"},
    {'name': "Mrs. Dennis Schulist", "code": "1-477-935-8478 x6430"},
    {'name': "Kurtis Weissnat", "code": "210.067.6132"},
    {'name': "Leanne Graham", "code": "1-770-736 x56442"},
    {'name': "Ervin Howel", "code": "010-692-6593 x09125"},
    {'name': "Clementine Bauch", "code": "1-463-123-4447"},
    {'name': "Patricia Dietrich", "code": "493-170-9623 x156"},
    {'name': "Chelsey Dietrich", "code": "(254)954-1289"},
    {'name': "Mrs. Dennis Schulist", "code": "1-477-935-8478 x6430"},
    {'name': "Kurtis Weissnat", "code": "210.067.6132"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Setting",
          ),
        ],
      ),
      drawer: Drawer(
        child: SafeArea(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              ListTile(
                title: Text('Home'),
                onTap: () {},
              ),
              ListTile(
                title: Text('Setting'),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.black.withOpacity(0.7),
        title: Text("MaterialApp"),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Center(
            child: ListView.builder(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          itemCount: people.length,
          itemBuilder: (context, index) {
            return Container(
                padding: EdgeInsets.symmetric(horizontal: 7, vertical: 10),
                margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                width: double.infinity,
                decoration: BoxDecoration(color: Colors.white),
                child: Row(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Center(
                          child: Text(
                        people[index]["name"]![0].toString().toUpperCase(),
                        style: TextStyle(fontSize: 20),
                      )),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          people[index]["name"].toString(),
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                        Text(
                          people[index]["code"].toString(),
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ],
                ));
          },
        )),
      ),
    );
  }
}
