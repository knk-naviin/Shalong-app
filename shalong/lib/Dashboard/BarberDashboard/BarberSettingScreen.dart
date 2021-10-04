import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shalong/Dashboard/BarberDashboard/BarberAboutScreen.dart';
import 'package:shalong/Dashboard/CustomerDashboard/AboutScreen.dart';
import 'package:shalong/Dashboard/CustomerDashboard/RatingsScreenSettings.dart';
import 'package:shalong/Dashboard/CustomerDashboard/TermsConditionsScreen.dart';
import 'package:shalong/UserAuthentication/AuthManager.dart';
import 'BarberAccountInfoScreen.dart';
import 'BarberTermsConditionsScreen.dart';

class BarberSettingScreen extends StatefulWidget {
  const BarberSettingScreen({Key? key}) : super(key: key);

  @override
  _BarberSettingScreenState createState() => _BarberSettingScreenState();
}

class _BarberSettingScreenState extends State<BarberSettingScreen> {
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

      ),

      body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: TextButton(
            style: TextButton.styleFrom(
              primary: Colors.blue,
              padding: EdgeInsets.all(20),
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
              primary: Colors.blue,
              padding: EdgeInsets.all(20),
              shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              backgroundColor: Colors.grey.shade50,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BarberPrivacyPolicyScreen()),
              );
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
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: TextButton(
            style: TextButton.styleFrom(
              primary: Colors.blue,
              padding: EdgeInsets.all(20),
              shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              backgroundColor: Colors.grey.shade50,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RatingsScreenSettings()),
              );
            },
            child: Row(
              children: [
                Icon(Icons.rate_review,color: Colors.black),
                SizedBox(width: 20),
                Expanded(child: Text("Ratings",style: TextStyle(
                    color: Colors.black
                ),)),
                Icon(Icons.arrow_forward_ios,color: Colors.black,),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: TextButton(
            style: TextButton.styleFrom(
              primary: Colors.blue,
              padding: EdgeInsets.all(20),
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
        // Padding(
        //   padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        //   child: TextButton(
        //     style: TextButton.styleFrom(
        //       primary: Colors.blue,
        //       padding: EdgeInsets.all(20),
        //       shape:
        //       RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        //       backgroundColor: Colors.blue.shade50,
        //     ),
        //     onPressed: () {
        //       Navigator.push(
        //         context,
        //         MaterialPageRoute(builder: (context) => HelpScreen()),
        //       );
        //     },
        //     child: Row(
        //       children: [
        //         Icon(Icons.help),
        //         SizedBox(width: 20),
        //         Expanded(child: Text("Help",style: TextStyle(
        //             color: Colors.black
        //         ),)),
        //         Icon(Icons.arrow_forward_ios),
        //       ],
        //     ),
        //   ),
        // ),
        // Padding(
        //   padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        //   child: TextButton(
        //     style: TextButton.styleFrom(
        //       primary: Colors.blue,
        //       padding: EdgeInsets.all(20),
        //       shape:
        //       RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        //       backgroundColor: Colors.blue.shade50,
        //     ),
        //     onPressed: () {},
        //     child: Row(
        //       children: [
        //         FaIcon(FontAwesomeIcons.facebookMessenger),
        //         SizedBox(width: 20),
        //         Expanded(child: Text("About")),
        //         Icon(Icons.arrow_forward_ios),
        //       ],
        //     ),
        //   ),
        // ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: TextButton(
            style: TextButton.styleFrom(
              primary: Colors.blue,
              padding: EdgeInsets.all(20),
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
                          signout().then((value) => Navigator.of(context)
                              .pushReplacementNamed("/launch"));
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
    );
  }
}
