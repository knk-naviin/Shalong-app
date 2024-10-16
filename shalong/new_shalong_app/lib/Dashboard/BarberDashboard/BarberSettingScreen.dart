import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../UserAuthentication/AuthManager.dart';
import 'BarberAboutScreen.dart';
import 'BarberAccountInfoScreen.dart';


class BarberSettingScreen extends StatefulWidget {
  const BarberSettingScreen({Key? key}) : super(key: key);

  @override
  _BarberSettingScreenState createState() => _BarberSettingScreenState();
}

class _BarberSettingScreenState extends State<BarberSettingScreen> {
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
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Settings"),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.grey, Colors.black26])),
        ),
        backgroundColor: Colors.white10,
        elevation: 0,
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start, children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.blue, padding: EdgeInsets.all(20),
                shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                backgroundColor: Colors.grey.shade50,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BarberAccountInfoScreen()),
                );
              },
              child: Row(
                children: [
                  Icon(CupertinoIcons.profile_circled,color: Colors.black),
                  SizedBox(width: 20),
                  Expanded(child: Text("Account Info",style: TextStyle(
                      color: Colors.black
                  ),)),
                  Icon(Icons.arrow_forward_ios,color: Colors.black),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.blue, padding: EdgeInsets.all(20),
                shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                backgroundColor: Colors.grey.shade50,
              ),
              onPressed: () {
                _launchInBrowser(_launchurl);
              },
              child: Row(
                children: [
                  FaIcon(FontAwesomeIcons.clipboard,color: Colors.black),
                  SizedBox(width: 20),
                  Expanded(child: Text("Privacy Policy",style: TextStyle(
                      color: Colors.black
                  ),)),
                  Icon(Icons.arrow_forward_ios,color: Colors.black),
                ],
              ),
            ),
          ),
          // Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          //   child: TextButton(
          //     style: TextButton.styleFrom(
          //       primary: Colors.blue,
          //       padding: EdgeInsets.all(20),
          //       shape:
          //       RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          //       backgroundColor: Colors.grey.shade50,
          //     ),
          //     onPressed: () {
          //       Navigator.push(
          //         context,
          //         MaterialPageRoute(builder: (context) => InAppReviewExampleApp()),
          //       );
          //     },
          //     child: Row(
          //       children: [
          //         Icon(Icons.rate_review,color: Colors.black),
          //         SizedBox(width: 20),
          //         Expanded(child: Text("Ratings",style: TextStyle(
          //             color: Colors.black
          //         ),)),
          //         Icon(Icons.arrow_forward_ios,color: Colors.black,),
          //       ],
          //     ),
          //   ),
          // ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.blue, padding: EdgeInsets.all(20),
                shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                backgroundColor: Colors.grey.shade50,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BarberAboutScreen()),
                );
              },
              child: Row(
                children: [
                  Icon(Icons.developer_board,color: Colors.black),
                  SizedBox(width: 20),
                  Expanded(child: Text("About",style: TextStyle(
                      color: Colors.black
                  ),)),
                  Icon(Icons.arrow_forward_ios,color: Colors.black),
                ],
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.blue, padding: EdgeInsets.all(20),
                shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                backgroundColor: Colors.grey.shade50,
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
                    content: Text('Are you sure want to Logout?'),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.of(ctx).pop();
                          },
                          child: Text("Cancel")),
                      TextButton(
                          onPressed: () {
                            signout().then((value) => Navigator.of(context)
                                .pushReplacementNamed("/launchscreen"));
                          },
                          child: Text("Logout")),
                    ],
                  ),
                );
              },
              child: Row(
                children: [
                  FaIcon(FontAwesomeIcons.signOutAlt,color: Colors.black),
                  SizedBox(width: 20),
                  Expanded(child: Text("Logout",style: TextStyle(
                      color: Colors.black
                  ),)),
                  Icon(Icons.arrow_forward_ios,color: Colors.black),
                ],
              ),
            ),
          ),

        ]),
      ),
    );
  }
}
