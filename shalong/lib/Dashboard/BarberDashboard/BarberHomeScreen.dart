import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:time_range/time_range.dart';

class BarberHomeScreen extends StatefulWidget {
  const BarberHomeScreen({Key? key}) : super(key: key);

  @override
  _BarberHomeScreenState createState() => _BarberHomeScreenState();
}

class _BarberHomeScreenState extends State<BarberHomeScreen> {

  bool ShopOpen = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
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
                                    title:  Text("Pick Shop Opening Time"),
                                  actions: [

                                  ],
                                  );
                                },
                              );
                            }else if(value==false){
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  // return object of type Dialog
                                  return AlertDialog(
                                    title:  Text("ThankYou "),
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
          Divider(
            color: Colors.grey,
          ),
          Visibility(
              visible: ShopOpen,
              child: Column(
                children: [
                  Card(
                    child: Column(
                      children: [
                        Text(
                          'Time Slot For Customer',
                          style:
                          TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.only( top: 8.0,left: 40),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: OutlinedButton(
                                    onPressed: (){},
                                    child: Text("10 AM")
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: OutlinedButton(
                                    onPressed: (){},
                                    child: Text("11 AM")
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: OutlinedButton(
                                    onPressed: (){},
                                    child: Text("12 AM")
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: OutlinedButton(
                                    onPressed: (){},
                                    child: Text("01 AM")
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only( top: 8.0,left: 40),
                          child: Row(
                            children: [

                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: OutlinedButton(
                                    onPressed: (){},
                                    child: Text("02 PM")
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: OutlinedButton(
                                    onPressed: (){},
                                    child: Text("03 PM")
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: OutlinedButton(
                                    onPressed: (){},
                                    child: Text("04 PM")
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: OutlinedButton(
                                    onPressed: (){},
                                    child: Text("05 PM")
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only( top: 8.0,left: 40),
                          child: Row(
                            children: [

                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: OutlinedButton(
                                    onPressed: (){},
                                    child: Text("06 PM")
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: OutlinedButton(
                                    onPressed: (){},
                                    child: Text("07 PM")
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: OutlinedButton(
                                    onPressed: (){},
                                    child: Text("08 PM")
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: OutlinedButton(
                                    onPressed: (){},
                                    child: Text("09 PM")
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  ),
                ],
              )
          )
        ],
      ),
    );
  }
}
