import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'HomeScreen.dart';

void main() {
  runApp(new MaterialApp(
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
    return new SplashScreen(
      seconds: 4,
      navigateAfterSeconds: HomeScreen(),
      title: new Text(
        'Enhance your movie watching experience',
        style: new TextStyle(
            fontWeight: FontWeight.w400, fontSize: 18.0, color: Colors.white),
      ),
      image: new Image(
        fit: BoxFit.cover,
        image: new AssetImage('assets/inflix_animation.gif'),
        alignment: Alignment.center,
        filterQuality: FilterQuality.high,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
      ),
      backgroundColor: Color(0xff192b44),
      styleTextUnderTheLoader: new TextStyle(),
      photoSize: 100.0,
      loaderColor: Color(0xffea2340),
    );
  }
}
