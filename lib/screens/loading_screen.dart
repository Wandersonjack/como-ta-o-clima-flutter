import 'package:como_ta_o_tempo/screens/location_screen.dart';
import 'package:como_ta_o_tempo/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  void getLocation() async {
    Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    print(position);
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
                'Para comecar, precisa ativar  a sua localizacao para poder ver as previsoes de tempo',
                style: kSubtitleText,
              ),
              SizedBox(
                height: 20.0,
              ),
              RaisedButton(
                padding: EdgeInsets.only(
                    top: 16, bottom: 16.0, left: 32.0, right: 32.0),
                onPressed: () {
                  getLocation();
                },
                child: Text(
                  'Get my location',
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
