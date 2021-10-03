
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shalong/Dashboard/CustomerDashboard/CustomerSettingScreen.dart';
import 'CustomerHomeScreen.dart';
import 'FavoritesScreen.dart';

class CustomerDashboardScreen extends StatefulWidget {

  @override
  _CustomerDashboardScreenState createState() => _CustomerDashboardScreenState();
}

class _CustomerDashboardScreenState extends State<CustomerDashboardScreen> {
  int _currentIndex = 0;
  static const List<Widget> _widgetOptions = [
    CustomerHomeScreen(),
    Text("favorites"),
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
      // appBar: AppBar(
      //   title: Text("Customer Screen"),
      //   centerTitle: true,
      //   backgroundColor: Colors.blue,
      //
      // ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home),
            label: "Home",
            backgroundColor: Colors.blue
          ),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.heart_fill),
              label: "Favorites",
              backgroundColor: Colors.blue

          ),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.bell_fill),
              label: "Notification",
              backgroundColor: Colors.blue
          ),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.settings_solid),
              label: "Settings",
              backgroundColor: Colors.blue
          )
        ],
        currentIndex: _currentIndex,
        showUnselectedLabels: true,
        onTap: _onItemTapped,
        elevation: 5,

      ),
        body: Container(child: _widgetOptions.elementAt(_currentIndex)));
  }
}
