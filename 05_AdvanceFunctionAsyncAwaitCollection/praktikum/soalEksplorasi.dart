void main() {
  print("SOAL 1");
  soal1();
  print("SOAL 2");
  soal2();
}

void soal1() {
  List<String> kata = ["amuse", "tommy kaira", "spoon", "HKS", "litchfield", "amuse", "HKS"];
  print("List Awal : ${kata}");
  for (int i = 0; i < kata.length; i++) {
    for (int x = 0; x < kata.length; x++) {
      if (kata[x].contains(kata[i]) && x != i) {
        kata.removeAt(x);
      }
    }
  }

  print("List Setelah di hapus kata yang sama : ${kata}");
}

void soal2() {
  List<String> kata = ["js", "js", "js", "golang", "python", "js", "js", "golang", "rust"];

  Map<String, int> result = {};
  int total = 0;
  for (int i = 0; i < kata.length; i++) {
    total = 0;
    for (int x = 0; x < kata.length; x++) {
      if (kata[x].contains(kata[i])) {
        total += 1;
        result[kata[x]] = total;
      }
    }
  }
  print("List Yang Akan DIhitung jumlah kata yang sama : ${kata}");
  print("Jumlah Perhitungan Kata Yang Sama : ${result}");
}
