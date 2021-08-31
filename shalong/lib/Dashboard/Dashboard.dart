import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shalong/Dashboard/BarberScreen.dart';
import 'package:shalong/UserAuthentication/AuthManager.dart';


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shalong/UserAuthentication/AuthManager.dart';

class DashboardScreen extends StatefulWidget {

  Profile profile;
  DashboardScreen(this.profile, {Key? key}) : super(key: key);
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  bool showBarberWidget = false;
  bool showCxWidget = false;

  Widget barberWidget() {
    return Flexible(child: Container(color: Colors.white,child: Column(
      children: [
        SizedBox(
          height: 100,
          width: 400,
          child: Center(
            heightFactor: 1,
            child: TextFormField(
              onSaved: (value) {},
              keyboardType: TextInputType.text,
              scrollPhysics: ScrollPhysics(),
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Enter Your shop",
                  prefixIcon: Icon(
                    CupertinoIcons.house,
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
              onSaved: (value) {},
              keyboardType: TextInputType.phone,
              scrollPhysics: ScrollPhysics(),
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Enter Your Phone",
                  prefixIcon: Icon(
                    CupertinoIcons.phone,
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
              onSaved: (value) {},
              keyboardType: TextInputType.streetAddress,
              scrollPhysics: ScrollPhysics(),
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Enter Your address",
                  prefixIcon: Icon(
                    CupertinoIcons.doc_plaintext,
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
              onTap: (){

              },
              onSaved: (value) {},
              keyboardType: TextInputType.url,
              scrollPhysics: ScrollPhysics(),
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Enter Your location",
                  prefixIcon: Icon(
                    CupertinoIcons.location,
                    color: CupertinoColors.systemBlue,
                  )),
            ),
          ),
        ),

        ElevatedButton(
          child: Text("continue"),
          style: ElevatedButton.styleFrom(
            onPrimary: Colors.white,
            primary: Colors.blue,
            elevation: 2,
            minimumSize: Size(150,50),
            shadowColor: Colors.teal,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          ),
          onPressed:() {

          },
        )

      ],
    ),));
  }

  Widget customerWidget() {
    return Flexible(child: Container(
        child: Column(
          children: [
            SizedBox(
              height: 100,
              width: 400,
              child: Center(
                heightFactor: 10,
                child: TextFormField(
                  onTap: (){

                  },
                  onSaved: (value) {},
                  keyboardType: TextInputType.url,
                  scrollPhysics: ScrollPhysics(),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Select Your location",
                      prefixIcon: Icon(
                        CupertinoIcons.location,
                        color: CupertinoColors.systemBlue,
                      )),
                ),
              ),
            ),

            ElevatedButton(
              child: Text("continue"),
              style: ElevatedButton.styleFrom(
                onPrimary: Colors.white,
                primary: Colors.blue,
                elevation: 2,
                minimumSize: Size(150,50),
                shadowColor: Colors.teal,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              ),
              onPressed:() {

              },
            )

          ],
        )

    ));
  }

  @override
  Widget build(BuildContext context) {
    // var email = FirebaseAuth.instance.currentUser?.email;
    // if (email == null) {
    //   email = "Guest";
    // }

    Widget bottomWidget;
    if (showBarberWidget) {
      bottomWidget = barberWidget();
    } else if (showCxWidget) {
      bottomWidget = customerWidget();
    }  else {
      bottomWidget = Container();
    }

    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          title: Text("Shalong"),
          actions: [
            IconButton(
                onPressed: () {

                  showDialog(context: context, builder: (ctx)=>
                      AlertDialog(content: Text("Are you sure want to Logout? \n"+ widget.profile.email),actions: [
                        TextButton(onPressed: (){
                          Navigator.of(ctx).pop();
                        }, child: Text("Cancel")),
                        TextButton(onPressed: (){
                          Navigator.of(ctx).pop();
                          signout().then((value) => Navigator.pushReplacementNamed(context, "/launch"));
                        }, child: Text("Logout")),
                      ],));
                  // FirebaseAuth.instance.signOut();
                  // Navigator.of(context).pushReplacementNamed("/launch");
                },
                icon: Icon(Icons.logout))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          showCxWidget = false;
                          showBarberWidget = true;
                        });
                      },
                      child: Text("I am a Barber"),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)),
                        onPrimary: Colors.white,
                        primary: Colors.blue,
                        onSurface: Colors.grey,
                        // side: BorderSide(color: Colors.black12, width: 1),
                        // elevation: 3,
                        // minimumSize: Size(290, 60),

                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  //Customer Button
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          showBarberWidget = false;
                          showCxWidget = true;

                        });
                      },
                      child: Text("I am a Customer"),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)),
                        onPrimary: Colors.white,
                        primary: Colors.blue,
                        onSurface: Colors.grey,
                        // side: BorderSide(color: Colors.black12, width: 1),
                        // elevation: 3,
                        // minimumSize: Size(290, 60),
                      ),
                    ),
                  ),
                ],
              ),
              bottomWidget
            ],
          ),
        )

    );
  }
}

/*
class DashboardScreen extends StatefulWidget {
  Profile profile;
  // DashboardScreen({Key? key}) : super(key: key);
  DashboardScreen(this.profile, {Key? key}) : super(key: key);
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          title: Text("Shalong"),
          actions: [
            IconButton(
                onPressed: () {

                  showDialog(context: context, builder: (ctx)=>
                      AlertDialog(content: Text("Are you sure want to Logout? \n"+ widget.profile.email),actions: [
                        TextButton(onPressed: (){
                          Navigator.of(ctx).pop();
                        }, child: Text("Cancel")),
                        TextButton(onPressed: (){
                          Navigator.of(ctx).pop();
                          signout().then((value) => Navigator.pushReplacementNamed(context, "/launch"));
                        }, child: Text("Logout")),
                      ],));
                  // FirebaseAuth.instance.signOut();
                  // Navigator.of(context).pushReplacementNamed("/launch");
                },
                icon: Icon(Icons.logout))
          ],
        ),
        body: Column(
          children: [
            Center(
              heightFactor: 6,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BarberScreen()),
                  );
                },
                child: Text("I am a Barber"),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)),
                  onPrimary: Colors.white,
                  primary: Colors.blue,
                  onSurface: Colors.grey,
                  // side: BorderSide(color: Colors.black12, width: 1),
                  // elevation: 3,
                  minimumSize: Size(290, 60),

                ),
              ),
            ),

            //Customer Button
            Center(
              heightFactor: 3,
              child: ElevatedButton(
                onPressed: () {

                },
                child: Text("I am a Customer"),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)),
                  onPrimary: Colors.white,
                  primary: Colors.blue,
                  onSurface: Colors.grey,
                  // side: BorderSide(color: Colors.black12, width: 1),
                  // elevation: 3,
                  minimumSize: Size(290, 60),

                ),
              ),
            ),
          ],
        )

    );
  }
}
*/