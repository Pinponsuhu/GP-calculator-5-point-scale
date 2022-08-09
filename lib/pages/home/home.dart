import 'package:flutter/material.dart';
import 'package:gpa_calculator_two/logics/cpa.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String grade(String value) {
    int parsedValue = int.parse(value);
    if (parsedValue == 5) {
      return "A";
    } else if (parsedValue == 4) {
      return "B";
    } else if (parsedValue == 3) {
      return "C";
    } else {
      return "D";
    }
  }

  // void reset() {
  //   print("shaba");

  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            backgroundColor: Colors.amber[500],
            elevation: 0.2,
            automaticallyImplyLeading: false,
            title: const Text(
              'Home',
              style:
                  TextStyle(fontFamily: "Ubuntu", fontWeight: FontWeight.bold),
            )),
        body: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 14.0, vertical: 12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextButton(
                  onPressed: () {
                    setState(() {
                      gpas.clear();
                    });
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red)),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 7, horizontal: 26),
                    child: Text(
                      "Reset",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontFamily: "Ubuntu"),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12.0,
                ),
                const SizedBox(
                  width: double.infinity,
                  child: Text(
                    'GPA Calculator',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: "Ubuntu",
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                const Divider(
                  height: 28.0,
                  color: Colors.grey,
                ),
                Column(
                  children: gpas
                      .asMap()
                      .entries
                      .map((e) => Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Expanded(
                                    flex: 2,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        color: Colors.green,
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12.0, vertical: 18.0),
                                      child: Text(e.value.courseCode.toString(),
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                              fontFamily: "Ubuntu",
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold)),
                                    )),
                                const SizedBox(
                                  width: 16,
                                ),
                                Expanded(
                                    flex: 1,
                                    child: Text(
                                      '${e.value.courseUnit} Unit',
                                      style: TextStyle(
                                        fontFamily: "Ubuntu",
                                        color: Colors.grey[500],
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )),
                                Expanded(
                                    flex: 1,
                                    child: Text(
                                      grade('${e.value.courseScore}'),
                                      style: TextStyle(
                                        fontFamily: "Ubuntu",
                                        color: Colors.grey[500],
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )),
                                Expanded(
                                  flex: 1,
                                  child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        gpas.removeAt(e.key.toInt());
                                      });
                                    },
                                    icon: const Icon(
                                      Icons.delete,
                                      size: 30.0,
                                    ),
                                    color: Colors.red[500],
                                  ),
                                )
                              ],
                            ),
                          ))
                      .toList(),
                ),
                const Divider(
                  height: 20.0,
                  color: Colors.grey,
                ),
                gpas.length >= 1
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/result');
                          },
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 24.0, vertical: 18.0),
                            child: Text(
                              'Calculate',
                              style: TextStyle(
                                fontFamily: "Ubuntu",
                                fontSize: 18.0,
                              ),
                            ),
                          ),
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.blue[400])),
                        ),
                      )
                    : SizedBox(
                        height: 0,
                      )
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, '/add');
            },
            elevation: 0.2,
            backgroundColor: Colors.amber[500],
            child: const Icon(Icons.add)));
  }
}
