import 'dart:io';

void main() async {
  print("SOAL 1");
  soal1();
  print("SOAL 2");
  soal2();
  print("SOAL 3");
  await soal3();
}

void soal1() {
  List<List<dynamic>> num = [
    ["number", 5],
    ["number", 6],
    ["number", 7],
  ];

  Map result = {};

  for (List<dynamic> number in num) {
    if (number.length >= 2) {
      String keys = number[0];
      int value = number[1];
      result[keys] = value;
    }
    print(result);
  }
}

void soal2() {
  List<int> num = [7, 5, 3, 5, 2, 1];
  double avg = 0;
  int total = 0;
  for (int number in num) {
    total += number;
  }

  avg = total / num.length;

  print(avg.toStringAsFixed(0));
}

Future<void> soal3() async {
  stdout.write("Maskan Nilai Yang Akan Dihitung : ");
  int num = int.parse(stdin.readLineSync()!);

  int result = await menghitung(num);

  print("Hasil Faktorial dari ${num} adalah : ${result}");
}

int menghitung(int num) {
  int result = 1;
  Future.delayed(
    Duration(seconds: 2),
    () {
      for (int i = num; i > 1; i--) {
        result *= i;
      }
    },
  );

  return result;
}
