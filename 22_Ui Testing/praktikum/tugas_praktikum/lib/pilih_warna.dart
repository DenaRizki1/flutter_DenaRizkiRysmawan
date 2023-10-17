import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:open_file/open_file.dart';
import 'package:tugas_praktikum/pilih_warna.dart';

class PilihWarna extends StatefulWidget {
  const PilihWarna({super.key});

  @override
  State<PilihWarna> createState() => PilihWarnaState();
}

class PilihWarnaState extends State<PilihWarna> {
  final _formKey = GlobalKey<FormState>();

  List<Map<String, dynamic>> listData = [];
  DateTime? selectedDate;
  Color _currenColor = Colors.red;
  String fileName = "";
  PlatformFile? imageFile;

  void _pickFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;

    final file = result.files.first;
    fileName = file.name;
    imageFile = file;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Interactive Users"),
      ),
      body: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Column(
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(height: 10),
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
                                selectedDate = value;

                                setState(() {});
                              }
                            },
                          );
                        },
                        child: Row(
                          children: [
                            Icon(Icons.calendar_month),
                            SizedBox(width: 10),
                            selectedDate == null
                                ? Text("Pilih Tanggal")
                                : Text(
                                    "${selectedDate!.day}-${selectedDate!.month}-${selectedDate!.year}",
                                  ),
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
                                        pickerColor: _currenColor,
                                        onColorChanged: (value) {
                                          _currenColor = value;
                                        },
                                      ),
                                      actions: [
                                        ElevatedButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                              setState(() {});
                                            },
                                            child: Text("Oke"))
                                      ],
                                    );
                                  },
                                );
                              },
                              child: Text("Ganti Warna"),
                            ),
                          ),
                          SizedBox(width: 50),
                          Container(
                            height: 35,
                            width: 35,
                            color: _currenColor,
                          )
                        ],
                      ),
                      const SizedBox(height: 12),
                      imageFile == null
                          ? InkWell(
                              onTap: () {
                                _pickFile();
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
                          : Container(
                              height: 200,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Image.file(File(imageFile!.path.toString())),
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
                            Map<String, dynamic> data = {};
                            data['tanggal'] = selectedDate;
                            data['color'] = _currenColor;
                            data['file_name'] = fileName;

                            listData.add(data);
                            log(data.toString());
                          },
                          child: const Text("Submit"),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          )
        ],
      ),
    );
  }
}
