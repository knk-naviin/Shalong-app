import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shalong/UserAuthentication/AuthManager.dart';
import 'BarberAccountInfoScreen.dart';

class BarberSettingScreen extends StatefulWidget {
  const BarberSettingScreen({Key? key}) : super(key: key);

  @override
  _BarberSettingScreenState createState() => _BarberSettingScreenState();
}

class _BarberSettingScreenState extends State<BarberSettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: TextButton(
          style: TextButton.styleFrom(
            primary: Colors.blue,
            padding: EdgeInsets.all(20),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            backgroundColor: Colors.blue.shade50,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => BarberAccountInfoScreen()),
            );
          },
          child: Row(
            children: [
              Icon(CupertinoIcons.profile_circled),
              SizedBox(width: 20),
              Expanded(child: Text("Account Info")),
              Icon(Icons.arrow_forward_ios),
            ],
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: TextButton(
          style: TextButton.styleFrom(
            primary: Colors.blue,
            padding: EdgeInsets.all(20),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            backgroundColor: Colors.blue.shade50,
          ),
          onPressed: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => AnimationScreen()),
            // );
          },
          child: Row(
            children: [
              FaIcon(FontAwesomeIcons.clipboard),
              SizedBox(width: 20),
              Expanded(child: Text("Terms & Conditions")),
              Icon(Icons.arrow_forward_ios),
            ],
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: TextButton(
          style: TextButton.styleFrom(
            primary: Colors.blue,
            padding: EdgeInsets.all(20),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            backgroundColor: Colors.blue.shade50,
          ),
          onPressed: () {},
          child: Row(
            children: [
              Icon(Icons.rate_review),
              SizedBox(width: 20),
              Expanded(child: Text("Ratings")),
              Icon(Icons.arrow_forward_ios),
            ],
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: TextButton(
          style: TextButton.styleFrom(
            primary: Colors.blue,
            padding: EdgeInsets.all(20),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            backgroundColor: Colors.blue.shade50,
          ),
          onPressed: () {},
          child: Row(
            children: [
              Icon(Icons.help),
              SizedBox(width: 20),
              Expanded(child: Text("Help")),
              Icon(Icons.arrow_forward_ios),
            ],
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: TextButton(
          style: TextButton.styleFrom(
            primary: Colors.blue,
            padding: EdgeInsets.all(20),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            backgroundColor: Colors.blue.shade50,
          ),
          onPressed: () {},
          child: Row(
            children: [
              FaIcon(FontAwesomeIcons.facebookMessenger),
              SizedBox(width: 20),
              Expanded(child: Text("About")),
              Icon(Icons.arrow_forward_ios),
            ],
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: TextButton(
          style: TextButton.styleFrom(
            primary: Colors.blue,
            padding: EdgeInsets.all(20),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            backgroundColor: Colors.blue.shade50,
          ),
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
                              signout().then((value) => Navigator.of(context)
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
                              signout().then((value) => Navigator.of(context)
                                  .pushReplacementNamed("/launch"));
                            },
                            child: Text("Logout")),
                      ],
                    ),
            );
          },
          child: Row(
            children: [
              FaIcon(FontAwesomeIcons.signOutAlt),
              SizedBox(width: 20),
              Expanded(child: Text("Logout")),
              Icon(Icons.arrow_forward_ios),
            ],
          ),
        ),
      ),
      Divider(
        color: Colors.grey,
      ),
      Text(
        "This App is Copyright© under YAASH School Of Technology",
        style: TextStyle(color: CupertinoColors.systemGrey),
      ),
      Text(
        "Version: 1.0.0",
        style: TextStyle(color: CupertinoColors.systemGrey, fontSize: 21),
      )
    ]));
  }
}
