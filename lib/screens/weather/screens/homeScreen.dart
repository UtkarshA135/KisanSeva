import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:kisanseva/screens/weather/model/forecastModel.dart';
import 'package:kisanseva/screens/weather/model/weatherModel.dart';
import 'package:kisanseva/screens/weather/widgets/weather.dart';
import 'package:kisanseva/screens/weather/widgets/weatherItem.dart';
import 'package:http/http.dart' as http;

class WHomescreen extends StatefulWidget {
  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<WHomescreen> {
  bool isLoading = false;
  WeatherData weatherData;
  ForecastData forecastData;

  loadWeather() async {
    setState(() {
      isLoading = true;
    });
    Position position;
    try {
      position =
          await getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    } catch (e) {
      print(e);
    }

    if (position != null) {
      final lat = position.latitude;
      final lon = position.longitude;

      final weatherResponse = await http.get(
          'https://api.openweathermap.org/data/2.5/weather?APPID=0721392c0ba0af8c410aa9394defa29e&lat=${lat.toString()}&lon=${lon.toString()}');
      final forecastResponse = await http.get(
          'https://api.openweathermap.org/data/2.5/forecast?APPID=0721392c0ba0af8c410aa9394defa29e&lat=${lat.toString()}&lon=${lon.toString()}');

      if (weatherResponse.statusCode == 200 &&
          forecastResponse.statusCode == 200) {
        return setState(() {
          weatherData =
              new WeatherData.fromJson(jsonDecode(weatherResponse.body));
          forecastData =
              new ForecastData.fromJson(jsonDecode(forecastResponse.body));
          isLoading = false;
        });
      }
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    loadWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Current Location Weather'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: weatherData != null
                        ? Weather(weather: weatherData)
                        : Container(),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: isLoading
                  //       ? CircularProgressIndicator(
                  //           strokeWidth: 2.0,
                  //           valueColor:
                  //               new AlwaysStoppedAnimation(Colors.white),
                  //         )
                  //       : IconButton(
                  //           icon: new Icon(Icons.refresh),
                  //           tooltip: 'Refresh',
                  //           onPressed: loadWeather,
                  //           color: Colors.white,
                  //         ),
                  // ),
                ],
              ),
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 200.0,
                  child: forecastData != null
                      ? ListView.builder(
                          itemCount: forecastData.list.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => WeatherItem(
                              weather: forecastData.list.elementAt(index)))
                      : Container(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
