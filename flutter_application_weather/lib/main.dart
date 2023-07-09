import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/pic_bg.jpeg'))),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 0.2, sigmaY: 0.5),
            child: Center(
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Text(
                    "Shushtar View",
                    style: TextStyle(color: Colors.white, fontSize: 35),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Text(
                    "Clear Sky",
                    style: TextStyle(color: Colors.grey, fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Icon(
                    Icons.wb_sunny_outlined,
                    color: Colors.white,
                    size: 80,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Text("41" + "\u00b0",
                      style: TextStyle(color: Colors.white, fontSize: 70)),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text(
                            "max",
                            style: TextStyle(color: Colors.grey, fontSize: 20),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Text(
                              "49" + "\u00b0",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Container(
                          width: 1,
                          height: 50,
                          color: Colors.white,
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            "min",
                            style: TextStyle(color: Colors.grey, fontSize: 20),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Text(
                              "36" + "\u00b0",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 10),
                  child: Container(
                    color: Color.fromARGB(255, 65, 65, 65),
                    height: 1,
                    width: double.infinity,
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 85,
                  child: Center(
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: 6,
                        itemBuilder: (BuildContext context, int pos) {
                          return Container(
                            height: 50,
                            width: 65,
                            child: Card(
                              color: Colors.transparent,
                              child: Column(
                                children: [
                                  Text(
                                    "Fri,8pm",
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 15),
                                  ),
                                  Icon(
                                    Icons.cloud,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    "39" + "\u00b0",
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 20),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Container(
                    color: Color.fromARGB(255, 67, 67, 67),
                    height: 1,
                    width: double.infinity,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text(
                            "Wind Speed",
                            style: TextStyle(color: Colors.grey, fontSize: 15),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text("47.73 m/s",
                                style: TextStyle(color: Colors.white)),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Container(
                          width: 1,
                          height: 30,
                          color: const Color.fromARGB(255, 118, 118, 118),
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            "Sun Rise",
                            style: TextStyle(color: Colors.grey, fontSize: 15),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text("8:19 PM",
                                style: TextStyle(color: Colors.white)),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Container(
                          width: 1,
                          height: 30,
                          color: const Color.fromARGB(255, 118, 118, 118),
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            "Sun Set",
                            style: TextStyle(color: Colors.grey, fontSize: 15),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text("5:29 AM",
                                style: TextStyle(color: Colors.white)),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Container(
                          width: 1,
                          height: 30,
                          color: const Color.fromARGB(255, 118, 118, 118),
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            "Humidity",
                            style: TextStyle(color: Colors.grey, fontSize: 15),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text("40%",
                                style: TextStyle(color: Colors.white)),
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ]),
            ),
          ),
        ));
  }
}
