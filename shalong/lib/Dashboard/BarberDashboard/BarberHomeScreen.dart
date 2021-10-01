import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shalong/UserAuthentication/AuthManager.dart';

class BarberHomeScreen extends StatefulWidget {
  const BarberHomeScreen({Key? key}) : super(key: key);

  @override
  _BarberHomeScreenState createState() => _BarberHomeScreenState();
}

class _BarberHomeScreenState extends State<BarberHomeScreen> {
  Profile? profileInfo;
  bool shopOpen = false;

  void updateShopStatus() {
    var shop = profileInfo!.shops.first;
    shop.isOpen = shopOpen;
    setShopStatus(shop);
  }

  void initState() {
    super.initState();
    profile().then((value) => {
          setState(() {
            shopOpen = value!.shops.first.isOpen;
            profileInfo = value;
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    if (profileInfo == null) {
      return Center(child: CircularProgressIndicator());
    } else {
      return Scaffold(
        body: ListView(
          shrinkWrap: false,
          children: [
            Text("WelCome  ${profileInfo!.name}"),
            Padding(
                padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Is Shop is Open ?',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
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
                )),
          ],
        ),
      );
    }
  }
}
