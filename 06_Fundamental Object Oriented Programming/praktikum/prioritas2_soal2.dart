import 'dart:io';

class Course {
  String? judul, deskripsi;
  Map<String, String> mapCourse = {};

  void tambahCourse() {
    mapCourse[judul!] = deskripsi!;
  }
}

class Student {
  String? nama, kelas;
  Course course = new Course();

  void lihatCourse() {
    print("Nama : ${nama}");
    print("Kelas : ${kelas}");
    print("Course Yang Dimiliki : ${course.mapCourse}");
  }

  void tambahCourse() {
    stdout.write("Masukan Judul Course : ");
    course.judul = stdin.readLineSync()!;
    stdout.write("Masukan Deskripsi Course : ");
    course.deskripsi = stdin.readLineSync()!;

    course.tambahCourse();
  }

  void hapusCourse() {
    stdout.write("Masukan Judul Yang ingin DIhapus : ");
    course.judul = stdin.readLineSync()!;
    course.mapCourse.remove(course.judul);
  }
}

void main() {
  Student student = new Student();
  stdout.write("Masukan Nama : ");
  student.nama = stdin.readLineSync()!;
  stdout.write("Masukan Kelas : ");
  student.kelas = stdin.readLineSync()!;

  int pilihan;

  do {
    print("1. Lihat Course Yang Dimiliki");
    print("2. Menambah Course");
    print("3. Menghapus Course");
    print("4. Keluar");
    stdout.write("Masukan Pilihan : ");
    pilihan = int.parse(stdin.readLineSync()!);
    switch (pilihan) {
      case 1:
        student.lihatCourse();
        break;
      case 2:
        student.tambahCourse();
        break;
      case 3:
        student.hapusCourse();
        break;
      default:
        break;
    }
  } while (pilihan <= 3);
}
