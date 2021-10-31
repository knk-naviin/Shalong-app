import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shalong/Dashboard/CustomerDashboard/AboutScreen.dart';
import 'package:shalong/UserAuthentication/AuthManager.dart';
import 'package:url_launcher/url_launcher.dart';
import 'CustomerAccountInfoScreen.dart';

class CustomerSettingScreen extends StatefulWidget {
  const CustomerSettingScreen({Key? key}) : super(key: key);

  @override
  _CustomerSettingScreenState createState() => _CustomerSettingScreenState();
}

class _CustomerSettingScreenState extends State<CustomerSettingScreen> {
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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Settings"),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.lightBlueAccent, Colors.blue])),
        ),
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: TextButton(
              style: TextButton.styleFrom(
                primary: Colors.blue,
                padding: EdgeInsets.all(20),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                backgroundColor: Colors.blue.shade50,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CustomerAccountInfoScreen()),
                );
              },
              child: Row(
                children: [
                  Icon(CupertinoIcons.profile_circled),
                  SizedBox(width: 20),
                  Expanded(
                      child: Text(
                    "Account Info",
                    style: TextStyle(color: Colors.black),
                  )),
                  Icon(Icons.arrow_forward_ios),
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
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                backgroundColor: Colors.blue.shade50,
              ),
              onPressed: () {
                _launchInBrowser(_launchurl);
              },
              child: Row(
                children: [
                  FaIcon(FontAwesomeIcons.clipboard),
                  SizedBox(width: 20),
                  Expanded(
                      child: Text(
                    "Privacy Policy",
                    style: TextStyle(color: Colors.black),
                  )),
                  Icon(Icons.arrow_forward_ios),
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
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                backgroundColor: Colors.blue.shade50,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutScreen()),
                );
              },
              child: Row(
                children: [
                  Icon(Icons.developer_board),
                  SizedBox(width: 20),
                  Expanded(
                      child: Text(
                    "About",
                    style: TextStyle(color: Colors.black),
                  )),
                  Icon(Icons.arrow_forward_ios),
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
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                backgroundColor: Colors.blue.shade50,
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
                                  signout().then((value) =>
                                      Navigator.of(context)
                                          .pushReplacementNamed("/launch"));
                                },
                                child: Text("Logout")),
                          ],
                        )
                      : AlertDialog(
                          title: Text('Alert!',style: TextStyle(
                            color: CupertinoColors.destructiveRed
                          ),),
                          content: const Text('Are you sure want to Logout?'),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.of(ctx).pop();
                                },
                                child: Text("Cancel")),
                            TextButton(
                                onPressed: () {
                                  signout().then((value) =>
                                      Navigator.of(context)
                                          .pushReplacementNamed("/launchscreen"));
                                },
                                child: Text("Logout")),
                          ],
                        ),
                );
              },
              child: Row(
                children: [
                  FaIcon(FontAwesomeIcons.signOutAlt),
                  SizedBox(width: 20),
                  Expanded(
                      child: Text(
                    "Logout",
                    style: TextStyle(color: Colors.black),
                  )),
                  Icon(Icons.arrow_forward_ios),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
