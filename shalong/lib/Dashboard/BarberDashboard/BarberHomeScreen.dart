import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BarberHomeScreen extends StatefulWidget {
  const BarberHomeScreen({Key? key}) : super(key: key);

  @override
  _BarberHomeScreenState createState() => _BarberHomeScreenState();
}

class _BarberHomeScreenState extends State<BarberHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            width: 440,
            height: 85,
            child: Card(
              elevation: 12.0,
              child: ListTile(
                title: Text("First Shop"),
                subtitle: Text("Bagavathi amman kovil st,jakkampatty,near murugan theatre,andipatty,theni(D.T),625512"),
                trailing: Text(
                  "OPEN",
                  style: TextStyle(
                      color: CupertinoColors.systemRed,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Card(
            elevation: 12.0,
            child: ListTile(
              title: Text("Second Shop"),
              trailing: Text(
                "Close",
                style: TextStyle(
                    color: CupertinoColors.systemGrey,
                    fontWeight: FontWeight.bold),
              ),
              subtitle: Text("Address"),
            ),
          ),
          Card(
            elevation: 12.0,
            child: ListTile(
              title: Text("Third Shop"),
              subtitle: Text("Address"),
              trailing: Text(
                "OPEN",
                style: TextStyle(
                    color: CupertinoColors.systemRed,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Card(
            elevation: 12.0,
            child: ListTile(
              title: Text("Forth Shop"),
              trailing: Text(
                "Close",
                style: TextStyle(
                    color: CupertinoColors.systemGrey,
                    fontWeight: FontWeight.bold),
              ),
              subtitle: Text("Address"),
            ),
          )
        ],
      ),
    );
  }
}
