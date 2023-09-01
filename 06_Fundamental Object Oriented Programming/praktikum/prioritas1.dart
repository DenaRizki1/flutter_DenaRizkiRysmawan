import 'dart:io';

class Hewan {
  int? berat;
  String? namaHewan;
}

class Mobil {
  int kapasitas = 500, muatan = 4;

  void tambahMuatan() {
    Hewan hewan = new Hewan();
    int? jumlah;
    stdout.write("JUMLAH HEWAN YANG AKAN DI MASUKAN : ");
    jumlah = int.parse(stdin.readLineSync()!);
    Map<String, int> mapHewan = {};
    if (jumlah <= this.muatan) {
      for (int i = 1; i <= jumlah; i++) {
        stdout.write("Masukan Jenis Hewan Ke ${i} : ");
        hewan.namaHewan = stdin.readLineSync()!;
        stdout.write("Masukan Berat Hewan Ke ${i} : ");
        hewan.berat = int.parse(stdin.readLineSync()!);
        kapasitas -= hewan.berat!;
        if (kapasitas < 0) {
          print("MAAF BERAT HEWAN YANG INGIN DI MASUKAN SUDAH MELEBIHI KAPASITAS MOBIL");
        } else {
          mapHewan[hewan.namaHewan!] = hewan.berat!;
        }
      }
      print(mapHewan);
    } else {
      print("MAAF JUMLAH HEWAN MELEBIHI KAPASITAS MOBIL");
    }
  }
}

void main() {
  Mobil mobil = new Mobil();

  mobil.tambahMuatan();
}
