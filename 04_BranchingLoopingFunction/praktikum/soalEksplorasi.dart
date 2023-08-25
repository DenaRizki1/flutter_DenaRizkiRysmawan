import 'dart:io';

void main() {
  // print("===============================");
  // print("SOAL MENGECEK BILANGAN PRIMA\n");
  // cekBilanganPrima();
  print("===============================");
  print("SOAL MENCETAK TABLE PERKALIAN\n");
  tablePerkalian();
}

void cekBilanganPrima() {
  int nilai;

  stdout.write("MASUKAN NILAI YANG AKAN DI CEK : ");
  nilai = int.parse(stdin.readLineSync()!);
  bool prime = true;

  for (int i = 3; i <= nilai - 1; i++) {
    if (nilai % i == 0) {
      prime = false;
      break;
    }
  }
  prime == true ? print("Bilangan Prima") : print("Bukan Bilangan Prima");
}

void tablePerkalian() {
  for (int i = 1; i <= 10; i++) {
    stdout.write("${i}\t");
    for (int x = 1; x <= 10; x++) {
      if (x == 1) {
        continue;
      } else {
        stdout.write("${x * i}\t");
      }
    }
    print("\n");
  }
}
