import 'dart:async';
import 'dart:io';

void main() {
  print("=============================");
  print("MEMBUAT SEGITIGA\n");
  segitiga();
  print("==============================");
  print("MEMBUAT JAM PASIR\n");
  jamPasir();
}

void segitiga() {
  int k = 0;

  for (int i = 1; i <= 5; i++, k = 0) {
    for (int j = 1; j <= 5 - i; j++) {
      stdout.write("  ");
    }

    while (k != 2 * i - 1) {
      stdout.write("* ");
      ++k;
    }

    print("");
  }
}

void jamPasir() {
  int k = 0;

  for (int i = 5; i >= 1; i--) {
    for (int j = 1; j <= (5 * 2) - 1; j++) {
      if ((5 - j).abs() < i) {
        stdout.write('*');
      } else {
        stdout.write(' ');
      }
    }
    print("");
  }

  for (int i = 2; i <= 5; i++) {
    for (int j = 1; j <= (5 * 2) - 1; j++) {
      if ((5 - j).abs() < i) {
        stdout.write('*');
      } else {
        stdout.write(' ');
      }
    }
    print('');
  }
}
