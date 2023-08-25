import 'dart:io';

void main() {
  print("==========================================");
  print("SOAL PERCABANGAN");
  percabangan();
  print("==========================================");
  print("SOAL PERULANGAN");
  perulangan();
}

void percabangan() {
  stdout.write("MASUKAN NILAI : ");
  String input = stdin.readLineSync() ?? "";
  int? nilai;
  if (input == "") {
    print("");
  } else {
    nilai = int.parse(input);
    if (nilai > 70) {
      print("\n NILAI A");
    } else if (nilai <= 70 && nilai > 40) {
      print("\n NILAI B ");
    } else {
      print("NILAI C");
    }
  }
}

void perulangan() {
  for (int i = 1; i <= 10; i++) {
    print(i);
  }
}
