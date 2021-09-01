import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shalong/Dashboard/Dashboard.dart';
import 'package:shalong/Dashboard/ProfileUpdateScreen.dart';

import '../AuthManager.dart';



class GoogleSignIn extends StatefulWidget {
  const GoogleSignIn({Key? key}) : super(key: key);

  @override
  _GoogleSignInState createState() => _GoogleSignInState();
}

class _GoogleSignInState extends State<GoogleSignIn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 45,
  child: Center(
          child: SizedBox(
        width: 200,
        height: 45,
        child: OutlinedButton(
          onPressed: () async {
           var profile = await signInWithGoogleAndGetProfile();
           if (profile == null) {
             Navigator.of(context).pushReplacementNamed("/profileUpdateScreen");

           } else {
             Navigator.of(context).pushReplacementNamed("/launch");

             // Navigator.push(context, MaterialPageRoute(builder: (builder) => DashboardScreen(profile)));
           }
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
}
