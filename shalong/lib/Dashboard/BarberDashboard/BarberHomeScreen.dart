import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shalong/Dashboard/BarberDashboard/BarberAccountInfoScreen.dart';
import 'package:shalong/UserAuthentication/AuthManager.dart';

class BarberHomeScreen extends StatefulWidget {
  final Index;
  const BarberHomeScreen(this.Index, {Key? key}) : super(key: key);

  @override
  _BarberHomeScreenState createState() => _BarberHomeScreenState();
}

class _BarberHomeScreenState extends State<BarberHomeScreen> {
  Profile? profileInfo;

  bool ShopBusy = false;
  bool shopOpen = false;
  bool Barberbreak = false;
  // TextEditingController editingController = TextEditingController();

  void updateShopStatus() {
    var shop = profileInfo!.shops.first;
    shop.isOpen = shopOpen;
    shop.shopbusy = ShopBusy;
    setShopStatus(shop);
  }

  var photo = FirebaseAuth.instance.currentUser!.photoURL;
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
          leading: IconButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      scrollable: true,
                      // titlePadding: EdgeInsetsGeometry.infinity,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      title: Center(
                        child: Text(
                          "Stay Tuned!",
                          style: TextStyle(
                              color: CupertinoColors.destructiveRed),
                        ),
                      ),
                      content: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("FAQ ",style: TextStyle(
                                fontWeight: FontWeight.bold
                              ),),
                              Text("with Customer")
                            ],
                          ),
                          Text("Coming soon....",style: TextStyle(
                              fontSize: 10,
                              color: CupertinoColors.systemGrey
                          ),)
                        ],
                      ),
                    );
                  });
            },
            icon: Icon(Icons.feedback),
          ),
          centerTitle: true,
          backgroundColor: Colors.white10,
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient:
                    LinearGradient(colors: [Colors.grey, Colors.black26])),
          ),
          elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BarberAccountInfoScreen()),
                  );
                },
                child: CircleAvatar(
                    radius: 20, backgroundImage: NetworkImage(photo!)),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 100,
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                          gradient: LinearGradient(
                              colors: [Colors.grey, Colors.black26])),
                      child: Column(
                        children: [

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Flexible(
                                child: Text(
                                  "Hi ",
                                  style: TextStyle(
                                    fontSize: 23,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              
                              Flexible(
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
                        ],
                      ),
                    ),
                    Positioned(
                        bottom: 10,
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
                                Expanded(
                                  flex: 5,
                                  child: Text(
                                    shopOpen == false
                                        ? " Open Your Shop "
                                        : "Close Your Shop ",
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                // SizedBox(
                                //   width: 50,
                                // ),
                                Expanded(
                                  child: CupertinoSwitch(
                                      value: shopOpen,
                                      onChanged: (bool value) {
                                        setState(() {
                                          shopOpen = value;
                                          if (ShopBusy == false &&
                                              Barberbreak == false) {
                                            setState(() {
                                              Barberbreak = true;
                                            });
                                          }
                                        });
                                        var shop = profileInfo!.shops.first;
                                        shop.isOpen = shopOpen;
                                        shop.shopbusy = ShopBusy;
                                        shop.barberBreak = Barberbreak;
                                        setShopStatus(shop);
                                      }),
                                )
                              ],
                            ))),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Visibility(
                  visible: shopOpen,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 250.0),
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
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
                                  shop.barberBreak = Barberbreak;
                                  setShopStatus(shop);
                                }),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: Card(
                          child: ListTile(
                            subtitle: Text(
                                "PLease Notify to your customer,  that you are in break"),
                            title: Text(
                              "You want break?",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                            trailing: CupertinoSwitch(
                                activeColor: CupertinoColors.destructiveRed,
                                value: Barberbreak,
                                onChanged: (bool value) {
                                  setState(() {
                                    Barberbreak = value;
                                  });
                                  var shop = profileInfo!.shops.first;
                                  shop.barberBreak = Barberbreak;
                                  shop.shopbusy = ShopBusy;
                                  setShopStatus(shop);
                                }),
                          ),
                        ),
                      ),
                      Visibility(
                          visible: ShopBusy,
                          child: Image.asset(
                            "images/barberbusy.jpeg",
                            width: 350,
                          )),
                      Visibility(
                          visible: Barberbreak,
                          child: Image.network(
                            "https://media.istockphoto.com/vectors/coffee-break-icon-in-comic-style-clock-with-tea-cup-cartoon-vector-vector-id1220277783?k=20&m=1220277783&s=612x612&w=0&h=z5lWteYVHK5wN9TOAdoN5QZgv2bfH0qc8ivjxe7hozw=",
                            width: 350,
                          ))
                    ]),
                  ))
            ],
          ),
        ),
      );
    }
  }
}
