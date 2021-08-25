import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shalong/UserAuthentication/LogIn.dart';

void main(){
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
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
    Firebase.initializeApp();
    return Scaffold(
      body: AnimatedSplashScreen(
        nextScreen: LogIn(),
        splash: Text("Shalong App")
      ),
    );
  }
}
