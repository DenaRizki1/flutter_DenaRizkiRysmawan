import 'dart:io';

void main() {
  persegiPanjang();
}

void persegi() {
  print("MASUKAN SISI PERSEGI : ");
  int s = int.parse(stdin.readLineSync() ?? "0");

  print("\nRUMUS KELILING PERSEGI : S + S + S + S");
  int k = s + s + s + s;
  print("Hasil Perhitungan Menggunakan Rumus Keliling Persegi Adalah : ${k}\n");

  print("RUMUS DARI LUAS PERSEGI ADALAH : L = S x S");
  int l = s * s;
  print("Hasil Perhitungan Menggunakan Rumus Luas Persegi Adalah : ${l}\n");
}

void persegiPanjang() {
  print("MASUKAN PANJANG PERSEGI PANJANG : ");
  int pa = int.parse(stdin.readLineSync() ?? "0");
  print("MASUKAN LEBAR PERSEGI PANJANG : ");
  int le = int.parse(stdin.readLineSync() ?? "0");

  print("Rumus Dari Luas Persegi Panjang Adalah : L = Panjang x Lebar");
  int L = pa * le;
  print("Hasil Perhitungan Menggunakan Rumus Luas Persegi Panjang Adalah : ${L}\n");
  print("Rumus Dari Keliling Persegi Panjang Adalah : K = 2 x (P+L)");
  int K = 2 * (pa + le);
  print("Hasil Perhitungan Menggunakan Rumus Keliling Persegi Panjang Adalah : ${K}\n");
}
