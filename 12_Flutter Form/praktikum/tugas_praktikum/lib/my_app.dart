import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController _EcNama = TextEditingController();
  TextEditingController _EcNomor = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  List<Map<String, dynamic>> listContact = [];
  bool edit = false;
  int currendIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Contact"),
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
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp("[a-z A-Z]")),
                        ],
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Nama tidak boleh kosong";
                          } else if (value.length < 2) {
                            return "Nama harus lebih dari 2 characters";
                          }

                          return null;
                        },
                        controller: _EcNama,
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
                        controller: _EcNomor,
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
                      const SizedBox(height: 12),
                      Align(
                        alignment: Alignment.centerRight,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                            backgroundColor: const Color(0xff6750a4),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                          onPressed: () {
                            Map<String, dynamic> contacts = {};
                            if (listContact.isEmpty) {
                              listContact.clear();
                            }
                            if (_formKey.currentState!.validate()) {
                              if (!edit) {
                                contacts['nama'] = _EcNama.text;
                                contacts['nomor'] = _EcNomor.text;
                                listContact.add(contacts);
                                log(listContact.toString());

                                _EcNama.clear();
                                _EcNomor.clear();
                              } else {
                                contacts = listContact[currendIndex];
                                contacts['nama'] = _EcNama.text;
                                contacts['nomor'] = _EcNomor.text;

                                listContact[currendIndex] = contacts;
                                _EcNama.clear();
                                _EcNomor.clear();
                              }
                              setState(() {});
                            }
                          },
                          child: const Text("Submit"),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                listContact.isEmpty
                    ? Container()
                    : const Text(
                        "List Contacts",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: listContact.length,
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
                              child: Text(listContact[index]['nama'][0].toString().toUpperCase()),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(listContact[index]['nama'].toString()),
                                Text(listContact[index]['nomor'].toString().replaceFirst("0", "+62")),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              _EcNama.text = listContact[index]['nama'];
                              _EcNomor.text = listContact[index]['nomor'];
                              currendIndex = index;
                              edit = true;
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
                                        SizedBox(height: 20),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            ElevatedButton(
                                              onPressed: () {
                                                Navigator.pop(context, false);
                                              },
                                              child: const Text("Tidak"),
                                            ),
                                            SizedBox(width: 5),
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
                                listContact.removeAt(index);
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
