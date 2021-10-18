import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BarberNotificationScreen extends StatefulWidget {
  const BarberNotificationScreen({Key? key}) : super(key: key);

  @override
  _BarberNotificationScreenState createState() => _BarberNotificationScreenState();
}

class _BarberNotificationScreenState extends State<BarberNotificationScreen> {
  @override
  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Notification"),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.lightBlueAccent, Colors.blue])),
          ),
          backgroundColor: Colors.blue,
          elevation: 0,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                    child: Text(
                      "Notification",
                      style: TextStyle(fontSize: 32),
                    )),
                Icon(
                  Icons.notifications_active,
                  size: 32,
                  color: CupertinoColors.systemYellow,
                )
              ],
            ),
            Text(
              "Coming Soon",
              style: TextStyle(color: CupertinoColors.systemGrey),
            )
          ],
        ));
  }
}
