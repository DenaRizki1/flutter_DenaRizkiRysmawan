import 'package:flutter/animation.dart';

class GetContact {
  String name = '';
  String nomor = '';
  DateTime? tanggal;
  String fileName = '';
  Color? color;

  GetContact({
    required this.name,
    required this.nomor,
    required this.tanggal,
    required this.fileName,
    required this.color,
  });
}
