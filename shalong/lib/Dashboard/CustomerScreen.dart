import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


class CustomerScreen extends StatefulWidget {

  const CustomerScreen({Key? key}) : super(key: key);

  @override
  _CustomerScreenState createState() => _CustomerScreenState();
}

class _CustomerScreenState extends State<CustomerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: Text("Customer Screen"),
        actions: [
          IconButton(
              onPressed: () {

                showDialog(context: context, builder: (ctx)=>
                    AlertDialog(content: Text("Are you sure want to Logout? \n"+""),actions: [
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
    );
  }
}