import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'AuthManager.dart';

class UserAuthScreen extends StatefulWidget {
  const UserAuthScreen({Key? key}) : super(key: key);

  @override
  _UserAuthScreenState createState() => _UserAuthScreenState();
}

class _UserAuthScreenState extends State<UserAuthScreen> {
  bool _isLoading = false;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  CarouselController buttonCarouselController = CarouselController();
  TextEditingController _controller = TextEditingController();
  String _launchurl = 'https://privacyterms.io/view/fdigclPM-8YosmjKR-DnNCuL/';

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
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 35.0, top: 8),
                  //   child: Align(
                  //     alignment: Alignment.centerLeft,
                  //     child: Text(
                  //       "Enter phone number to get otp",
                  //       style: TextStyle(color: Colors.grey),
                  //     ),
                  //   ),
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: Container(
                  //     margin: EdgeInsets.symmetric(horizontal: 20.0),
                  //     padding: EdgeInsets.symmetric(horizontal: 20.0),
                  //     // height: 54,
                  //     decoration: BoxDecoration(
                  //         color: Colors.white,
                  //         borderRadius: BorderRadius.circular(20),
                  //         // border: Border.all(
                  //         //   style: BorderStyle.solid,
                  //         //     color: CupertinoColors.secondaryLabel),
                  //         boxShadow: [
                  //           BoxShadow(
                  //               offset: Offset(0, 0),
                  //               blurRadius: 25,
                  //               color: Colors.blue.withOpacity(0.23))
                  //         ]),
                  //     child: Form(
                  //       key: formkey,
                  //       child: TextFormField(
                  //         // maxLength: 10,
                  //         validator: (value) {
                  //           if (value!.isEmpty) {
                  //             showDialog(
                  //                 context: context,
                  //                 builder: (BuildContext context) {
                  //                   return AlertDialog(
                  //                     title: Text(
                  //                       "Alert!",
                  //                       style: TextStyle(
                  //                         color: CupertinoColors.systemRed,
                  //                       ),
                  //                     ),
                  //                     content: Text("Enter Phone Number"),
                  //                   );
                  //                 });
                  //           } else if (value.length != 10) {
                  //             showDialog(
                  //                 context: context,
                  //                 builder: (BuildContext context) {
                  //                   return AlertDialog(
                  //                     title: Text(
                  //                       "Alert!",
                  //                       style: TextStyle(
                  //                         color: CupertinoColors.systemRed,
                  //                       ),
                  //                     ),
                  //                     content:
                  //                         Text("Enter Correct Phone Number"),
                  //                   );
                  //                 });
                  //           } else {
                  //             Navigator.push(
                  //               context,
                  //               MaterialPageRoute(
                  //                   builder: (context) =>
                  //                       OTPScreen(_controller.text)),
                  //             );
                  //           }
                  //         },
                  //         controller: _controller,
                  //         keyboardType: TextInputType.phone,
                  //         // controller: editingController,
                  //         decoration: InputDecoration(
                  //             prefixIcon: Icon(CupertinoIcons.phone),
                  //
                  //             // suffixIcon: Icon(Icons.search,color: Colors.blue,),
                  //             hintText: "Phone Number",
                  //             hintStyle: TextStyle(color: Colors.blue),
                  //             enabledBorder: InputBorder.none,
                  //             focusedBorder: InputBorder.none),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.only(top: 20.0),
                  //   child: Align(
                  //     alignment: Alignment.center,
                  //     child: Container(
                  //       // margin: EdgeInsets.symmetric(horizontal: 20.0),
                  //       // padding: EdgeInsets.symmetric(horizontal: 20.0),
                  //       height: 54,
                  //       width: 200,
                  //       decoration: BoxDecoration(
                  //         color: CupertinoColors.systemBlue,
                  //         borderRadius: BorderRadius.circular(10),
                  //       ),
                  //       child: Center(
                  //         child: CupertinoButton(
                  //           // color: Colors.white,
                  //           onPressed: () {
                  //             if (formkey.currentState!.validate()) {
                  //               (formkey.currentState!.save());
                  //             }
                  //           },
                  //           child: Text(
                  //             "Submit",
                  //             style: TextStyle(color: Colors.white),
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // Align(
                  //   alignment: Alignment.center,
                  //   child: Text(
                  //     "to Shalong",
                  //     style: TextStyle(
                  //         letterSpacing: 5,
                  //         color: CupertinoColors.systemGrey,
                  //         fontWeight: FontWeight.w100,
                  //         fontSize: 20),
                  //   ),
                  // ),
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
                          // boxShadow: [
                          //   BoxShadow(
                          //       offset: Offset(0, 0),
                          //       blurRadius: 20,
                          //       color: Colors.blue.withOpacity(0.23))
                          // ]
                          // border: Border.all(
                          //   style: BorderStyle.solid,
                          //     color: CupertinoColors.secondaryLabel),
                          // boxShadow: [
                          //   BoxShadow(
                          //       offset: Offset(0, 0),
                          //       blurRadius: 20,
                          //       color: Colors.blue.withOpacity(0.23))
                          // ]
                        ),
                        child: Center(
                          child: ElevatedButton(
                            style: ButtonStyle(
                                elevation: MaterialStateProperty.all(0),
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.white)),
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
                                          .pushReplacementNamed(
                                              "/launchscreen");
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
                            child: Row(
                              children: [
                                Image.asset("images/Googlelogo.png"),
                                Text(
                                  "Sign in with google",
                                  style: TextStyle(color: Colors.black),
                                )
                              ],
                            ),
                          ),
                        )),
                  ),
                  Stack(
                    children: [
                      Center(
                        child: Text(
                          "By sign in your account,",
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
                            // Padding(
                            //   padding: const EdgeInsets.all(8.0),
                            //   child: Text("Loading"),
                            // )
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
