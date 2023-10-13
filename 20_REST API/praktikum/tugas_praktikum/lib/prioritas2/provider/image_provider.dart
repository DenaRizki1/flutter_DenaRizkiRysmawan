import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:tugas_praktikum/prioritas2/service/api_connect.dart';
import 'package:tugas_praktikum/prioritas2/utils/api.dart';

class ImageProviders with ChangeNotifier {
  String image = '';

  Future picture(String name) async {
    try {
      image = '';
      notifyListeners();

      image = baseUrl() + name;
      notifyListeners();
      log(image);

      final response = await ApiConnect.instance.getPicture(name: name);

      log(response.toString());

      notifyListeners();
    } catch (e) {
      if (e is DioException) {
        e.response!.statusMessage;
      }

      notifyListeners();
    }
  }
}
