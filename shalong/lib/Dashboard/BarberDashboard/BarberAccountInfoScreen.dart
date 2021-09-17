import 'package:flutter/material.dart';

class BarberAccountInfoScreen extends StatefulWidget {
  const BarberAccountInfoScreen({Key? key}) : super(key: key);

  @override
  _BarberAccountInfoScreenState createState() => _BarberAccountInfoScreenState();
}

class _BarberAccountInfoScreenState extends State<BarberAccountInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Account Information"),
      ),
    );
  }
}
