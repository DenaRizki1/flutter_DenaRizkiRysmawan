void main() {
  List<int> num = [9, 2, 1];
  int pengali = 2;
  List<int> result = [];

  for (var number in num) {
    result.add(number * pengali);
  }
  print("List Sebelum dilakukan Perkalian : ${num}");
  print("Hasil Dari Perkalian pada List Sebelumnya : ${result}");
}
