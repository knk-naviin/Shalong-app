import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shalong/UserAuthentication/AuthManager.dart';

class BarberDashboardScreen extends StatefulWidget {



  @override
  _BarberDashboardScreenState createState() => _BarberDashboardScreenState();
}

class _BarberDashboardScreenState extends State<BarberDashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app_rounded),
            onPressed: () {
              showDialog(
                context: context,
                builder: (ctx) => Platform.isIOS
                    ? CupertinoAlertDialog(
                  content: Text("Are you sure want to Logout? \n" + ""),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(ctx).pop();
                        },
                        child: Text("Cancel")),
                    TextButton(
                        onPressed: () {
                          signout().then((value) =>
                              Navigator.of(context)
                                  .pushReplacementNamed("/launch"));
                        },
                        child: Text("Logout")),
                  ],
                )
                    : AlertDialog(
                  title: Text('Are you sure want to Logout?'),
                  content: const Text('AlertDialog description'),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(ctx).pop();
                        },
                        child: Text("Cancel")),
                    TextButton(
                        onPressed: () {
                          signout().then((value) =>
                              Navigator.of(context)
                                  .pushReplacementNamed("/launch"));
                        },
                        child: Text("Logout")),
                  ],
                ),
              );
            },
          )
        ],
      ),
      body: Column(
        children: [

        ],
      ),
    );
  }
}
