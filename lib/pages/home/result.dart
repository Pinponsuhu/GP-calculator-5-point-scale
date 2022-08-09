import 'package:flutter/material.dart';
import 'package:gpa_calculator_two/logics/cpa.dart';

class Result extends StatefulWidget {
  Result({Key? key}) : super(key: key);

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  double sum = 0.0;
  double gp = 0.0;
  double totalUnit = 0.0;
  String message = '';
  void initState() {
    super.initState();
    for (var gpa in gpas) {
      sum += gpa.courseScore! * gpa.courseUnit!;
    }
    for (var gpa in gpas) {
      totalUnit += gpa.courseUnit!;
    }
    gp = sum / totalUnit;
    if (gp >= 4.5) {
      message = "First Class Division";
    } else if (gp < 4.5 && gp >= 3.5) {
      message = "Second Class Upper Division";
    } else if (gp >= 2.5 && gp < 3.5) {
      message = "Second Class Lower Division";
    } else {
      message = "Third Class Division";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.amber[500],
        elevation: 0.2,
        title: const Text("Result"),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 24,
          ),
          Center(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 25),
              padding: const EdgeInsets.all(25),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.amber[500],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      'Result Calculated',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 26,
                    ),
                    Text(
                      '${gp.toStringAsFixed(2)}',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      '$message',
                      style: const TextStyle(fontSize: 18.0, color: Colors.white),
                    ),
                    const SizedBox(
                      height: 26,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            gpas.clear();
                            Navigator.pushNamed(context, '/');
                          },
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.white)),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 7.0, horizontal: 28.0),
                            child: Text(
                              "Back and Reset",
                              style: TextStyle(
                                color: Colors.amber,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
