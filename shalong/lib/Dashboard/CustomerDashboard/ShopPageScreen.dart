import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShopPageScreen extends StatefulWidget {
  bool isopen;
  final shopname;
  final shopadd;
  final phoneno;
  final ShopRatings;
  ShopPageScreen({
   this.shopname,
   this.shopadd,
    this.phoneno,
    required this.isopen,
    this.ShopRatings
});

  @override
  _ShopPageScreenState createState() => _ShopPageScreenState();
}

Future<void> getratings() async{

}

class _ShopPageScreenState extends State<ShopPageScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Shop Details"),
      ),
      body: Column(
        children: [
          ListTile(
            leading: Text(widget.ShopRatings,softWrap: false,),
          )
        ],
      ),
    );
  }
}
