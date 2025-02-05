import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.purple,
            child: Stack(
              children: [
                Center(
                  child: Container(
                    height: 650,
                    width: 390,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.white,
                    ),
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment(-0.95, -0.93),
                          child: Container(
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
                                color: Colors.amber),
                            child: Image.asset("assets/icon.png"),
                          ),
                        ),
                        Align(
                          alignment: Alignment(0, -0.93),
                          child: Text(
                            "KATHMANDU",
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontFamily: 'title',
                              fontSize: 30,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment(0, -0.83),
                          child: Text(
                            "UNIVERSITY",
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontFamily: 'title',
                              fontSize: 30,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment(0, -0.72),
                          child: Text(
                            "Dhulikhel,Kavre,Nepal",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment(0, -0.65),
                          child: Text(
                            "STUDENT",
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 40,
                              color: Colors.red,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment(0, 0),
                          child: SizedBox(
                            height: 250,
                            width: 200,
                            child: Image.asset("assets/pp.png"),
                          ),
                        ),
                        Align(
                          alignment: Alignment(0, 0.4),
                          child: Text(
                            "Aakash Thakur",
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 25,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment(0, 0.466),
                          child: Text(
                            "BSc. Computer Science",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 25,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment(0, 0.54),
                          child: Text(
                            "School of Science",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 25,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment(0, 0.6),
                          child: Text(
                            "Aakash Thakur",
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 25,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment(0, 0.66),
                          child: Text(
                            "Aakash Thakur",
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 25,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        //enter
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
