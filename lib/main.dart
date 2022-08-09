import 'package:flutter/material.dart';
import 'package:gpa_calculator_two/pages/home/add_course.dart';
import 'package:gpa_calculator_two/pages/home/home.dart';
import 'package:gpa_calculator_two/pages/home/result.dart';

void main() => runApp(MaterialApp(
      home: Home(),
      routes: {
        '/add' : (context) => AddCourse(),
        '/result' : (context) => Result(),
      },
    ));
