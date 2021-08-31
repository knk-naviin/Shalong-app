import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:pinput/pin_put/pin_put.dart';

import 'GoogleSignIn/GoogleSignIn.dart';

class UserAuth extends StatefulWidget {
  const UserAuth({Key? key}) : super(key: key);

  @override
  _UserAuthState createState() => _UserAuthState();
}

class _UserAuthState extends State<UserAuth> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 25.0),
                child: Text("Registartion",style: TextStyle(color: Colors.blue,fontSize: 38),),
              ),
              SizedBox(
                width: 320,
                child: TextField(
                  style: TextStyle(fontSize: 25),
                  cursorColor: Colors.black12,
                  decoration: InputDecoration(
                      hintText: "Enter Phone Number",
                      hintStyle: TextStyle(fontSize: 25),
                      prefixText: "+91 ",
                      prefixStyle: TextStyle(fontSize: 25),
                      border: OutlineInputBorder(
                          borderRadius:BorderRadius.circular(10.0)
                      )
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              CupertinoButton(child: Text("Get Otp"), onPressed: (){},color: CupertinoColors.systemBlue,),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: GoogleSignIn(),
              )

            ],
          ),
        ),
      ),
    );
  }
}
