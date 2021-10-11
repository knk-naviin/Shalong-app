import 'dart:io';

import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shalong/Dashboard/BarberDashboard/BarberDashBoardScreen.dart';
import 'package:shalong/UserAuthentication/AuthManager.dart';

import 'CustomerList.dart';

class BarberHomeScreen extends StatefulWidget {
  final Index;
  const BarberHomeScreen(this.Index,{Key? key}) : super(key: key);


  @override
  _BarberHomeScreenState createState() => _BarberHomeScreenState();
}

class _BarberHomeScreenState extends State<BarberHomeScreen> {
  Profile? profileInfo;

  bool ShopBusy = false;
  bool shopOpen = false;
  TextEditingController editingController = TextEditingController();


  void updateShopStatus() {
    var shop = profileInfo!.shops.first;
    shop.isOpen = shopOpen;
    shop.shopbusy = ShopBusy;
    setShopStatus(shop);
  }

  void initState() {
    super.initState();
    profile().then((value) => {
          setState(() {
            shopOpen = value!.shops.first.isOpen;
            ShopBusy = value.shops.first.shopbusy;
            profileInfo = value;
          })
        });
  }

  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();
  @override
  Widget build(BuildContext context) {
    if (profileInfo == null) {
      return Scaffold(
        backgroundColor: Colors.black.withOpacity(0.5),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Platform.isAndroid
                ? CircularProgressIndicator()
                : CupertinoActivityIndicator(
                    animating: true,
                  ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Loading"),
            )
          ],
        )),
      );
    } else {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white10,
          title: Text(
            "Shalong",
            style: TextStyle(
                fontSize: 51, fontFamily: "SourceCodePro", color: Colors.white),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient:
                    LinearGradient(colors: [Colors.grey, Colors.black26])),
          ),
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.widgets),
            onPressed: () {
               print(BarberDashboardScreen());
              showGeneralDialog(
                  // barrierColor: Colors.black.withOpacity(0.5),
                  transitionBuilder: (context, a1, a2, widget) {
                    return Transform.scale(
                      scale: a1.value,
                      child: Opacity(
                        opacity: a1.value,
                        child: AlertDialog(
                          shape: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                          title: Center(
                            child: Text(
                              'Stay Tuned!',
                              style: TextStyle(
                                  color: CupertinoColors.destructiveRed),
                            ),
                          ),
                          content: Text(
                            "Advanced Option Coming Soon",
                            style: TextStyle(color: CupertinoColors.systemGrey),
                          ),
                        ),
                      ),
                    );
                  },
                  transitionDuration: Duration(milliseconds: 200),
                  barrierDismissible: true,
                  barrierLabel: '',
                  context: context,
                  pageBuilder: (context, animation1, animation2) {
                    return Text("");
                  });
            },
            color: Colors.white,
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 200,
                child: Stack(
                  children: [
                    Container(
                      width: 440,
                      height: 180,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(36),
                            bottomRight: Radius.circular(36),
                          ),
                          gradient: LinearGradient(
                              colors: [Colors.grey, Colors.black26])),
                      child: Column(
                        children: [
                          Text(
                            "Welcomes you",
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: "fonts/TrajanPro.ttf",
                                color: Colors.white),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 38.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                  child: Text(
                                    "Hi ",
                                    style: TextStyle(
                                      fontSize: 23,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 12,
                                ),
                                Center(
                                  child: Text(
                                    "${profileInfo!.name}",
                                    style: TextStyle(
                                        fontSize: 23,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 20.0),
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            height: 54,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                      offset: Offset(0, 10),
                                      blurRadius: 50,
                                      color: Colors.blue.withOpacity(0.23))
                                ]),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  shopOpen == false
                                      ? " Open Up Your Shop Here "
                                      : "Close Up Your Shop Here ",
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 50,
                                ),
                                Expanded(
                                    child: CupertinoSwitch(
                                        value: shopOpen,
                                        onChanged: (bool value) {
                                          setState(() {
                                            shopOpen = value;
                                            if (shopOpen == false) {
                                              cardKey.currentState!
                                                  .toggleCard();
                                            } else if (shopOpen == true) {
                                              cardKey.currentState!
                                                  .toggleCard();
                                            }
                                            if (ShopBusy == true) {
                                              setState(() {
                                                ShopBusy = false;
                                              });
                                              // showDialog(
                                              //     context: context,
                                              //     builder:
                                              //         (BuildContext context) {
                                              //       return AlertDialog(
                                              //         title: Center(
                                              //           child: Text(
                                              //             "Alert!",
                                              //             style: TextStyle(
                                              //                 color: CupertinoColors
                                              //                     .destructiveRed),
                                              //           ),
                                              //         ),
                                              //         content: Text(
                                              //           "You Cant Close the shop at this moment",
                                              //           style: TextStyle(
                                              //               color:
                                              //                   CupertinoColors
                                              //                       .systemGrey),
                                              //         ),
                                              //       );
                                              //     });
                                            }
                                          });
                                          var shop = profileInfo!.shops.first;
                                          shop.isOpen = shopOpen;
                                          shop.shopbusy = ShopBusy;
                                          setShopStatus(shop);
                                        }))
                              ],
                            ))),
                  ],
                ),
              ),
              FlipCard(
                  direction: FlipDirection.HORIZONTAL,
                  key: cardKey,
                  flipOnTouch: false,
                  front: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                          height: 532,
                          color: Colors.red,
                          child: Image.asset(
                            "images/shutterimage.jpeg",
                            fit: BoxFit.cover,
                          )),
                      Center(
                        child: Image.network(
                          "https://www.pngall.com/wp-content/uploads/4/Sorry-We-Are-Closed-Transparent.png",
                          width: 250,
                          fit: BoxFit.fill,
                        ),
                      )
                    ],
                  ),
                  back: Padding(
                    padding: const EdgeInsets.only(bottom: 250.0),
                    child: Column(children: [
                      Card(
                        child: ListTile(
                          subtitle: Text(
                              "PLease Notify to your customer, that you are busy or not"),
                          title: Text(
                            "Are You Busy?",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          trailing: CupertinoSwitch(
                              activeColor: CupertinoColors.destructiveRed,
                              value: ShopBusy,
                              onChanged: (bool value) {
                                setState(() {
                                  ShopBusy = value;
                                });
                                var shop = profileInfo!.shops.first;
                                shop.shopbusy = ShopBusy;
                                setShopStatus(shop);
                              }),
                        ),
                      ),
                      // Card(
                      //   child: ListTile(
                      //     subtitle: Text(
                      //         "PLease Notify to your customer, you are in interval or not"),
                      //     title: Text(
                      //       "Are You Busy?",
                      //       style: TextStyle(
                      //           fontSize: 25, fontWeight: FontWeight.bold),
                      //     ),
                      //     trailing: CupertinoSwitch(
                      //         activeColor: CupertinoColors.destructiveRed,
                      //         value: ShopBusy,
                      //         onChanged: (bool value) {
                      //           setState(() {
                      //             ShopBusy = value;
                      //           });
                      //           var shop = profileInfo!.shops.first;
                      //           shop.shopbusy = ShopBusy;
                      //           setShopStatus(shop);
                      //         }),
                      //   ),
                      // ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 68.0),
                          child: Visibility(
                              visible: ShopBusy,
                              child: Image.asset("images/barberbusy.jpg")),
                        ),
                      )
                    ]),
                  )),
              // Visibility(
              //   visible: shopOpen,
              //   child: Padding(
              //     padding:
              //         const EdgeInsets.only(top: 18.0, left: 8.0, right: 8.0),
              // child: CustomerList(),
              //   child: Column(
              //     children: [
              //       Row(
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         children: [
              //           Text("Are You Busy?",style: TextStyle(
              //             fontSize: 25,
              //             fontWeight: FontWeight.bold
              //           ),),
              //           CupertinoSwitch(
              //             value: ShopBusy,
              //               onChanged: (bool value) {
              //                 setState(() {
              //                   ShopBusy = value;
              //                 });
              //                 var shop = profileInfo!.shops.first;
              //                 shop.shopbusy = ShopBusy;
              //                 setShopStatus(shop);
              //               }
              //           )
              //         ],
              //       )
              //     ],
              //   ),
              // child: Card(
              //   child: ListTile(
              //     subtitle: Text(
              //         "PLease Notify to your customer, that you are busy or not"),
              //     title: Text(
              //       "Are You Busy?",
              //       style: TextStyle(
              //           fontSize: 25, fontWeight: FontWeight.bold),
              //     ),
              //     trailing: CupertinoSwitch(
              //         activeColor: CupertinoColors.destructiveRed,
              //         value: ShopBusy,
              //         onChanged: (bool value) {
              //           setState(() {
              //             ShopBusy = value;
              //           });
              //           var shop = profileInfo!.shops.first;
              //           shop.shopbusy = ShopBusy;
              //           setShopStatus(shop);
              //         }),
              //   ),
              // ),
              //),
              // )
            ],
          ),
        ),
      );
    }
  }
}
