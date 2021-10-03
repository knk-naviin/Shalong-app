import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  _HelpScreenState createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Help"),
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
                Center(child: Text("Help",style: TextStyle(fontSize: 32),)),
                Icon(Icons.help,size: 32,color: CupertinoColors.systemIndigo,)
              ],),
            Text("Coming Soon",style: TextStyle(
                color: CupertinoColors.systemGrey
            ),)
          ],
        )
    );
  }
}
