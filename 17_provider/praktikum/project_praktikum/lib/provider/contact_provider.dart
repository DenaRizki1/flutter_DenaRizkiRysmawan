import 'package:flutter/cupertino.dart';

class Contact with ChangeNotifier {
  List<Map<String, dynamic>> _contact = [];
  List<Map<String, dynamic>> get contact => _contact;

  void addContact(Map<String, dynamic> contact) {
    _contact.add(contact);
    notifyListeners();
  }

  void editContact(Map<String, dynamic> contacts, int index) {
    contact[index] = contacts;
    notifyListeners();
  }

  void deleteContact(int index) {
    contact.removeAt(index);
    notifyListeners();
  }
}
