import 'package:flutter/material.dart';
import 'package:gpa_calculator_two/logics/cpa.dart';

class AddCourse extends StatefulWidget {
  @override
  State<AddCourse> createState() => _AddCourseState();
}

class _AddCourseState extends State<AddCourse> {
  static const grades = <String>['A', 'B', 'C', 'D'];
  static const units = <String>[
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10'
  ];
  String? selectGrade;
  String? courseCode;
  int? selectUnit;
  int? courseScore;
  bool isEmpty = true;
  bool hasError = false;
  String errMsg = "All Field must be selected";

  final List<DropdownMenuItem<String>> _dropDownMenuItems = grades
      .map((String grade) =>
          DropdownMenuItem<String>(value: grade, child: Text(grade)))
      .toList();
  final List<DropdownMenuItem<String>> _dropDownMenuItems2 = units
      .map((String unit) =>
          DropdownMenuItem<String>(value: unit, child: Text(unit)))
      .toList();

  void addNew({String? selectGrade, int? selectUnit}) {
    print('$selectGrade, $selectUnit, $courseCode');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.2,
        backgroundColor: Colors.amber[500],
        title: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.0, vertical: 0.0),
            child: Text(
              'Add new Course',
              style: TextStyle(fontFamily: "Ubuntu"),
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 14.0),
        child: Form(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              "Add a Course",
              style: TextStyle(
                  fontFamily: "Ubuntu",
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            const Divider(
              height: 40.0,
              color: Colors.grey,
            ),
            hasError
                ? Text(
                    errMsg,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Ubuntu",
                      color: Colors.red[500],
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  )
                : Text(
                    '',
                    style: TextStyle(fontSize: 0.0),
                  ),
            SizedBox(
              height: 14.0,
            ),
            TextFormField(
              onChanged: (newVal) {
                setState(() {
                  courseCode = newVal;
                });
              },
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 3, color: Colors.amber),
                    borderRadius: BorderRadius.circular(3),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 3, color: Colors.amber),
                    borderRadius: BorderRadius.circular(3),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(3),
                      borderSide: BorderSide(color: Colors.amber, width: 3.0)),
                  errorText: true ? null : "Enter a course Code",
                  labelText: 'Enter course code',
                  labelStyle: TextStyle(color: Colors.black, fontSize: 17.0)),
            ),
            const SizedBox(
              height: 16.0,
            ),
            Row(
              children: <Widget>[
                Expanded(
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(color: Colors.amber[500]),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DropdownButton(
                            hint: Text(
                              textAlign: TextAlign.center,
                              selectUnit == null
                                  ? "Select Unit"
                                  : selectUnit.toString(),
                              style: TextStyle(
                                fontFamily: "Ubuntu",
                                color: Colors.white,
                              ),
                            ),
                            items: _dropDownMenuItems2,
                            onChanged: (String? newVal) {
                              if (newVal != null) {
                                setState(() {
                                  selectUnit = int.parse(newVal);
                                });
                              }
                            }),
                      ),
                    )),
                const SizedBox(
                  width: 20.0,
                ),
                Expanded(
                    flex: 1,
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(color: Colors.amber[500]),
                      child: DropdownButton(
                          hint: Text(
                            selectGrade == null
                                ? "Select Grade"
                                : selectGrade.toString(),
                            style: TextStyle(
                              fontFamily: "Ubuntu",
                              color: Colors.white,
                            ),
                          ),
                          items: _dropDownMenuItems,
                          onChanged: (String? newVal) {
                            selectGrade = newVal;
                            if (newVal != null) {
                              setState(() {
                                if (newVal == 'A') {
                                  courseScore = 5;
                                } else if (newVal == 'B') {
                                  courseScore = 4;
                                } else if (newVal == 'C') {
                                  courseScore = 3;
                                } else {
                                  courseScore = 2;
                                }
                              });
                            }
                          }),
                    )),
              ],
            ),
            const SizedBox(
              height: 24.0,
            ),
            TextButton(
                onPressed: () {
                  if (courseCode == null ||
                      selectUnit == null ||
                      courseScore == null) {
                    setState(() {
                      hasError = true;
                    });
                  } else {
                    gpas.add(CGPA(
                        courseCode: '$courseCode',
                        courseUnit: selectUnit,
                        courseScore: courseScore));
                    Navigator.pushNamed(context, '/');
                  }
                },
                style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    backgroundColor: MaterialStateProperty.all(Colors.green)),
                child: const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 54.0, vertical: 12.0),
                    child: Text(
                      'Add',
                      style: TextStyle(
                        fontFamily: "Ubuntu",
                        fontSize: 18.0,
                      ),
                    )))
          ],
        )),
      ),
    );
  }
}
