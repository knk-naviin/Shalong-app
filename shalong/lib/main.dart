import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:shalong/UserAuthentication/LogIn.dart';

void main(){
  runApp(new MaterialApp(
    home: ShalongApp(),
  ));
}

class ShalongApp extends StatefulWidget {
  const ShalongApp({Key? key}) : super(key: key);

  @override
  _ShalongAppState createState() => _ShalongAppState();
}

class _ShalongAppState extends State<ShalongApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
        nextScreen: LogIn(),
        splash: Image.asset("images/Logo.jpeg",
          height: MediaQuery.of(context).size.width / 2.5,
          width: MediaQuery.of(context).size.width / 2.5,
        )
      ),
    );
  }
}
