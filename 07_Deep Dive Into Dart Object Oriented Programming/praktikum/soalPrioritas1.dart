import 'dart:io';

class BangunRuang {
  int? panjang, lebar, tinggi;

  volume() {
    Kubus kubus = new Kubus();
    Balok balok = new Balok();

    balok.volume();
    return kubus.volume();
  }
}

class Kubus extends BangunRuang {
  int? sisi;

  @override
  volume() {
    stdout.write("Masukan Sisi Kubus : ");
    sisi = int.parse(stdin.readLineSync()!);

    int volumeKubus = sisi! * sisi! * sisi!;
    print("Hasil Dari Perhitungan Rumus Volume Kubus Adalah : ");
    return volumeKubus;
  }
}

class Balok extends BangunRuang {
  @override
  volume() {
    stdout.write("Masukan Panjang Balok : ");
    panjang = int.parse(stdin.readLineSync()!);
    stdout.write("Masukan Lebar Balok : ");
    lebar = int.parse(stdin.readLineSync()!);
    stdout.write("Masukan Tinggi Balok : ");
    tinggi = int.parse(stdin.readLineSync()!);

    int volumeBalok = panjang! * lebar! * tinggi!;
    print("Hasil Dari Perhitungan Volume Balok Adalah : ");
    print(volumeBalok);
  }
}

void main() {
  BangunRuang bangun = new BangunRuang();

  print(bangun.volume());
}
