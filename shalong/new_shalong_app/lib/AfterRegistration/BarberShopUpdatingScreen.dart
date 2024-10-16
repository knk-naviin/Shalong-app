import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../UserAuthentication/AuthManager.dart';

class BarberShopUpdatingScreen extends StatefulWidget {
  // const BarberShopUpdatingScreen({Key? key}) : super(key: key);
  ShopInfo? shopInfo;
  BarberShopUpdatingScreen({this.shopInfo});
  @override
  _BarberShopUpdatingScreenState createState() =>
      _BarberShopUpdatingScreenState();
}

class _BarberShopUpdatingScreenState extends State<BarberShopUpdatingScreen> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  ShopInfo shopInfo = ShopInfo(
    "",
    "",
    "",
    "",
    false,
    true,
    false
  );

  @override
  Widget build(BuildContext context) {
    if (widget.shopInfo != null) {
      shopInfo = widget.shopInfo!;
    }
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Profile Update Screen"),
          centerTitle: true,
          backgroundColor: CupertinoColors.systemBlue,
        ),
        body: Form(
          key: formkey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter Shop Name";
                      }
                      return null;
                    },
                    onSaved: (value) {
                      shopInfo.name = value!;
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    onTap: () {
                      // > MapScreen()));
                    },
                    onSaved: (value) {
                      // location = value!;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter Google map location url";
                      } else if (value.contains ==
                          'https://www.google.co.in/maps/place/') {
                        return "Enter Correct URL";
                      }
                      return null;
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    onSaved: (value) {
                      shopInfo.phone = value!;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter Shop contact number";
                      }
                      return null;
                    },
                    inputFormatters: [
                      new FilteringTextInputFormatter.allow(
                          new RegExp(r'^[0-9]*$')),
                      new LengthLimitingTextInputFormatter(10)
                    ],
                    keyboardType: TextInputType.number,
                    autocorrect: false,
                    scrollPhysics: ScrollPhysics(),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Enter Contact Number",
                        hintText: "1234567890",
                        prefixIcon: Icon(
                          CupertinoIcons.phone_fill,
                          color: CupertinoColors.systemBlue,
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    maxLines: 140,
                    minLines: 1,
                    onSaved: (value) {
                      shopInfo.address = value!;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter Shop Address";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.multiline,
                    autocorrect: false,
                    scrollPhysics: ScrollPhysics(),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Enter Shop Address",
                        hintText: "Eg.Yaash school,234 A,Seetharamdos Nagar "
                            "Jakkampatti,BSNL Office,Theni,Tamilnadu,625512,India",
                        prefixIcon: Icon(
                          CupertinoIcons.house,
                          color: CupertinoColors.systemBlue,
                        )),
                  ),
                ),
                SizedBox(
                    width: 140,
                    height: 55,
                    child: ElevatedButton.icon(
                        icon: FaIcon(FontAwesomeIcons.save),
                        label: Text("Submit"),
                        onPressed: () {
                          if (formkey.currentState!.validate()) {
                            (formkey.currentState!.save());
                            Navigator.pop(context, shopInfo);
                          }
                        }))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
