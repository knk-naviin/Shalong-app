
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BarberNotificationScreen extends StatefulWidget {
  const BarberNotificationScreen({Key? key}) : super(key: key);

  @override
  _BarberNotificationScreenState createState() => _BarberNotificationScreenState();
}

class _BarberNotificationScreenState extends State<BarberNotificationScreen> {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(

          title: Text("Notification"),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.grey, Colors.black26])),
          ),
          backgroundColor: Colors.white10,
          elevation: 0,
          centerTitle: true,
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
