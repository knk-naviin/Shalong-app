import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:shalong/UserAuthentication/AuthManager.dart';

import 'RatingScreen.dart';

class ShopPageScreen extends StatefulWidget {
  // bool isopen;
  // final shopname;
  // final shopadd;
  // final phoneno;
  // final ShopRatings;
  // ShopPageScreen(
  //     {this.shopname,
  //     this.shopadd,
  //     this.phoneno,
  //     required this.isopen,
  //     this.ShopRatings});
  ShopInfo shopInfo;
  List<Rating> ratings;
  ShopPageScreen(
      this.shopInfo,
      this.ratings
      );

  @override
  _ShopPageScreenState createState() => _ShopPageScreenState();
}

Future<void> getratings() async {}

class _ShopPageScreenState extends State<ShopPageScreen> {
  late TimeOfDay time;
  late TimeOfDay picked;

  bool isSwitched = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    time = TimeOfDay.now();
  }

  Future<Null> selectedTime(BuildContext context) async {
    picked = (await showTimePicker(context: context, initialTime: time))!;

    if (picked != null) {
      setState(() {
        time = picked;
      });
    }
  }

  Rating? myRating() {
    List<Rating>? ratings = widget.ratings.where((element) => element.uid == FirebaseAuth.instance.currentUser?.uid).toList();

    return ratings.length > 0 ? ratings.first : null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Shop Details"),
      ),
      body: widget.shopInfo.isOpen?Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.shopInfo.name,
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                width: 85,
              ),
              Text(
                " ${widget.shopInfo.isOpen ? "Open" : "Closed"}",
                style: TextStyle(
                    fontSize: 22,
                    color: widget.shopInfo.isOpen ? Colors.red : Colors.grey,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Divider(),
          Padding(
              padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 1.0),
              child: new Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  new Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        'Address:',
                        style: TextStyle(
                            // decoration: TextDecoration.underline,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              )),
          Padding(
            padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 2.0),
            child: Text(
              widget.shopInfo.address,
              style: TextStyle(),
            ),
          ),
          Divider(),
          Padding(
              padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
              child: new Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  new Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        'Phone Number:',
                        style: TextStyle(
                            //decoration: TextDecoration.underline,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              )),
          Padding(
            padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 2.0),
            child: Text(
              widget.shopInfo.phone,
              style: TextStyle(),
            ),
          ),
          Divider(),
          Stack(
            children: [
              Column(
                children: [
                  Padding(
                      padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
                      child: new Row(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          new Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text(
                                'Book Slot:',
                                style: TextStyle(
                                    // decoration: TextDecoration.underline,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      )),
                  Padding(
                    padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 5.0),
                    child: Column(
                      children: [
                        OutlinedButton(
                          onPressed: () {
                            selectedTime(context);
                          },
                          child: Text("Click Here"),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Time  "),
                            Text(
                              '${time.hourOfPeriod}:${time.minute} ${time.period}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: Center(child: Text("OR",style: TextStyle(
                  //     fontSize: 20,
                  //     fontWeight: FontWeight.bold
                  //   ),)),
                  // ),
                  Padding(
                      padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 5.0),
                      child: new Row(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Text(
                            'To Select Pre-Defined Time:',
                            style: TextStyle(
                                // decoration: TextDecoration.underline,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold),
                          ),
                          Expanded(
                            flex: 1,
                            child: Switch(
                              value: isSwitched,
                              onChanged: (value) {
                                setState(() {
                                  isSwitched = value;
                                  print(isSwitched);
                                });
                              },
                              activeTrackColor: Colors.blue,
                              activeColor: Colors.white,
                            ),
                          ),
                        ],
                      )),
                  Padding(
                    padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 5.0),
                    child: Visibility(
                      visible: isSwitched,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                  child: OutlinedButton(
                                      onPressed: () {}, child: Text("10:00 AM"))),
                              SizedBox(
                                width: 12,
                              ),
                              Expanded(
                                  child: OutlinedButton(
                                      onPressed: () {}, child: Text("11:00 AM"))),
                              SizedBox(
                                width: 12,
                              ),
                              Expanded(
                                  child: OutlinedButton(
                                      onPressed: () {}, child: Text("12:00 PM"))),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: OutlinedButton(
                                      onPressed: () {}, child: Text("01:00 PM"))),
                              SizedBox(
                                width: 12,
                              ),
                              Expanded(
                                  child: OutlinedButton(
                                      onPressed: () {}, child: Text("02:00 PM"))),
                              SizedBox(
                                width: 12,
                              ),
                              Expanded(
                                  child: OutlinedButton(
                                      onPressed: () {}, child: Text("03:00 PM"))),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: OutlinedButton(
                                      onPressed: () {}, child: Text("04:00 PM"))),
                              SizedBox(
                                width: 12,
                              ),
                              Expanded(
                                  child: OutlinedButton(
                                      onPressed: () {}, child: Text("05:00 PM"))),
                              SizedBox(
                                width: 12,
                              ),
                              Expanded(
                                  child: OutlinedButton(
                                      onPressed: () {}, child: Text("06:00 PM"))),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: OutlinedButton(
                                      onPressed: () {}, child: Text("07:00 PM"))),
                              SizedBox(
                                width: 12,
                              ),
                              Expanded(
                                  child: OutlinedButton(
                                      onPressed: () {}, child: Text("08:00 PM"))),
                              SizedBox(
                                width: 12,
                              ),
                              Expanded(
                                  child: OutlinedButton(
                                      onPressed: () {}, child: Text("09:00 PM"))),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                height: 210,
                width: double.infinity,
                color: Colors.white70,
                child: Center(child:
                Column(
                  children: [
                    Text("This Feature is ",style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold
                    ),),
                    Image.asset(
                      "images/comingsoon.png",
                      width: 210,
                      height: 150,
                    )
                  ],
                )
                ),
              ),
            ],
          ),
          Divider(),
          Row(
            children: [
              Padding(
                  padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 1.0),
                  child: new Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      new Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            'Give Ratings:',
                            style: TextStyle(
                              // decoration: TextDecoration.underline,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  )),
              Padding(
                padding: const EdgeInsets.only(left: 138.0),
                child: TextButton.icon(
                  icon: Icon(Icons.rate_review),
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RatingScreen(widget.shopInfo,myRating()

                      )),
                    );
                  },
                  label: Text("Ratings"),

                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
            child: CupertinoButton(
                color: CupertinoColors.activeBlue.darkColor,
                child: Text("Book For Hair Cut"),
                onPressed: () {
// Navigator.push(
//   context,
//   MaterialPageRoute(builder: (context) => MyHomePage()),
// );
                }),
          )

        ],
      )
          :Stack(
        children: [
          IgnorePointer(
            ignoringSemantics: true,
            ignoring: widget.shopInfo.isOpen ? false : true,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        widget.shopInfo.name,
                        style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(
                      width: 85,
                    ),
                    Text(
                      " ${widget.shopInfo.isOpen ? "Open" : "Closed"}",
                      style: TextStyle(
                          fontSize: 22,
                          color: widget.shopInfo.isOpen ? Colors.red : Colors.grey,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Divider(),
                Padding(
                    padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 1.0),
                    child: new Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        new Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              'Address:',
                              style: TextStyle(
                                  // decoration: TextDecoration.underline,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    )),
                Padding(
                  padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 2.0),
                  child: Text(
                    widget.shopInfo.address,
                    style: TextStyle(),
                  ),
                ),
                Divider(),
                Padding(
                    padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
                    child: new Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        new Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              'Phone Number:',
                              style: TextStyle(
                                  // decoration: TextDecoration.underline,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    )),
                Padding(
                  padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 2.0),
                  child: Text(
                    widget.shopInfo.phone,
                    style: TextStyle(),
                  ),
                ),
                Divider(),
                Stack(
                  children: [
                    Column(
                      children: [
                        Padding(
                            padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
                            child: new Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                new Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Text(
                                      'Book Slot:',
                                      style: TextStyle(
                                          // decoration: TextDecoration.underline,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ],
                            )),
                        Padding(
                          padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 5.0),
                          child: Column(
                            children: [
                              OutlinedButton(
                                onPressed: () {
                                  selectedTime(context);
                                },
                                child: Text("Click Here"),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Time  "),
                                  Text(
                                    '${time.hourOfPeriod}:${time.minute} ${time.period}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.all(8.0),
                        //   child: Center(child: Text("OR",style: TextStyle(
                        //     fontSize: 20,
                        //     fontWeight: FontWeight.bold
                        //   ),)),
                        // ),
                        Padding(
                            padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 5.0),
                            child: new Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Text(
                                  'To Select Pre-Defined Time:',
                                  style: TextStyle(
                                      //decoration: TextDecoration.underline,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Switch(
                                    value: isSwitched,
                                    onChanged: (value) {
                                      setState(() {
                                        isSwitched = value;
                                        print(isSwitched);
                                      });
                                    },
                                    activeTrackColor: Colors.blue,
                                    activeColor: Colors.white,
                                  ),
                                ),
                              ],
                            )),
                        Padding(
                          padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 5.0),
                          child: Visibility(
                            visible: isSwitched,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                        child: OutlinedButton(
                                            onPressed: () {}, child: Text("10:00 AM"))),
                                    SizedBox(
                                      width: 12,
                                    ),
                                    Expanded(
                                        child: OutlinedButton(
                                            onPressed: () {}, child: Text("11:00 AM"))),
                                    SizedBox(
                                      width: 12,
                                    ),
                                    Expanded(
                                        child: OutlinedButton(
                                            onPressed: () {}, child: Text("12:00 PM"))),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                        child: OutlinedButton(
                                            onPressed: () {}, child: Text("01:00 PM"))),
                                    SizedBox(
                                      width: 12,
                                    ),
                                    Expanded(
                                        child: OutlinedButton(
                                            onPressed: () {}, child: Text("02:00 PM"))),
                                    SizedBox(
                                      width: 12,
                                    ),
                                    Expanded(
                                        child: OutlinedButton(
                                            onPressed: () {}, child: Text("03:00 PM"))),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                        child: OutlinedButton(
                                            onPressed: () {}, child: Text("04:00 PM"))),
                                    SizedBox(
                                      width: 12,
                                    ),
                                    Expanded(
                                        child: OutlinedButton(
                                            onPressed: () {}, child: Text("05:00 PM"))),
                                    SizedBox(
                                      width: 12,
                                    ),
                                    Expanded(
                                        child: OutlinedButton(
                                            onPressed: () {}, child: Text("06:00 PM"))),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                        child: OutlinedButton(
                                            onPressed: () {}, child: Text("07:00 PM"))),
                                    SizedBox(
                                      width: 12,
                                    ),
                                    Expanded(
                                        child: OutlinedButton(
                                            onPressed: () {}, child: Text("08:00 PM"))),
                                    SizedBox(
                                      width: 12,
                                    ),
                                    Expanded(
                                        child: OutlinedButton(
                                            onPressed: () {}, child: Text("09:00 PM"))),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 210,
                      width: double.infinity,
                      color: Colors.white70,
                      child: Center(child:
                      Image.asset(
                        "images/comingsoon.png",
                        width: 210,
                        height: 150,
                      )
                      ),
                    ),
                  ],
                ),
                Divider(),
                Padding(
                  padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
                  child: CupertinoButton(
                      color: CupertinoColors.activeBlue.darkColor,
                      child: Text("Book For Hair Cut"),
                      onPressed: () {

                      }),
                )
              ],
            ),
          ),
          Center(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.black38,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 78.0),
                child: Image.asset("images/closed.png"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
