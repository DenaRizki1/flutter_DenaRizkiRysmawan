import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:tugas_praktikum/prioritas1/data/api/api.dart';
import 'package:tugas_praktikum/prioritas1/data/model/model.dart';

class ApiConnect {
  static final ApiConnect instance = ApiConnect();

  Future<User> postData(String url, Map<String, String> params) async {
    log(params.toString());
    url = getBaseUrl() + url;
    log(url);
    final response = await Dio().post(url, data: params);
    return User.fromJson(response.data);
  }

  Future<dynamic> getData(String url) async {
    log(url);
    final response = await Dio().get(url);

    return response;
  }
}
