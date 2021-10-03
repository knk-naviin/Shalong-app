import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RatingsScreenSettings extends StatefulWidget {
  const RatingsScreenSettings({Key? key}) : super(key: key);

  @override
  _RatingsScreenSettingsState createState() => _RatingsScreenSettingsState();
}

class _RatingsScreenSettingsState extends State<RatingsScreenSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(

          title: Text("Ratings"),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.lightBlueAccent, Colors.blue])),
          ),
          backgroundColor: Colors.blue,
          elevation: 0,

        ),
        body:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(child: Text("Ratings",style: TextStyle(fontSize: 32),)),
                Icon(Icons.rate_review,size: 32,color: CupertinoColors.systemGreen,)
              ],),
            Text("Coming Soon",style: TextStyle(
                color: CupertinoColors.systemGrey
            ),)
          ],
        )
    );
  }
}
