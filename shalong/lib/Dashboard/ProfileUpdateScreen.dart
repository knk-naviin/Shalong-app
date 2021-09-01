import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shalong/UserAuthentication/AuthManager.dart';


class ProfileUpdateScreen extends StatefulWidget {
  const ProfileUpdateScreen({Key? key}) : super(key: key);

  @override
  _ProfileUpdateScreenState createState() => _ProfileUpdateScreenState();
}

class _ProfileUpdateScreenState extends State<ProfileUpdateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile Update Screen"),
        centerTitle: true,
        backgroundColor: CupertinoColors.systemBlue,
        actions: [
          IconButton(icon:Icon(Icons.exit_to_app_rounded),onPressed: (){
            showDialog(context: context, builder: (ctx)=>
                Platform.isIOS
            ? CupertinoAlertDialog(content: Text("Are you sure want to Logout? \n"+""),actions: [
                  TextButton(onPressed: (){
                    Navigator.of(ctx).pop();
                  }, child: Text("Cancel")),
                  TextButton(onPressed: (){
                    signout().then((value) => Navigator.of(context).pushReplacementNamed("/launch"));
                  }, child: Text("Logout")),
                ],)
            :AlertDialog(
                  title:  Text('Are you sure want to Logout? \n"+""'),
                  content: const Text('AlertDialog description'),
                  actions: [
                    TextButton(onPressed: (){
                      Navigator.of(ctx).pop();
                    }, child: Text("Cancel")),
                    TextButton(onPressed: (){
                      signout().then((value) => Navigator.of(context).pushReplacementNamed("/launch"));
                    }, child: Text("Logout")),
                  ],
                ),
            );
          },
          )
        ],
      ),
    );
  }
}
