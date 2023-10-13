import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tugas_praktikum/prioritas1/data/utils/api_connect.dart';
import 'package:tugas_praktikum/prioritas1/data/utils/end_point.dart';

class RegisterProvider with ChangeNotifier {
  Future register({required String username, required String passwoord}) async {
    log(username);
    log(passwoord);

    final response = await ApiConnect.instance.postData(
      EndPoint.register,
      {
        'id': "2",
        "username": username,
        "password": passwoord,
      },
    );

    log(response.username);
  }

  Future getData() async {
    final response = await ApiConnect.instance.getData(EndPoint.register);

    log(response.toString());
  }
}
