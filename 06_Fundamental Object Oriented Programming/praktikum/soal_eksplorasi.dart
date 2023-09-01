import 'dart:io';

class Buku {
  int Id = 0, harga = 0;
  String? judul, penerbit, kategory;
  List<Map<String, dynamic>> dataBuku = <Map<String, dynamic>>[];

  void tambahBuku() {
    stdout.write("Masukan Judul Buku : ");
    judul = stdin.readLineSync()!;
    stdout.write("Masukan Penerbit Buku : ");
    penerbit = stdin.readLineSync()!;
    stdout.write("Masukan Kategory Buku : ");
    kategory = stdin.readLineSync()!;
    stdout.write("Masukan Harga Buku : ");
    harga = int.parse(stdin.readLineSync()!);

    Map<String, dynamic> buku = {
      'id': Id,
      'judul': judul,
      'penerbit': penerbit,
      'kategory': kategory,
      'harga': harga,
    };

    dataBuku.add(buku);
  }

  void lihatSemuaBuku() {
    if (dataBuku.isNotEmpty) {
      for (var data in dataBuku) {
        print(data);
      }
    } else {
      print("Tidak Ada Buku");
    }
  }

  void hapusBuku(int item) {
    dataBuku.removeAt(item - 1);
  }
}

void main() {
  print("1. Menambah Buku");
  print("2. Menghapus Buku");
  print("3. Lihat Semua Buku");
  print("4. Keluar");
  Buku buku = new Buku();
  int pilihan;
  do {
    stdout.write("Masukan Pilihan : ");
    pilihan = int.parse(stdin.readLineSync()!);

    switch (pilihan) {
      case 1:
        buku.Id += 1;
        buku.tambahBuku();
        break;
      case 2:
        stdout.write("Masukan Id Buku Yang Ingin DIhapus : ");
        int id = int.parse(stdin.readLineSync()!);
        buku.hapusBuku(id);
        break;
      case 3:
        buku.lihatSemuaBuku();
        break;
    }
  } while (pilihan <= 4);
}
