// ignore_for_file: prefer_initializing_formals

class CGPA {
  late String courseCode;
  int? courseUnit, courseScore;

  CGPA({required String courseCode, int? courseUnit, int? courseScore}) {
    this.courseCode = courseCode;
    this.courseUnit = courseUnit;
    this.courseScore = courseScore;
  }
}

List<CGPA> gpas = [];

// double? totalResult(List<CGPA> gpas) {
//   double sumUnit = 0.0;
//   double sumTotal = 0.0;
//   gpas.map((e) {
//     sumUnit += e.courseUnit!;
//     return sumUnit;
//   });
// }
