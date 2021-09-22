import 'package:flutter/material.dart';
import 'package:shalong/UserAuthentication/AuthManager.dart';

class ShopPageScreen extends StatefulWidget {
  const ShopPageScreen({Key? key}) : super(key: key);

  @override
  _ShopPageScreenState createState() => _ShopPageScreenState();
}

class _ShopPageScreenState extends State<ShopPageScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shop Page"),
      ),
      body: ListView(
        children: [
          Text("wertyuiop")
        ],
      ),
    );
  }
}
