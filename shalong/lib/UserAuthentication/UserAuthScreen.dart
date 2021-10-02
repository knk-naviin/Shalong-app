
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shalong/UserAuthentication/PhoneVerificationScreen.dart';
import 'AuthManager.dart';

class UserAuthScreen extends StatefulWidget {
  const UserAuthScreen({Key? key}) : super(key: key);

  @override
  _UserAuthScreenState createState() => _UserAuthScreenState();
}

class _UserAuthScreenState extends State<UserAuthScreen> {
  bool _isLoading = false;


  Widget gSignInButton() {
    return Container(
      width: 200,
      height: 45,
      child: Center(
          child: SizedBox(
        width: 200,
        height: 45,
        child: OutlinedButton(
          onPressed: () async {
            setState(() {
              _isLoading = true;
            });

            signInWithGoogle().then((value) {
              if (value == null) {
                setState(() {
                  _isLoading = false;
                });
              } else {
                profile().then((value) {
                  setState(() {
                    _isLoading = false;
                  });
                  if (value == null) {
                    Navigator.of(context)
                        .pushReplacementNamed("/profileupdatescreen");
                  }
                  else {
                    Navigator.of(context).pushReplacementNamed("/launch");
                  }
                });

              }
            }).catchError((onError) {
              setState(() {
                _isLoading = false;
              });
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(title: Text(onError.toString()));
                  });
            });
          },
          child: Row(
            children: [
              FaIcon(
                FontAwesomeIcons.google,
                color: CupertinoColors.systemRed,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "SIgn WIth Google",
                style: TextStyle(
                    color: CupertinoColors.systemBlue,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5),
              )
            ],
          ),
        ),
      )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 25.0),
                    child: Text(
                      "Welcome To ShalonG",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 38,
                          ),
                    ),
                  ),
                  CupertinoButton(
                    child: Text("Phone Verfication"),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PhoneVerificationScreen()),
                      );
                    },
                    color: CupertinoColors.systemBlue,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: gSignInButton(),
                  )
                ],
              ),
            ),
            _isLoading
                ? Scaffold(
              backgroundColor:  Colors.black.withOpacity(0.5),
              body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Platform.isAndroid?CircularProgressIndicator(

                      ):CupertinoActivityIndicator(
                        radius: 30,
                        animating: true,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Loading"),
                      )
                    ],
                  )
              ),
            )
                : Container()
          ],
        ),
      ),
    );
  }
}
