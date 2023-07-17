import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_application_weather/Model/CurrentCityDataModel.dart';
import 'package:flutter_application_weather/Model/ForecastDaysModel.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<CurrentCityDataModel> currentweatherFuture;
  late StreamController<List<ForecastDaysModel>> StreamForecastdays;

  var cityname = "tehran";
  var lon;
  var lat;

  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();

    currentweatherFuture = SendRequestCurrentWeather(cityname);
    StreamForecastdays = StreamController<List<ForecastDaysModel>>();
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
        body: FutureBuilder<CurrentCityDataModel>(
          future: currentweatherFuture,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              CurrentCityDataModel? cityDataModel = snapshot.data;

              final formatter = DateFormat.jm();
              var sunrise = formatter.format(
                  new DateTime.fromMillisecondsSinceEpoch(
                      cityDataModel!.sunrise * 1000,
                      isUtc: true));
              var sunset = formatter.format(
                  new DateTime.fromMillisecondsSinceEpoch(
                      cityDataModel.sunset * 1000,
                      isUtc: true));

              return Container(
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
                                    color: const Color.fromARGB(
                                        255, 144, 144, 144)),
                                border: UnderlineInputBorder(),
                              ),
                            ))
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Text(
                          cityDataModel!.cityname,
                          style: TextStyle(color: Colors.white, fontSize: 35),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Text(
                          cityDataModel.description,
                          style: TextStyle(
                              color: const Color.fromARGB(255, 200, 200, 200),
                              fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: setIconForMain(cityDataModel),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Text(cityDataModel.temp.toString() + "\u00b0",
                            style:
                                TextStyle(color: Colors.white, fontSize: 70)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "min",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 20),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 15),
                                  child: Text(
                                    cityDataModel.temp_min.toString() +
                                        "\u00b0",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: Container(
                                width: 1,
                                height: 50,
                                color: Colors.white,
                              ),
                            ),
                            Column(
                              children: [
                                Text(
                                  "max",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 20),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 15),
                                  child: Text(
                                    cityDataModel.temp_max.toString() +
                                        "\u00b0",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
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
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 15),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Text(
                                      cityDataModel.windSpeed.toString() +
                                          "m/s",
                                      style: TextStyle(color: Colors.white)),
                                )
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
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
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 15),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Text(sunrise.toString(),
                                      style: TextStyle(color: Colors.white)),
                                )
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
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
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 15),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Text(sunset.toString(),
                                      style: TextStyle(color: Colors.white)),
                                )
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
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
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 15),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Text(
                                      cityDataModel.humidity.toString() + "%",
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
              );
            } else {
              return Center(
                child: JumpingDotsProgressIndicator(
                  color: Colors.black,
                  fontSize: 60,
                  dotSpacing: 2,
                ),
              );
            }
          },
        ));
  }

  Image setIconForMain(model) {
    String description = model.description;

    if (description == "clear sky") {
      return Image(image: AssetImage("assets/images/icons8-sun-96.png"));
    } else if (description == "few clouds") {
      return Image(
          image: AssetImage("assets/images/icons8-partly-cloudy-day-80.png"));
    } else if (description.contains("clouds")) {
      return Image(image: AssetImage("assets/images/icons8-clouds-80.png"));
    } else if (description.contains("thunderstorm")) {
      return Image(image: AssetImage("assets/images/icons-storm-80.png"));
    } else if (description.contains("drizzle")) {
      return Image(image: AssetImage("assets/images/icons8-rain-cloud-80.png"));
    } else if (description.contains("rain")) {
      return Image(image: AssetImage("assets/images/icons9-heavy-rain-80.png"));
    } else if (description.contains("snow")) {
      return Image(image: AssetImage("assets/images/icons9-snow-80.png"));
    } else {
      return Image(
          image: AssetImage("assets/images/icons8-windy-weather-80.png"));
    }
  }

  Future<CurrentCityDataModel> SendRequestCurrentWeather(
      String cityname) async {
    var apiKey = '0eac226b502e5b5907f0b9aef90d22ff';

    var response = await Dio().get(
        "https://api.openweathermap.org/data/2.5/weather",
        queryParameters: {'q': cityname, 'appid': apiKey, 'units': 'metric'});

    lat = response.data["coord"]["lat"];
    lon = response.data["coord"]["lon"];

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
    return datamodel;
  }

  void SendRequest7DaysForecast(lat, lon) async {
    List<ForecastDaysModel> list = [];
    var apiKey = '9cc31ad12a1f875e6ed3db44f5e45dd3';

    var response = await Dio().get(
        "https://api.openweathermap.org/data/3.0/onecall",
        queryParameters: {
          'lat': lat,
          'lon': lon,
          'exclude': 'minutely,hourly',
          'appid': apiKey,
          'units': 'metric'
        });

    final formatter = DateFormat.MMMd();
    for (int i = 0; i < 8; i++) {
      var model = response.data['daily'][i];
      var dt = formatter.format(new DateTime.fromMillisecondsSinceEpoch(
          model['dt'] * 1000,
          isUtc: true));

      ForecastDaysModel forecastDaysModel = ForecastDaysModel(
        dt,
        model['temp']['day'],
        model['weather'][0]['main'],
        model['weather'][0]['description'],
      );
      list.add(forecastDaysModel);
    }

    StreamForecastdays.add(list);
  }
}
