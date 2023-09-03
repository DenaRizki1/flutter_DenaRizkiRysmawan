import 'dart:io';

class Matematika {
  hasil() {
    Kpk kpk = new Kpk();
    Fpb fpb = new Fpb();

    return ["KPK: ${kpk.hasil()}", "FPB : ${fpb.hasil()}"];
  }
}

class Kpk extends Matematika {
  int x = 0, y = 0;

  @override
  hasil() {
    print("Masukan Nilai Yang Ingin dicari KPK");
    stdout.write("Masukan Nilai 1 : ");
    x = int.parse(stdin.readLineSync()!);
    stdout.write("Masukan Nilai 2 : ");
    y = int.parse(stdin.readLineSync()!);
    int max = x > y ? x : y; // Mencari angka terbesar antara a dan b
    int kpk = max;

    while (true) {
      if (kpk % x == 0 && kpk % y == 0) {
        return kpk; // KPK ditemukan
      }
      kpk += max; // Meningkatkan kpk dengan kelipatan dari angka terbesar
    }
  }
}

class Fpb extends Matematika {
  int x = 0, y = 0;

  @override
  hasil() {
    print("Masukan Nilai Yang Ingin dicari FPB");
    stdout.write("Masukan Nilai 1 : ");
    x = int.parse(stdin.readLineSync()!);
    stdout.write("Masukan Nilai 2 : ");
    y = int.parse(stdin.readLineSync()!);
    while (y != 0) {
      int temp = y;
      y = x % y;
      x = temp;
    }
    return x;
  }
}

void main() {
  Matematika matematika = new Matematika();

  print(matematika.hasil());
}
