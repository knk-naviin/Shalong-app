
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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

            var profile = signInWithGoogleAndGetProfile().then((value) {
              setState(() {
                _isLoading = false;
              });
              if (value == null) {
                Navigator.of(context)
                    .pushReplacementNamed("/profileupdatescreen");
              } else {
                Navigator.of(context).pushReplacementNamed("/launch");
              }
            }).catchError((onError) {
              setState(() {
                _isLoading = false;
              });
              // PlatformException exp = onError;
              // String? message = exp.message;
              // if (message == null) {
              //   message = ;
              // }
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
                      "Registration",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 38,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                  SizedBox(
                    width: 270,
                    child: TextField(
                      keyboardType: TextInputType.phone,
                      cursorColor: Colors.black12,
                      decoration: InputDecoration(
                          hintText: "         +91 Enter Phone Number",
                          // hintStyle: TextStyle(fontSize: 25),
                          // prefixText: "+91",
                          // prefixStyle: TextStyle(fontSize: 25),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0))),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CupertinoButton(
                    child: Text("Get Otp"),
                    onPressed: () {},
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
                ? Container(
                    width: double.infinity,
                    height: double.infinity,
                    color: Colors.black.withOpacity(.5),
                    child: Center(
                        child: Platform.isAndroid
                            ? CircularProgressIndicator(
                        )
                            : CupertinoActivityIndicator(
                                radius: 34,
                              )))
                : Container()
          ],
        ),
      ),
    );
  }
}
