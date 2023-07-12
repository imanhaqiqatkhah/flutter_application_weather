import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_application_weather/Model/CurrentCityDataModel.dart';

void main() {
  runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    SendRequestCurrentWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 20,
          actions: <Widget>[
            PopupMenuButton<String>(itemBuilder: (BuildContext context) {
              return {
                'Setting',
                'Sign up',
                'Login',
              }.map((String Choice) {
                return PopupMenuItem(value: Choice, child: Text(Choice));
              }).toList();
            })
          ],
          title: Text(
            "Weather App",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/pic_bg.jpeg'))),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 0.2, sigmaY: 2),
            child: Center(
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: ElevatedButton(
                            onPressed: () {}, child: Text("Find")),
                      ),
                      Expanded(
                          child: TextField(
                        controller: textEditingController,
                        decoration: InputDecoration(
                          hintText: "Enter Your City Name: ",
                          hintStyle: TextStyle(
                              color: const Color.fromARGB(255, 144, 144, 144)),
                          border: UnderlineInputBorder(),
                        ),
                      ))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Text(
                    "Shushtar View",
                    style: TextStyle(color: Colors.white, fontSize: 35),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Text(
                    "Clear Sky",
                    style: TextStyle(
                        color: const Color.fromARGB(255, 200, 200, 200),
                        fontSize: 20),
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
                              elevation: 0,
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
                                        color: const Color.fromARGB(
                                            255, 221, 220, 220),
                                        fontSize: 20),
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

  void SendRequestCurrentWeather() async {
    var apikey = '0eac226b502e5b5907f0b9aef90d22ff';
    var cityname = "tehran";
    var response = await Dio().get(
        "https://api.openweathermap.org/data/2.5/weather",
        queryParameters: {'q': cityname, 'appid': apikey, 'units': 'metric'});
    print(response.data);
    print(response.statusCode);
    var datamodel = CurrentCityDataModel(
        response.data["name"],
        response.data["coord"]["lon"],
        response.data["coord"]["lat"],
        response.data["weather"][0]["main"],
        response.data["weather"][0]["description"],
        response.data["main"]["temp"],
        response.data["main"]["temp_min"],
        response.data["main"]["temp_max"],
        response.data["main"]["pressure"],
        response.data["main"]["humidity"],
        response.data["wind"]["speed"],
        response.data["dt"],
        response.data["sys"]["country"],
        response.data["sys"]["sunrise"],
        response.data["sys"]["sunset"]);
  }
}
