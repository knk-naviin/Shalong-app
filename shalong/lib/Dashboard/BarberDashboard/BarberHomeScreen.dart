import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BarberHomeScreen extends StatefulWidget {
  const BarberHomeScreen({Key? key}) : super(key: key);

  @override
  _BarberHomeScreenState createState() => _BarberHomeScreenState();
}

class _BarberHomeScreenState extends State<BarberHomeScreen> {
  bool ShopOpen = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Center(
            child: Text(
             'Home',
             style: TextStyle(
                 fontSize: 18.0,
                 fontWeight: FontWeight.bold),
                ),
          ),

          Padding(
              padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'Is Shop is Open ?',
                    style:
                    TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                      child: CupertinoSwitch(
                          value: ShopOpen,
                          onChanged: (bool value) {
                            if(value==true){
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  // return object of type Dialog
                                  return AlertDialog(
                                    title:  Text("WelCome"),
                                    actions: [],
                                  );
                                },
                              );
                            }else if(value==false){
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  // return object of type Dialog
                                  return AlertDialog(
                                    title:  Text("ThankYou"),
                                    actions: [

                                    ],
                                  );
                                },
                              );
                            }
                            setState(() {
                              ShopOpen = value;
                            });
                          }))
                ],
              )),
          Visibility(
              visible: ShopOpen,
            child: ListView(
              children: [
                Text("Shop is opened")
              ],
            )
          ),

        ],
      ),
    );
  }
}
