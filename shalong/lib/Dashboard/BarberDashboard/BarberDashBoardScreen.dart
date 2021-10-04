import 'package:bottom_navy_bar/bottom_navy_bar.dart';
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
  late PageController _pageController;
  void _onItemTapped(int index) {
    setState(() {
      print(index);
      _currentIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        curve: Curves.ease,
        showElevation: false, // use this to remove appBar's elevation
        onItemSelected: (index) => setState(() {
          _currentIndex = index;
          _pageController.animateToPage(
            index,
            duration: Duration(milliseconds: 300),
            curve: Curves.ease,
          );
        }),
        items: [
          BottomNavyBarItem(
            icon: Icon(
              CupertinoIcons.home,
              color: CupertinoColors.separator,
            ),
            title: Text(
              'Home',
              style: TextStyle(color: Colors.black),
            ),
            activeColor: CupertinoColors.separator,
          ),
          BottomNavyBarItem(
            icon: Icon(
              CupertinoIcons.heart,
              color: CupertinoColors.separator,
            ),
            title: Text('Favorites', style: TextStyle(color: Colors.black)),
            activeColor:CupertinoColors.separator,
          ),
          BottomNavyBarItem(
            icon: Icon(
              CupertinoIcons.bell,
              color: CupertinoColors.separator,
            ),
            title: Text('Notification', style: TextStyle(color: Colors.black)),
            activeColor: CupertinoColors.separator,
          ),
          BottomNavyBarItem(
            icon: Icon(
              CupertinoIcons.settings_solid,
              color: CupertinoColors.separator,
            ),
            title: Text('Settings', style: TextStyle(color: Colors.black)),
            activeColor: CupertinoColors.separator,
          ),
        ],
      ),
      // body: Container(child: _widgetOptions.elementAt(_currentIndex))
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: <Widget>[
            BarberHomeScreen(),
            Text("Favorites"),
            Text("Notifications"),
            BarberSettingScreen(),
          ],
        ),
      ),
    );
  }
}
