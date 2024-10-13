import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../UserAuthentication/AuthManager.dart';
import 'RatingScreen.dart';
import 'ReviewsScreen.dart';

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
  Rating? rating;

  List<Rating> ratings;
  ShopPageScreen(this.shopInfo, this.ratings);

  @override
  _ShopPageScreenState createState() => _ShopPageScreenState();
}

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

    setState(() {
      time = picked;
    });
  }

  Rating? myRating() {
    List<Rating>? ratings = widget.ratings
        .where(
            (element) => element.uid == FirebaseAuth.instance.currentUser?.uid)
        .toList();

    return ratings.length > 0 ? ratings.first : null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Shop Details",
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.lightBlueAccent, Colors.blue])),
        ),
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: widget.shopInfo.isOpen
          ? Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        widget.shopInfo.name,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Text(
                        'Status of Barber:',
                        style: TextStyle(
                            // decoration: TextDecoration.underline,
                            fontSize: 18.0,
                            color: CupertinoColors.systemGrey
                            //fontWeight: FontWeight.bold
                            ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        (() {
                          if (widget.shopInfo.shopbusy == true) {
                            return "Barber is Busy Now";
                          } else if (widget.shopInfo.barberBreak == true) {
                            return "Barber is rest now";
                          } else if (widget.shopInfo.shopbusy == false &&
                              widget.shopInfo.barberBreak == false) {
                            return "Shop is free now";
                          } else {
                            return "null";
                          }
                        })(),
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                // Divider(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          'Address:',
                          style: TextStyle(
                              // decoration: TextDecoration.underline,
                              fontSize: 18.0,
                              color: CupertinoColors.systemGrey
                              //fontWeight: FontWeight.bold
                              ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          widget.shopInfo.address,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            // fontWeight: FontWeight.w600
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Divider(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Phone:',
                          style: TextStyle(
                              // decoration: TextDecoration.underline,
                              fontSize: 18.0,
                              color: CupertinoColors.systemGrey
                              //fontWeight: FontWeight.bold
                              ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          widget.shopInfo.phone,
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Overall Rating:',
                    style: TextStyle(
                        // decoration: TextDecoration.underline,
                        fontSize: 22.0,
                        color: CupertinoColors.systemGrey
                        //fontWeight: FontWeight.bold
                        ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IgnorePointer(
                    child: RatingBar.builder(
                      initialRating:
                          averageRatingFrom(widget.ratings).toDouble(),
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => Icon(
                        CupertinoIcons.star_fill,
                        color: CupertinoColors.systemBlue,
                      ),
                      glow: false,
                      onRatingUpdate: (ratingValue) {
                        // rating.value = ratingValue.toInt();
                      },
                    ),
                  ),
                ),
                // Divider(),
                Padding(
                  padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
                  child: CupertinoButton(
                      color: CupertinoColors.activeBlue.darkColor,
                      child: Text("Rate Here"),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    RatingScreen(widget.shopInfo, myRating())));
                      }),
                ),
                Divider(),
                Container(
                  width: 350,
                  child: Card(
                    // elevation: 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Reviews",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ),
                          alignment: Alignment.topCenter,
                        ),
                        Divider(),
                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              widget.ratings.length > 0
                                  ? widget.ratings.first.review
                                  : "No rating yet",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topCenter,
                          child: Text(widget.ratings.length > 0
                              ? widget.ratings.first.feedback
                              : "No rating yet"),
                        ),
                        Align(
                          alignment: Alignment.topCenter,
                          child: CupertinoButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ReviewScreen(widget.ratings)),
                              );
                            },
                            child: Text("Show All"),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            )
          : Stack(
              children: [
                IgnorePointer(
                  ignoringSemantics: true,
                  ignoring: widget.shopInfo.isOpen ? false : true,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(
                              widget.shopInfo.name,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              'Address:',
                              style: TextStyle(
                                  // decoration: TextDecoration.underline,
                                  fontSize: 18.0,
                                  color: CupertinoColors.systemGrey
                                  //fontWeight: FontWeight.bold
                                  ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              widget.shopInfo.address,
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                // fontWeight: FontWeight.w600
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Text(
                              'Phone:',
                              style: TextStyle(
                                  // decoration: TextDecoration.underline,
                                  fontSize: 18.0,
                                  color: CupertinoColors.systemGrey
                                  //fontWeight: FontWeight.bold
                                  ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              widget.shopInfo.phone,
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Overall Rating:',
                          style: TextStyle(
                              // decoration: TextDecoration.underline,
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: IgnorePointer(
                          child: RatingBar.builder(
                            initialRating: 1,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: false,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                            itemBuilder: (context, _) => Icon(
                              CupertinoIcons.star_fill,
                              color: CupertinoColors.systemBlue,
                            ),
                            glow: false,
                            onRatingUpdate: (ratingValue) {
                              // rating.value = ratingValue.toInt();
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
                        child: CupertinoButton(
                            color: CupertinoColors.activeBlue.darkColor,
                            child: Text("Rate Here"),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => RatingScreen(
                                          widget.shopInfo, myRating())));
                            }),
                      ),
                      Container(
                        width: 350,
                        child: Card(
                          // elevation: 0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Reviews",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                ),
                                alignment: Alignment.topCenter,
                              ),
                              Divider(),
                              Align(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    widget.ratings.length > 0
                                        ? widget.ratings.first.review
                                        : "No rating yet",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.black),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topCenter,
                                child: Text(widget.ratings.length > 0
                                    ? widget.ratings.first.feedback
                                    : "No rating yet"),
                              ),
                              Align(
                                alignment: Alignment.topCenter,
                                child: CupertinoButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ReviewScreen(widget.ratings)),
                                    );
                                  },
                                  child: Text("Show All"),
                                ),
                              )
                            ],
                          ),
                        ),
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
