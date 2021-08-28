import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shalong/Dashboard/BarberScreen.dart';
import 'package:shalong/Dashboard/CustomerScreen.dart';
import 'package:shalong/UserAuthentication/AuthManager.dart';

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
        // drawer: Drawer(
        //   elevation: 10.0,
        //   child: ListView(
        //     children: <Widget>[
        //       UserAccountsDrawerHeader(
        //         accountName: Text("Welcome " +
        //             widget.profile.firstName +
        //             " " +
        //             widget.profile.lastName),
        //         accountEmail: Text(widget.profile.email),
        //       ),
        //     ],
        //   ),
        // ),
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
                          FirebaseAuth.instance.signOut();
                          Navigator.of(context).pushReplacementNamed("/launch");
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CustomerScreen()),
                  );
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
