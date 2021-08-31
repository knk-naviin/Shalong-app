import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class BarberScreen extends StatefulWidget {
  const BarberScreen({Key? key}) : super(key: key);

  @override
  _BarberScreenState createState() => _BarberScreenState();
}


class _BarberScreenState extends State<BarberScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shalong"),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Center(
            child: Column(children: [
              SizedBox(
                width: 400,
                child: Center(
                  heightFactor: 4,
                  child: TextFormField(
                    onSaved: (value) {},
                    keyboardType: TextInputType.text,
                    obscureText: false,
                    scrollPhysics: ScrollPhysics(),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Enter Your Shop name",
                        prefixIcon: Icon(
                          CupertinoIcons.house,
                          color: CupertinoColors.systemBlue,
                        )),
                  ),
                ),
              ),

              // phone
              SizedBox(
                width: 400,
                child: Center(
                  heightFactor: 0,
                  child: TextFormField(
                    onSaved: (value) {},
                    keyboardType: TextInputType.text,
                    obscureText: false,
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

              // address
              SizedBox(
                //height:600,
                width: 400,
                child: Center(
                  heightFactor: 4,
                  child: TextFormField(
                    onSaved: (value) {},
                    keyboardType: TextInputType.streetAddress,
                    obscureText: false,
                    scrollPhysics: ScrollPhysics(),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Enter Your address",
                        prefixIcon: Icon(
                          CupertinoIcons.text_justifyleft,
                          color: CupertinoColors.systemBlue,
                        )),
                  ),
                ),
              ),

              // location
              SizedBox(
                width: 400,
                child: Center(
                  heightFactor: 0,
                  child: TextFormField(
                    onTap: (){

                    },
                    onSaved: (value) {},
                    keyboardType: TextInputType.text,
                    obscureText: false,
                    scrollPhysics: ScrollPhysics(),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Enter location",
                        prefixIcon: Icon(
                          CupertinoIcons.location,
                          color: CupertinoColors.systemBlue,
                        )),
                  ),
                ),
              ),

              Center(
                heightFactor: 4,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text("Next"),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)),
                    onPrimary: Colors.white,
                    primary: Colors.blue,
                    onSurface: Colors.grey,
                    // side: BorderSide(color: Colors.black12, width: 1),
                    // elevation: 3,
                    minimumSize: Size(150, 50),

                  ),
                ),
              )
            ]
                

            ),
          ),
        ),
      ),
    );
  }
}
