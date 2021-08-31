import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'LogIn.dart';
class EmailMain extends StatefulWidget {
  const EmailMain({Key? key}) : super(key: key);

  @override
  _EmailMainState createState() => _EmailMainState();
}

class _EmailMainState extends State<EmailMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                  onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => LogIn()));
              }, icon: Icon(Icons.mail
                ,color: Colors.white,), label:Text("Sign Up With EMail"))
            ],
          ),
        ],
      ),
    );
  }
}
