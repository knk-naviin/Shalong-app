import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shalong/UserAuthentication/AuthManager.dart';

class DashboardScreen extends StatefulWidget {
  Profile profile;
   // DashboardScreen({Key? key}) : super(key: key);
  DashboardScreen(this.profile, {Key? key}) : super(key: key);
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Shalong"), actions: [IconButton(onPressed: (){
        FirebaseAuth.instance.signOut();
        Navigator.of(context).pushReplacementNamed("/launch");
      }, icon: Icon(Icons.logout))],),
        body: Container(
      child: Center(
        child: Column(
          children: [
            Text("Welcome " + widget.profile.firstName + " " + widget.profile.lastName),
            Text(widget.profile.email),
            Text(widget.profile.phone),
          ],
        ),
      ),
    ));
  }
}
