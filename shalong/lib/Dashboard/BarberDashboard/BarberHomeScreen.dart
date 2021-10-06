import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shalong/UserAuthentication/AuthManager.dart';

import 'CustomerList.dart';

class BarberHomeScreen extends StatefulWidget {
  const BarberHomeScreen({Key? key}) : super(key: key);

  @override
  _BarberHomeScreenState createState() => _BarberHomeScreenState();
}

class _BarberHomeScreenState extends State<BarberHomeScreen> {
  Profile? profileInfo;
  bool ShopBusy = false;
  bool shopOpen = true;
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
            onPressed: () {},
            color: Colors.white,
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                width: 440,
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
                                    "Hi '",
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
                                  'Is Shop is Open ?',
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

                                          });
                                          var shop = profileInfo!.shops.first;
                                          shop.isOpen = shopOpen;

                                          setShopStatus(shop);
                                        }))
                              ],
                            ))),
                  ],
                ),
              ),
              Visibility(
                visible: shopOpen,
                child: Padding(
                  padding:
                  const EdgeInsets.only(top: 18.0, left: 8.0, right: 8.0),
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
                  child: Card(
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
                ),
              )
            ],
          ),
        ),
      );
    }
  }
}
