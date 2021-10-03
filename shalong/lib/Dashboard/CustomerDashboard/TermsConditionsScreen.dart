import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TermsConditionScreen extends StatefulWidget {
  const TermsConditionScreen({Key? key}) : super(key: key);

  @override
  _TermsConditionScreenState createState() => _TermsConditionScreenState();
}

class _TermsConditionScreenState extends State<TermsConditionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(

          title: Text("Terms & Conditions"),
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
                Center(child: Text("Terms & Conditions",style: TextStyle(fontSize: 32),)),
                Icon(Icons.file_copy,size: 32,color: CupertinoColors.systemRed,)
              ],),
            Text("Coming Soon",style: TextStyle(
                color: CupertinoColors.systemGrey
            ),)
          ],
        )
    );
  }
}
