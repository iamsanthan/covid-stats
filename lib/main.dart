import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import './bottomnavbar.dart';

void main(){
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: new MyApp(),
  ));
}


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 1,
      navigateAfterSeconds: BottomNavBar(),
      title: Text('Covid Tracker',
      style: new TextStyle(
        fontFamily: 'Pacifico',
        fontSize: 25.0,
        color: Colors.purple,
      ),),
      image: new Image.asset('assets/images/covid.png'),
      backgroundColor: Colors.black,
      photoSize: 100.0,
      loaderColor: Colors.black
    );
  }
}
