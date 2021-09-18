
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shalong/Dashboard/BarberDashboard/BarberSettingScreen.dart';

import 'BarberHomeScreen.dart';


class BarberDashboardScreen extends StatefulWidget {
  @override
  _BarberDashboardScreenState createState() => _BarberDashboardScreenState();
}

class _BarberDashboardScreenState extends State<BarberDashboardScreen> {
  int _currentIndex = 0;
  static const List<Widget> _widgetOptions = [
    BarberHomeScreen(),
    Center(
        child: Text(
      "Favorites",
      style: TextStyle(fontSize: 32),
    )),
    Center(
        child: Text(
      "Notifications",
      style: TextStyle(fontSize: 32),
    )),
    BarberSettingScreen()
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
          title: Text("Barber Screen"),
          centerTitle: true,
          backgroundColor: Colors.blue,

        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
                backgroundColor: Colors.blue),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: "Favorites",
                backgroundColor: Colors.blue),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications_active),
                label: "Notification",
                backgroundColor: Colors.blue),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "Profile",
                backgroundColor: Colors.blue)
          ],
          currentIndex: _currentIndex,
          showUnselectedLabels: false,
          onTap: _onItemTapped,
          elevation: 5,
        ),
        body: Container(child: _widgetOptions.elementAt(_currentIndex)));
  }
}
