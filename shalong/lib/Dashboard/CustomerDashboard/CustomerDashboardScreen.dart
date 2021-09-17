import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shalong/Dashboard/CustomerDashboard/CustomerSettingScreen.dart';
import 'package:shalong/UserAuthentication/AuthManager.dart';

import 'CustomerHomeScreen.dart';

class CustomerDashboardScreen extends StatefulWidget {

  @override
  _CustomerDashboardScreenState createState() => _CustomerDashboardScreenState();
}

class _CustomerDashboardScreenState extends State<CustomerDashboardScreen> {
  int _currentIndex = 0;
  static const List<Widget> _widgetOptions = [
    CustomerHomeScreen(),
    Center(child: Text("Favorites",style: TextStyle(fontSize: 32),)),
    Center(child: Text("Notifications",style: TextStyle(fontSize: 32),)),
    CustomerSettingScreen()
    ];
  void _onItemTapped(int index) {
    setState(() {
      print(index);
      _currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Customer Screen"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        actions: [
          ElevatedButton.icon(
            icon: Icon(Icons.exit_to_app_rounded),
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
                          signout().then((value) =>
                              Navigator.of(context)
                                  .pushReplacementNamed("/launch"));
                        },
                        child: Text("Logout")),
                  ],
                ),
              );
            },
            label: Text("Logout"),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
            label: "Home",
            backgroundColor: Colors.blue
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: "Favorites",
              backgroundColor: Colors.blue

          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications_active),
              label: "Notification",
              backgroundColor: Colors.blue
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: "Settings",
              backgroundColor: Colors.blue
          )
        ],
        currentIndex: _currentIndex,
        showUnselectedLabels: false,
        onTap: _onItemTapped,

        elevation: 5,

      ),
        body: Container(child: _widgetOptions.elementAt(_currentIndex)));
  }
}
