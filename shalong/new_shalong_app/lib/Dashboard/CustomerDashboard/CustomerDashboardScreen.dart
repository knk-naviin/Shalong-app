import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'CustomerHomeScreen.dart';
import 'CustomerSettingScreen.dart';
import 'FavoritesScreen.dart';
import 'NotificationScreen.dart';

class CustomerDashboardScreen extends StatefulWidget {
  @override
  _CustomerDashboardScreenState createState() =>
      _CustomerDashboardScreenState();
}

class _CustomerDashboardScreenState extends State<CustomerDashboardScreen> {
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
            textAlign: TextAlign.center,
            icon: Icon(
              CupertinoIcons.home,
              color: CupertinoColors.systemBlue,
            ),
            title: Text('Home'),
            activeColor: CupertinoColors.systemBlue,
          ),
          BottomNavyBarItem(
            textAlign: TextAlign.center,
            icon: Icon(
              CupertinoIcons.heart,
              color: CupertinoColors.systemBlue,
            ),
            title: Text('Favorites'),
            activeColor: CupertinoColors.systemBlue,
          ),
          BottomNavyBarItem(
            textAlign: TextAlign.center,
            icon: Icon(
              CupertinoIcons.bell,
              color: CupertinoColors.systemBlue,
            ),
            title: Text('Notification'),
            activeColor: CupertinoColors.systemBlue,
          ),
          BottomNavyBarItem(
            textAlign: TextAlign.center,
            icon: Icon(
              CupertinoIcons.settings_solid,
              color: CupertinoColors.systemBlue,
            ),
            title: Text('Settings'),
            activeColor: CupertinoColors.systemBlue,
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
            CustomerHomeScreen(),
            FavoritesScreen(),
            NotificationScreen(),
            CustomerSettingScreen()
          ],
        ),
      ),
    );
  }
}
