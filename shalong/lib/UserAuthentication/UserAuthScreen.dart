import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'AuthManager.dart';

class UserAuthScreen extends StatefulWidget {
  const UserAuthScreen({Key? key}) : super(key: key);

  @override
  _UserAuthScreenState createState() => _UserAuthScreenState();
}

class _UserAuthScreenState extends State<UserAuthScreen> {
  bool _isLoading = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SingleChildScrollView(
          //scrollDirection: Axis.vertical,
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset("images/haircutting.webp"),
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'Shalon',
                      style: TextStyle(
                          fontFamily: "Bunya-Regular_PERSONAL",
                          color: Colors.black,
                          letterSpacing: 3,
                          fontSize: 60
                      ),
                      children: const <TextSpan>[
                        TextSpan(
                            text: 'g',
                            style: TextStyle(
                              letterSpacing: 2,
                                fontFamily: "Bunya-Regular_PERSONAL",
                                color: CupertinoColors.systemRed,
                                fontSize: 70))
                      ],
                    ),
                  ),
                  // Text("Welcomes You",style: TextStyle(
                  //   color: Colors.blue,
                  //   fontSize: 18,
                  //   letterSpacing: 2
                  // ),),
                  Padding(
                    padding: const EdgeInsets.only(top: 68.0),
                    child: Container(
                      child: Column(
                        children: [
                          // SizedBox(
                          //   width: 230,
                          //   height: 50,
                          //   child: OutlinedButton(
                          //     onPressed: () {
                          //       print("PHone");
                          //     },
                          //     child: Text("Phone Verfication"),
                          //   ),
                          // ),
                          // Padding(
                          //   padding: const EdgeInsets.all(8.0),
                          //   child: Text("or"),
                          // ),
                          SizedBox(
                            width: 130,
                            height: 40,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(CupertinoColors.systemBlue),
                                elevation: MaterialStateProperty.all(0)
                              ),
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
                                              .pushReplacementNamed(
                                                  "/profileupdatescreen");
                                        } else {
                                          Navigator.of(context)
                                              .pushReplacementNamed("/launch");
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
                                          return AlertDialog(
                                              title: Text(onError.toString()));
                                        });
                                  });
                                },
                               child: Text("Google Sign in"),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              _isLoading
                  ? Scaffold(
                      backgroundColor: Colors.black.withOpacity(0.5),
                      body: Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Platform.isAndroid
                              ? CircularProgressIndicator()
                              : CupertinoActivityIndicator(
                                  animating: true,
                                ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Loading"),
                          )
                        ],
                      )),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
