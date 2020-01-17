import 'package:como_ta_o_tempo/screens/city_screen.dart';
import 'package:como_ta_o_tempo/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:como_ta_o_tempo/services/weather.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.locationWeather});

  final locationWeather;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weatherModel = new WeatherModel();
  int temperature;
  String weatherIcon;//icon var
  String cityName;
  String weatherMessage;

  @override
  void initState() {
    super.initState();
    //receiving o object via widget
    updaterUI(widget.locationWeather);
  }

  void updaterUI(dynamic weatherData) {
    setState(() {
      if(weatherData == null){
        temperature = 0;
        weatherIcon= 'error';
        weatherMessage = ' Unable to get the weather forcast';
        cityName = '';
        return;
      }
      double temp = weatherData['main']['temp'];
      temperature = temp.toInt();
      var condition = weatherData['weather'][0]['id']; //
      weatherIcon = weatherModel.getWeatherIcon(condition);
      cityName = weatherData['name'];
      weatherMessage = weatherModel.getMessage(temperature);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/city.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () async {
                      var weatherData = await weatherModel.getLocationWeather();
                      updaterUI(weatherData);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () async {
                      var typedCity = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CityScreen(
                          ),
                        ),
                      );
                      if(typedCity != null) {
                        var weatherData = await weatherModel.getCityWeather(typedCity);
                        updaterUI(weatherData);
                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temperature°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      '$weatherIcon',
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "$weatherMessage in $cityName!",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
