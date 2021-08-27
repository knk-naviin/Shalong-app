import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shalong/UserAuthentication/AuthManager.dart';
import 'package:shalong/UserAuthentication/LogIn.dart';
import 'Dashboard/Dashboard.dart';

void main() {
  runApp(new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ShalongApp(),
      routes: <String, WidgetBuilder>{
        '/launch': (BuildContext context) => LaunchScreen()
      }));
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
      body: FutureBuilder(
          future: Firebase.initializeApp(),
          builder: (BuildContext context, AsyncSnapshot<FirebaseApp> snapshot) {
            if (snapshot.hasData || snapshot.hasError) {
              return AnimatedSplashScreen(
                  nextScreen: LaunchScreen(), splash: Text("Shalong App"));
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    child: CircularProgressIndicator(
                      color: Colors.red,
                      backgroundColor: Colors.green,
                    ),
                    width: 60,
                    height: 60,
                  ),
                ],
              );
            }
          }),
      // body: LogIn(),
    );
  }
}

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  _LaunchScreenState createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  Widget build(BuildContext context) {
    var uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) {
      return LogIn();
    } else {
      return FutureBuilder(
        future: profile(),
        builder: (BuildContext context, AsyncSnapshot<Profile?> snapshot) {
          if (snapshot.hasData) {
            var profile = snapshot.data;
            if (profile == null) {
              return LogIn();
            } else {
              return DashboardScreen(profile);
            }
          } else if (snapshot.hasError) {
            return LogIn();
          } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  child: CircularProgressIndicator(),
                  width: 30,
                  height: 30,
                ),
              ],
            );
          }
        },
      );
    }
  }
}
