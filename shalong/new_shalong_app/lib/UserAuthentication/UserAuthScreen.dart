import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class UserAuthScreen extends StatefulWidget {
  const UserAuthScreen({Key? key}) : super(key: key);

  @override
  _UserAuthScreenState createState() => _UserAuthScreenState();
}

class _UserAuthScreenState extends State<UserAuthScreen> {
  bool _isLoading = false;
  TextEditingController _controller = TextEditingController();
  String _launchurl = 'https://privacyterms.io/view/fdigclPM-8YosmjKR-DnNCuL/';

  // Firebase Authentication and Google Sign-In instances
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;



  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: true,
        headers: <String, String>{'header_key': 'header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential userCredential = await _auth.signInWithCredential(credential);
      return userCredential.user; // Return the user
    } catch (error) {
      print('Error signing in: $error');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 40.0),
                    child: Image.asset("images/haircutting.webp"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Welcome,",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, bottom: 20),
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 20.0),
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      height: 54,
                      width: 290,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          style: BorderStyle.solid,
                          color: Colors.grey.shade200,
                        ),
                      ),
                      child: Center(
                        child: ElevatedButton(
                          style: ButtonStyle(
                              elevation: MaterialStateProperty.all(0),
                              backgroundColor: MaterialStateProperty.all(Colors.white)),
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
                                // Check user profile or navigate
                                Navigator.of(context).pushReplacementNamed("/launchscreen");
                                setState(() {
                                  _isLoading = false;
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
                          child: Row(
                            children: [
                              Image.asset("images/Googlelogo.png"),
                              Text(
                                "Sign in with Google",
                                style: TextStyle(color: Colors.black),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Stack(
                    children: [
                      Center(
                        child: Text(
                          "By signing in to your account,",
                          style: TextStyle(
                              fontSize: 12, color: CupertinoColors.systemGrey),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "You are agreeing to our",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: CupertinoColors.systemGrey),
                            ),
                            TextButton(
                                onPressed: () {
                                  _launchInBrowser(_launchurl);
                                },
                                child: Text(
                                  "TERMS AND POLICY",
                                  style: TextStyle(fontSize: 12),
                                ))
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 378.0),
                child: Align(
                  alignment: Alignment.center,
                  child: _isLoading
                      ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Platform.isAndroid
                          ? CircularProgressIndicator()
                          : CupertinoActivityIndicator(
                        animating: true,
                      ),
                    ],
                  )
                      : Container(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
