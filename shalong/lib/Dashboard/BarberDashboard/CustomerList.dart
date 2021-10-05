import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomerList extends StatefulWidget {
  const CustomerList({Key? key}) : super(key: key);

  @override
  _CustomerListState createState() => _CustomerListState();
}

class _CustomerListState extends State<CustomerList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius:
            BorderRadius.circular(18), // if you need this
            side: BorderSide(
              style: BorderStyle.solid,
              color: CupertinoColors.activeGreen,
              width: 1,
            ),
          ),
        borderOnForeground: true,
        elevation: 0,
        child: Container(
          // decoration: BoxDecoration(
          //   borderRadius: BorderRadius.circular(15),
          //   gradient: LinearGradient(
          //     // begin: Alignment.topRight,
          //     // end: Alignment.bottomLeft,
          //
          //     colors: [
          //       Colors.red.shade500.withOpacity(0.85),
          //       Colors.deepOrange.shade500.withOpacity(0.85)
          //     ],
          //   ),
          // ),
          width: double.infinity,
          height: 200,
          child: Column(

            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Customer Name",style: TextStyle(
                        fontSize: 20,
                        letterSpacing: 2,
                        wordSpacing: 2,
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                    ),),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0,left: 8.0),
                    child: Text("1234567890",style: TextStyle(
                        fontSize: 20,
                        letterSpacing: 2,
                        wordSpacing: 2,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400
                    )),
                  ),

                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0,right: 8.0,left: 8.0,bottom: 8.0),
                    child: Text("shalong@gmail.com",style: TextStyle(
                        fontSize: 20,
                        letterSpacing: 2,
                        wordSpacing: 2,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400
                    )),
                  ),

                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0,left: 8.0),
                    child: Text("Customer Waiting",style: TextStyle(
                        fontSize: 22,
                        letterSpacing: 6,
                        wordSpacing: 4,
                        color: CupertinoColors.white,
                        backgroundColor: CupertinoColors.systemRed,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400
                    )),
                  ),
                ],
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MaterialButton(
                        color: CupertinoColors.systemBlue,
                        onPressed: (){},
                        child: Text("Done!"),
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      MaterialButton(
                        color: CupertinoColors.destructiveRed,
                        onPressed: (){},
                        child: Text("Cancel!"),
                      ),
                    ],
                  ),
                ),
              ),

            ],
          ),
      )
    ));
  }
}

