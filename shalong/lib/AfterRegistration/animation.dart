import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:shalong/Dashboard/BarberDashboard/BarberSettingScreen.dart';

class AnimationScreen extends StatefulWidget {
  const AnimationScreen({Key? key}) : super(key: key);

  @override
  _AnimationScreenState createState() => _AnimationScreenState();
}

class _AnimationScreenState extends State<AnimationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
        nextScreen: BarberSettingScreen(),
        splash: Column(
          children: [
            Text("You Have Verified"),
          ],
        ),
      ),
    );
  }
}
