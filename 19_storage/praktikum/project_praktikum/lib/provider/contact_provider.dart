import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Contact with ChangeNotifier {
  List<Map<String, dynamic>> _contact = [];
  List<Map<String, dynamic>> get contact => _contact;
  TextEditingController EcNama = TextEditingController();
  TextEditingController EcNomor = TextEditingController();
  bool edit = false;
  DateTime? selectedDate;
  Color currenColor = Colors.red;
  String fileName = "";

  PlatformFile? imageFile;

  void addContact() {
    Map<String, dynamic> contacts = {};
    contacts['nama'] = EcNama.text;
    contacts['nomor'] = EcNomor.text;
    contacts['tanggal'] = selectedDate;
    contacts['color'] = currenColor;
    contacts['file_name'] = fileName;
    contacts['image_file'] = imageFile;

    EcNama.clear();
    EcNomor.clear();
    selectedDate = null;
    fileName = "";
    imageFile = null;
    contact.add(contacts);
    notifyListeners();
  }

  void editContact(int index) {
    Map<String, dynamic> contacts = {};
    contact[index];
    contacts['nama'] = EcNama.text;
    contacts['nomor'] = EcNomor.text;
    contacts['tanggal'] = selectedDate;
    contacts['color'] = currenColor;
    contacts['file_name'] = fileName;
    contacts['image_file'] = imageFile;

    EcNama.clear();
    EcNomor.clear();
    selectedDate = null;
    fileName = "";
    imageFile = null;
    edit = false;
    contact[index] = contacts;
    notifyListeners();
  }

  void deleteContact(int index) {
    contact.removeAt(index);
    notifyListeners();
  }

  void cancleEdit() {
    EcNama.clear();
    EcNomor.clear();
    selectedDate = null;
    fileName = "";
    imageFile = null;

    edit = false;
    notifyListeners();
  }

  void pickFile() async {
    final result = await FilePicker.platform.pickFiles();

    if (result == null) return;

    final file = result.files.first;
    fileName = file.name;
    imageFile = file;
    notifyListeners();
  }

  void selectEditContact(int index) {
    EcNama.text = contact[index]['nama'];
    EcNomor.text = contact[index]['nomor'];
    selectedDate = contact[index]['tanggal'];
    currenColor = contact[index]['color'];
    imageFile = contact[index]['image_file'];
    edit = true;
    notifyListeners();
  }

  void selectDate(DateTime value) {
    selectedDate = value;
    notifyListeners();
  }
}
