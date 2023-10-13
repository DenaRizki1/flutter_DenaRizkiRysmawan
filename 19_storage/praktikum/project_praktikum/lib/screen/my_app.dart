import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:project_praktikum/provider/contact_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _formKey = GlobalKey<FormState>();

  String username = '';

  List<Map<String, dynamic>> contact = [];

  @override
  void initState() {
    setUser();
    super.initState();
  }

  void setUser() async {
    final pref = await SharedPreferences.getInstance();

    username = pref.getString('username') ?? "";
    setState(() {});
  }

  int currendIndex = 0;

  @override
  Widget build(BuildContext context) {
    final contactProvider = Provider.of<Contact>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Selamat Datang , ${username}"),
      ),
      drawer: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100,
              width: double.infinity,
              color: Colors.red,
              child: const SafeArea(
                child: Center(
                  child: Text(
                    "My Navigation Drawer",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed('/gallery');
              },
              child: Container(
                padding: EdgeInsets.all(10),
                width: double.infinity,
                child: const Text(
                  "Gallery",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            // const Divider(thickness: 2),
            InkWell(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.all(10),
                width: double.infinity,
                child: const Text(
                  "Contact",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            const Spacer(),
            const Divider(),
            InkWell(
              onTap: () async {
                final pref = await SharedPreferences.getInstance();
                pref.clear();
                Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
              },
              child: Container(
                padding: EdgeInsets.all(10),
                width: double.infinity,
                child: Row(
                  children: const [
                    Icon(Icons.logout),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Logout",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Column(
              children: [
                const Icon(
                  Icons.contacts_outlined,
                ),
                const SizedBox(height: 10),
                const Text(
                  "Create New Contacts",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: const Text("A dialog is a type of modal window that appears in front of app content to provide critical information, or prompt for a decision to be made."),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 5),
                  width: MediaQuery.of(context).size.width * 0.82,
                  child: const Divider(
                    color: Colors.grey,
                    thickness: 1,
                    indent: 2,
                    endIndent: 2,
                  ),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Nama tidak boleh kosong";
                          } else if (value.length < 2) {
                            return "Nama harus lebih dari 2 characters";
                          } else if (RegExp(r'[!@#\$%^&*(),.?":{}|<>]').hasMatch(value)) {
                            return "Nama tidak diperbolehkan menggunakan karakter spesial";
                          }
                          return null;
                        },
                        controller: contactProvider.EcNama,
                        textCapitalization: TextCapitalization.words,
                        decoration: InputDecoration(
                          label: const Text("Nama"),
                          fillColor: const Color.fromARGB(255, 195, 190, 192),
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Nomor tidak boleh kosong";
                          } else if (value.length < 8 || value.length > 15) {
                            return "Nomor hanya bisa diisi minimal 8 angka dan maksimal 15 angka";
                          } else if (!value.startsWith("0")) {
                            return "Nomor harus di mulai dari angka 0";
                          }
                          return null;
                        },
                        controller: contactProvider.EcNomor,
                        keyboardType: TextInputType.number,
                        textCapitalization: TextCapitalization.words,
                        decoration: InputDecoration(
                          label: const Text("Nomor"),
                          fillColor: const Color.fromARGB(255, 195, 190, 192),
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2022),
                            lastDate: DateTime.now(),
                          ).then(
                            (value) {
                              if (value != null) {
                                contactProvider.selectDate(value);
                              }
                            },
                          );
                        },
                        child: Row(
                          children: [
                            const Icon(Icons.calendar_month),
                            const SizedBox(width: 10),
                            contactProvider.selectedDate == null
                                ? const Text("Pilih Tanggal")
                                : Consumer<Contact>(
                                    builder: (context, value, child) => Text(
                                      "${contactProvider.selectedDate!.day}-${contactProvider.selectedDate!.month}-${contactProvider.selectedDate!.year}",
                                    ),
                                  )
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: const Text("Pilih Warna"),
                                      content: BlockPicker(
                                        pickerColor: contactProvider.currenColor,
                                        onColorChanged: (value) {
                                          contactProvider.currenColor = value;
                                        },
                                      ),
                                      actions: [
                                        ElevatedButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                              setState(() {});
                                            },
                                            child: const Text("Oke"))
                                      ],
                                    );
                                  },
                                );
                              },
                              child: const Text("Ganti Warna"),
                            ),
                          ),
                          const SizedBox(width: 50),
                          Container(
                            height: 35,
                            width: 35,
                            color: contactProvider.currenColor,
                          )
                        ],
                      ),
                      const SizedBox(height: 12),
                      contactProvider.imageFile == null
                          ? InkWell(
                              onTap: () {
                                contactProvider.pickFile();
                              },
                              child: Container(
                                width: double.infinity,
                                height: 200,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(Icons.photo),
                                    SizedBox(height: 5),
                                    Text("Pilih Gambar"),
                                  ],
                                ),
                              ),
                            )
                          : Stack(
                              children: [
                                Container(
                                  height: 200,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Image.file(File(contactProvider.imageFile!.path.toString())),
                                ),
                                Align(
                                  alignment: Alignment.topRight,
                                  child: InkWell(
                                    onTap: () {
                                      contactProvider.imageFile = null;
                                      setState(() {});
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.only(top: 5, right: 10),
                                      height: 25,
                                      width: 25,
                                      decoration: BoxDecoration(
                                        color: Colors.red,
                                        border: Border.all(
                                          color: Colors.black,
                                        ),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: const Icon(
                                        Icons.close,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          contactProvider.edit
                              ? ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                                    backgroundColor: Colors.red,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                  ),
                                  onPressed: () {
                                    contactProvider.cancleEdit();
                                  },
                                  child: const Text("Cancle Edit"),
                                )
                              : Container(),
                          const SizedBox(width: 10),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                              backgroundColor: const Color(0xff6750a4),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                            onPressed: () {
                              Map<String, dynamic> contacts = {};
                              if (contact.isEmpty) {
                                contact.clear();
                              }
                              if (_formKey.currentState!.validate()) {
                                if (contactProvider.edit == false) {
                                  contactProvider.addContact();
                                } else {
                                  contactProvider.editContact(currendIndex);
                                }
                              }
                            },
                            child: const Text("Submit"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                contact.isEmpty
                    ? Container()
                    : const Text(
                        "List Contacts",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: contactProvider.contact.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.all(8),
                      margin: const EdgeInsets.only(top: 10),
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(
                              5.0,
                              5.0,
                            ),
                            blurRadius: 10.0,
                            spreadRadius: 2.0,
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: const Color(0xff6750a4).withAlpha(150),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Center(
                              child: Text(contactProvider.contact[index]['nama'][0].toString().toUpperCase()),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(contactProvider.contact[index]['nama'].toString()),
                                const SizedBox(height: 5),
                                Text(contactProvider.contact[index]['nomor'].toString().replaceFirst("0", "+62")),
                                const SizedBox(height: 5),
                                Text("Tanggal : ${contactProvider.contact[index]['tanggal']}"),
                                const SizedBox(height: 5),
                                Row(
                                  children: [
                                    const Text("Color : "),
                                    Container(
                                      height: 10,
                                      width: 10,
                                      color: contactProvider.contact[index]['color'],
                                    )
                                  ],
                                ),
                                const SizedBox(height: 5),
                                Text("File Name : ${contactProvider.contact[index]['file_name']}")
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              currendIndex = index;
                              contactProvider.selectEditContact(currendIndex);
                              setState(() {});
                            },
                            child: const Icon(
                              Icons.edit,
                            ),
                          ),
                          const SizedBox(width: 10),
                          InkWell(
                            onTap: () async {
                              final result = await showDialog(
                                context: context,
                                builder: (context) => Dialog(
                                  child: Container(
                                    height: 180,
                                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "Information",
                                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(height: 20),
                                        const Text("Apakah Anda Yakin Ingin Menghapus Data Contact?"),
                                        const SizedBox(height: 20),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            ElevatedButton(
                                              onPressed: () {
                                                Navigator.pop(context, false);
                                              },
                                              child: const Text("Tidak"),
                                            ),
                                            const SizedBox(width: 5),
                                            ElevatedButton(
                                              onPressed: () {
                                                Navigator.pop(context, true);
                                              },
                                              child: const Text("Ya"),
                                              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );

                              if (result) {
                                contactProvider.deleteContact(index);
                                setState(() {});
                              }
                            },
                            child: const Icon(
                              Icons.delete_outline,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
