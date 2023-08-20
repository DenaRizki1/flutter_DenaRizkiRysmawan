import 'dart:io';

void main() {
  String namaDepan = "Dena";
  String namaTengah = "Rizki";
  String namaBelakang = "Rysmawan";

  print(namaDepan + " " + namaTengah + " " + namaBelakang);

  soal2();
}

void soal2() {
  print("Masukan Jari Jari Tabung : ");
  int r = int.parse(stdin.readLineSync()!);
  print("Masukan Tinggi Tabung : ");
  int t = int.parse(stdin.readLineSync()!);

  print("Rumus Volume Tabung : v = 22/7 x r x r x t");
  double v = 22 / 7 * r * r * t;
  print("Hasil Perhitungan Volume Tabung adalah : ${v}");
}
