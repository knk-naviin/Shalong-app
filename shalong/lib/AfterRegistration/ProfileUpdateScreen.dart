import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shalong/UserAuthentication/AuthManager.dart';

class ProfileUpdateScreen extends StatefulWidget {
  Profile? profile;
  ProfileUpdateScreen({this.profile = null});

  @override
  _ProfileUpdateScreenState createState() => _ProfileUpdateScreenState();
}

class _ProfileUpdateScreenState extends State<ProfileUpdateScreen> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  late String shopname, shopaddress, location, name, phone, email;
  bool isBarber = false;
  CollectionReference userRef = FirebaseFirestore.instance.collection("user");
  Future<void> addUser() async {
    var uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid != null)
      return userRef.add({
        "uid": uid,
        "name": name,
        "email": email,
        "phone": phone,
        "is_barber": isBarber,
        // "barbershopname": shopname,
        // "barbershopaddress": shopaddress,
        // "barberlocationurl": location,
      }).then((value) {
        Navigator.of(context).pushReplacementNamed("/barberdashboardscreen");
      }).catchError((onError) {


        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(title: Text(onError.toString()));
            });
      });
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
          actions: [
            IconButton(
              icon: Icon(Icons.exit_to_app_rounded),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (ctx) => Platform.isIOS
                      ? CupertinoAlertDialog(
                          content: Text("Are you sure want to Logout? \n" + ""),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.of(ctx).pop();
                                },
                                child: Text("Cancel")),
                            TextButton(
                                onPressed: () {
                                  signout().then((value) =>
                                      Navigator.of(context)
                                          .pushReplacementNamed("/launch"));
                                },
                                child: Text("Logout")),
                          ],
                        )
                      : AlertDialog(
                          title: Text('Are you sure want to Logout?'),
                          content: const Text('AlertDialog description'),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.of(ctx).pop();
                                },
                                child: Text("Cancel")),
                            TextButton(
                                onPressed: () {
                                  signout().then((value) =>
                                      Navigator.of(context)
                                          .pushReplacementNamed("/launch"));
                                },
                                child: Text("Logout")),
                          ],
                        ),
                );
              },
            )
          ],
        ),
        body: Form(
          key: formkey,
          child: Column(
            children: [
              SizedBox(
                height: 100,
                width: 400,
                child: Center(
                  heightFactor: 1,
                  child: TextFormField(
                    onSaved: (value) {
                      name = value!;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter Your Name";
                      }
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
              ),
              SizedBox(
                height: 100,
                width: 400,
                child: Center(
                  heightFactor: 1,
                  child: TextFormField(
                    onSaved: (value) {
                      email = value!;
                    },
                    validator: (value) => EmailValidator.validate(value!)
                        ? null
                        : "Please enter a valid email",
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
              ),
              SizedBox(
                height: 100,
                width: 400,
                child: Center(
                  heightFactor: 1,
                  child: TextFormField(
                    onSaved: (value) {
                      phone = value!;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter phone number";
                      } else if (value.length != 10) {
                        return "Enter Valid Phone Number";
                      }
                    },
                    inputFormatters: [
                      new WhitelistingTextInputFormatter(
                          new RegExp(r'^[0-9]*$')),
                      new LengthLimitingTextInputFormatter(10)
                    ],
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
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: SizedBox(child: Text("Are you barber?")),
                  ),
                  CupertinoSwitch(
                      activeColor: CupertinoColors.systemBlue,
                      value: isBarber,
                      onChanged: (bool value) {
                        setState(() {
                          isBarber = value;
                        });
                      }),
                ],
              ),
              Visibility(
                  visible: isBarber == true ? true : false,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: SizedBox(
                          width: 400,
                          child: TextFormField(
                            onSaved: (value) {
                              shopname = value!;
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter your shop name";
                              }
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "Enter Shop Name",
                                hintText: "Eg.Salong Saloon",
                                prefixIcon: Icon(
                                  CupertinoIcons.home,
                                  color: CupertinoColors.systemBlue,
                                )),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 100,
                        width: 400,
                        child: Center(
                          heightFactor: 1,
                          child: TextFormField(
                            onTap: () {
                              FocusScopeNode currentFocus =
                                  FocusScope.of(context);
                            },
                            onSaved: (value) {
                              location = value!;
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter Google map location url";
                              } else if (value.contains ==
                                  'https://www.google.co.in/maps/place/') {
                                return "Enter Correct URL";
                              }
                            },
                            keyboardType: TextInputType.url,
                            scrollPhysics: ScrollPhysics(),
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "Enter Location Url",
                                hintText: "Eg.https://google/maps",
                                prefixIcon: Icon(
                                  CupertinoIcons.location,
                                  color: CupertinoColors.systemBlue,
                                )),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 140,
                        width: 400,
                        child: Center(
                          heightFactor: 1,
                          child: TextFormField(
                            maxLines: 140,
                            minLines: 1,
                            onSaved: (value) {
                              shopaddress = value!;
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter Shop Address";
                              }
                            },
                            keyboardType: TextInputType.multiline,
                            autocorrect: false,
                            scrollPhysics: ScrollPhysics(),
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "Enter Shop Address",
                                hintText:
                                    "Eg.Yaash school,234 A,Seetharamdos Nagar "
                                    "Jakkampatti,BSNL Office,Theni,Tamilnadu,625512,India",
                                prefixIcon: Icon(
                                  CupertinoIcons.house,
                                  color: CupertinoColors.systemBlue,
                                )),
                          ),
                        ),
                      ),
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
                      print("usertype saved $isBarber");
                      addUser();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
