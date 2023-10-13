import 'package:dio/dio.dart';
import 'package:tugas_praktikum/prioritas2/utils/api.dart';

class ApiConnect {
  static final ApiConnect instance = ApiConnect();

  Future<Response> getPicture({required String name}) async {
    try {
      final response = await Dio().get(baseUrl() + name);

      return response;
    } catch (e) {
      rethrow;
    }
  }
}
