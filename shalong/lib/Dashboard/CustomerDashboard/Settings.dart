import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shalong/UserAuthentication/AuthManager.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
          ListTile(
        title: Text(
          "Profile",
          style: TextStyle(fontSize: 25, color: Colors.black),
        ),
        trailing: Icon(
          Icons.person,
          size: 25,
          color: Colors.blue,
        ),
        onTap: (){},
      ),
          Divider(
           color: Colors.grey,
          ),
          ListTile(
            title: Text(
              "Report",
              style: TextStyle(fontSize: 25, color: Colors.black),
            ),
            trailing: Icon(
              Icons.message,
              size: 25,
              color: Colors.blue,
            ),
            onTap: (){},
            autofocus: true,
          ),
          Divider(
            color: Colors.grey,
          ),
          ListTile(
            title: Text(
              "Terms & Conditions",
              style: TextStyle(fontSize: 25, color: Colors.black),
            ),
            trailing: Icon(
              Icons.developer_board_outlined,
              size: 25,
              color: Colors.blue,
            ),
            onTap: (){},
          ),
          Divider(
            color: Colors.grey,
          ),
          ListTile(
            title: Text(
              "About",
              style: TextStyle(fontSize: 25, color: Colors.black),
            ),
            trailing: Icon(
              Icons.details,
              size: 25,
              color: Colors.blue,
            ),
            onTap: (){},
          ),
          Divider(
            color: Colors.grey,
          ),
          ListTile(
            title: Text(
              "Review",
              style: TextStyle(fontSize: 25, color: Colors.black),
            ),
            trailing: Icon(
              Icons.rate_review,
              size: 25,
              color: Colors.blue,
            ),
            onTap: (){},
            autofocus: true,
          ),
          Divider(
            color: Colors.grey,
          ),
          ListTile(
            title: Text(
              "Logout",
              style: TextStyle(fontSize: 25, color: Colors.black),
            ),
            trailing: Icon(
              Icons.logout_outlined,
              size: 25,
              color: Colors.blue,
            ),
            onTap: (){
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
          ),
          Divider(
            color: Colors.blue,
    
          ),
                  Text("This App © Copyright to shalong Team",style: TextStyle(color: CupertinoColors.systemGrey),),
                  Text("Version 1.0.0",style: TextStyle(color: CupertinoColors.systemGrey))


    ]));
  }
}
