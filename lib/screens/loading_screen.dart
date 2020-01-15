import 'package:como_ta_o_tempo/screens/location_screen.dart';
import 'package:como_ta_o_tempo/services/location.dart';
import 'package:como_ta_o_tempo/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    print(location.latitude);
    print(location.longitude);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Ola, Bem vindo!',
                style: kWelcomeText,
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'Aqui voce vai ver as previsoes de tempo e saber qual roupa usar',
                style: kSubtitleText,
              ),
              SizedBox(
                height: 20.0,
              ),
              RaisedButton(
                padding: EdgeInsets.only(
                    top: 16, bottom: 16.0, left: 32.0, right: 32.0),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LocationScreen(),
                      ));
                },
                child: Text(
                  'Get started',
                  style: kButtonText,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
