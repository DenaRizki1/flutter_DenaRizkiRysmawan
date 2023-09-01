import 'dart:io';

class Calculator {
  void penjumlahan(int a, int b) {
    int hasil = a + b;
    print("HASIL DARI PENJUMLAHAN ANTARA ${a} dan ${b} ADALAH : ${hasil}");
  }

  void pengurangan(int a, int b) {
    int hasil = a - b;
    print("HASIL DARI PENGURANGAN ANTARA ${a} dan ${b} ADALAH : ${hasil}");
  }

  void perkalian(int a, int b) {
    int hasil = a * b;
    print("HASIL DARI PERKALIAN ANTARA ${a} dan ${b} ADALAH : ${hasil}");
  }

  void pembagian(int a, int b) {
    double hasil = a / b;
    print("HASIL DARI PEMBAGIAN ANTARA ${a} dan ${b} ADALAH : ${hasil}");
  }
}

void main() {
  int nilai1, nilai2;
  stdout.write("MASUKAN NILAI 1 : ");
  nilai1 = int.parse(stdin.readLineSync()!);
  stdout.write("MASUKAN NILAI 2 : ");
  nilai2 = int.parse(stdin.readLineSync()!);

  Calculator calc = new Calculator();

  calc.penjumlahan(nilai1, nilai2);
  calc.pengurangan(nilai1, nilai2);
  calc.pembagian(nilai1, nilai2);
  calc.perkalian(nilai1, nilai2);
}
