
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ShopPageScreen extends StatefulWidget {



  @override
  _ShopPageScreenState createState() => _ShopPageScreenState();
}

class _ShopPageScreenState extends State<ShopPageScreen> {
  @override
  Widget build(BuildContext context) {
    var dp =FirebaseAuth.instance.currentUser!.photoURL;
    return Scaffold(
        appBar: AppBar(
          title: Text("Shop Details"),
        ),
        body: ListView(
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(dp!),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 48.0),
                  child: Text("Shop Name"),
                )
              ],
            )
          ],
        ),
    );
  }
}
