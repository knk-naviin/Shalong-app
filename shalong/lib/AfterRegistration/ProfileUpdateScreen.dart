import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shalong/AfterRegistration/BarberShopUpdatingScreen.dart';
import 'package:shalong/UserAuthentication/AuthManager.dart';

class ProfileUpdateScreen extends StatefulWidget {
  Profile? profile;
  ProfileUpdateScreen({this.profile = null});

  @override
  _ProfileUpdateScreenState createState() => _ProfileUpdateScreenState();
}

class _ProfileUpdateScreenState extends State<ProfileUpdateScreen> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  Profile profile = Profile("", "", "", "", false, []);
  var currentUser = FirebaseAuth.instance.currentUser!;
  CollectionReference userRef = FirebaseFirestore.instance.collection("user");
  CollectionReference shopRef = FirebaseFirestore.instance.collection("shop");
  Future<void> addUserToFirestore() async {
    var uid = currentUser.uid;
    List<String> shopIds = [];
    if (profile.isBarber) {
      for (var aShop in profile.shops) {
        var shop = await shopRef.add({
          "uid": uid,
          "name": aShop.name,
          "address": aShop.address,
          "phone": aShop.phone,
          "is_open": aShop.isOpen,
          "shop_busy": aShop.shopbusy,
          "barber_break": aShop.barberBreak
        });
        shopIds.add(shop.id);
      }
    }

    return userRef.add({
      "uid": uid,
      "name": profile.name,
      "email": profile.email,
      "phone": profile.phone,
      "is_barber": profile.isBarber,
      "shops": shopIds
    }).then((value) {
      Navigator.of(context).pushReplacementNamed("/launch");
    }).catchError((onError) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(title: Text(onError.toString()));
          });
    });
  }

  Widget shopsWidget() {
    if (profile.shops.length > 0) {
      List<Widget> list = [];
      for (var aShop in profile.shops) {
        list.add(Card(
          elevation: 0.5,
          child: ListTile(
            leading: Icon(
              Icons.home_outlined,
              size: 52,
              color: CupertinoColors.activeBlue,
            ),
            title: Text(
              aShop.name,
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),
            ),
            subtitle: Text("Shop Contact"),
            trailing: IconButton(
              icon: Icon(Icons.cancel),
              color: Colors.red,
              onPressed: () {
                setState(() {
                  profile.shops.remove(aShop);
                });
              },
            ),
          ),
        ));
      }
      return Container(
          // color: Colors.red,
          child: Column(
        children: list,
      ));
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Profile Update Screen"),
          centerTitle: true,
          backgroundColor: CupertinoColors.systemBlue,
        ),
        body: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20.0,left: 8,right: 8,bottom: 8),
                  child: TextFormField
                    (
                    initialValue: currentUser.displayName,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter Your Name";
                      }
                    },
                    onSaved: (value) {
                      profile.name = value!;
                    },
                    keyboardType: TextInputType.text,
                    scrollPhysics: ScrollPhysics(),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Enter your name",
                        hintText: "Eg.ShalongApp",
                        prefixIcon: Icon(
                          CupertinoIcons.person_fill,
                          color: CupertinoColors.systemBlue,
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField
                    (
                    initialValue: currentUser.email,
                    validator: (value) => EmailValidator.validate(value!)
                        ? null
                        : "Please enter a valid email",
                    onSaved: (value) {
                      profile.email = value!;
                    },
                    keyboardType: TextInputType.emailAddress,
                    scrollPhysics: ScrollPhysics(),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Enter Email address",
                        hintText: "Eg.Shalong@gmail.com",
                        prefixIcon: Icon(
                          CupertinoIcons.mail_solid,
                          color: CupertinoColors.systemBlue,
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    initialValue: currentUser.phoneNumber,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter phone number";
                      } else if (value.length != 10) {
                        return "Enter Valid Phone Number";
                      }
                    },
                    inputFormatters: [
                      new FilteringTextInputFormatter.allow(
                          new RegExp(r'^[0-9]*$')),
                      new LengthLimitingTextInputFormatter(10)
                    ],
                    onSaved: (value) {
                      profile.phone = value!;
                    },
                    keyboardType: TextInputType.phone,
                    scrollPhysics: ScrollPhysics(),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Enter Phone Number",
                        hintText: "Eg.0987654321",
                        prefixIcon: Icon(
                          CupertinoIcons.phone,
                          color: CupertinoColors.systemBlue,
                        )),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: SizedBox(child: Text("Are you barber?")),
                    ),
                    CupertinoSwitch(
                        activeColor: CupertinoColors.systemBlue,
                        value: profile.isBarber,
                        onChanged: (bool value) {
                          setState(() {
                            profile.isBarber = value;
                          });
                        }),
                  ],
                ),
                Visibility(
                    visible: profile.isBarber,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: SizedBox(child: Text("Shop Information")),
                            ),
                            CupertinoButton(
                              onPressed: () async {
                                if (profile.shops.length == 0) {
                                  ShopInfo shopInfo = await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            BarberShopUpdatingScreen()),
                                  );
                                  setState(() {
                                    profile.shops.add(shopInfo);
                                  });
                                } else {
                                  showDialog(
                                    context: context,
                                    builder: (ctx) => Platform.isIOS
                                        ? CupertinoAlertDialog(
                                            title: Text("Sorry!",
                                                style: TextStyle(
                                                    color: CupertinoColors
                                                        .systemRed)),
                                            content: Text(
                                                "You can add only one shop at this moment"),
                                          )
                                        : AlertDialog(
                                            content: Text(
                                                "You can add only one shop at this moment"),
                                          ),
                                  );
                                }
                              },
                              // icon: FaIcon(FontAwesomeIcons.file),
                              child: Text("Add Shop Details"),
                            ),
                          ],
                        ),
                        shopsWidget()
                      ],
                    )),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: CupertinoButton(
                    child: Text(
                      'Continue',
                      style: TextStyle(fontSize: 23),
                    ),
                    color: CupertinoColors.systemBlue,
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        (formkey.currentState!.save());
                        if (profile.isBarber && profile.shops.length > 0 ||
                            profile.isBarber == false) {
                          addUserToFirestore();
                        } else {
                          showDialog(
                            context: context,
                            builder: (context) => new AlertDialog(
                              title: new Text('Alert'),
                              content: Text('Check Your Data'),
                            ),
                          );
                        }
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
