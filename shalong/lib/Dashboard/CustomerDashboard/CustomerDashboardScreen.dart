import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shalong/Dashboard/CustomerDashboard/CustomerSettingScreen.dart';
import 'CustomerHomeScreen.dart';
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
      // appBar: AppBar(
      //   title: Text("Customer Screen"),
      //   centerTitle: true,
      //   backgroundColor: Colors.blue,
      //
      // ),
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: _currentIndex,
      //   onTap: _onItemTapped,
      //   elevation: 0,
      //   showUnselectedLabels: true,
      //   showSelectedLabels: true,
      //   type: BottomNavigationBarType.shifting,
      //   selectedItemColor: CupertinoColors.systemBlue,
      //   unselectedItemColor: CupertinoColors.systemGrey,
      //   items: [
      //     BottomNavigationBarItem(
      //       label: "Home",
      //         icon: Icon(CupertinoIcons.home,
      //           color: CupertinoColors.systemBlue,
      //         ),
      //       backgroundColor: Colors.white
      //     ),
      //     BottomNavigationBarItem(
      //         icon: Icon(CupertinoIcons.heart_fill,
      //           color: CupertinoColors.systemBlue,
      //         ),
      //         label: "Favorites",
      //         backgroundColor: Colors.white
      //     ),
      //     BottomNavigationBarItem(
      //         icon: Icon(CupertinoIcons.bell_fill,
      //           color: CupertinoColors.systemBlue,
      //         ),
      //         label: "Notification",
      //         backgroundColor: Colors.white
      //     ),
      //     BottomNavigationBarItem(
      //         icon: Icon(CupertinoIcons.settings_solid,
      //           color: CupertinoColors.systemBlue,
      //         ),
      //         label: "Settings",
      //         backgroundColor: Colors.white
      //     )
      //   ],
      // ),
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
              color: CupertinoColors.systemBlue,
            ),
            title: Text('Home'),
            activeColor: CupertinoColors.systemBlue,
          ),
          BottomNavyBarItem(
            icon: Icon(
              CupertinoIcons.heart,
              color: CupertinoColors.systemBlue,
            ),
            title: Text('Favorites'),
            activeColor: CupertinoColors.systemBlue,
          ),
          BottomNavyBarItem(
            icon: Icon(
              CupertinoIcons.bell,
              color: CupertinoColors.systemBlue,
            ),
            title: Text('Notification'),
            activeColor: CupertinoColors.systemBlue,
          ),
          BottomNavyBarItem(
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
