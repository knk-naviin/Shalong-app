import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shalong/UserAuthentication/AuthManager.dart';

class CustomerHomeScreen extends StatefulWidget {
  const CustomerHomeScreen({Key? key}) : super(key: key);

  @override
  _CustomerHomeScreenState createState() => _CustomerHomeScreenState();
}

class _CustomerHomeScreenState extends State<CustomerHomeScreen> {

  late List<ShopInfo>? shops = null;

  @override
  void initState() {
    super.initState();
  }

  Widget shopList(List<ShopInfo> shops) {
    List<Widget> widgets = [];
    for (var shop in shops) {
      widgets.add(
      SizedBox(
        width: 440,
        height: 85,
        child: Card(
          child: ListTile(
            title: Text(shop.name),
            subtitle: Text(shop.address),
            trailing: Column(
              children: [
                Text( shop.isOpen ? "Open" : "Closed",
                  style: TextStyle(
                      color: shop.isOpen?Colors.red:Colors.grey,
                      fontWeight: FontWeight.bold),
                ),
                Icon(shop.isOpen?Icons.lock_open_rounded:Icons.lock_outline)
              ],
            )
          ),
        ),
      ));
    }

    return ListView(children: widgets,);
  }


  @override
  Widget build(BuildContext context) {
    if (shops == null) {
      fetchShops().then((value) => setState((){
        if (value != null) {
          shops = value;
        }
      }));
      return Center(child: CircularProgressIndicator());
    } else {
      return shopList(shops!);
    }

    return Container(
      child: Column(
        children: [
          SizedBox(
            width: 440,
            height: 85,
            child: Card(
              elevation: 12.0,
              child: ListTile(
                title: Text("First Shop"),
                subtitle: Text(
                    "Bagavathi amman kovil st,jakkampatty,near murugan theatre,andipatty,theni(D.T),625512"),
                trailing: Text(
                  "OPEN",
                  style: TextStyle(
                      color: CupertinoColors.systemRed,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Card(
            elevation: 12.0,
            child: ListTile(
              title: Text("Second Shop"),
              trailing: Text(
                "Close",
                style: TextStyle(
                    color: CupertinoColors.systemGrey,
                    fontWeight: FontWeight.bold),
              ),
              subtitle: Text("Address"),
            ),
          ),
          Card(
            elevation: 12.0,
            child: ListTile(

              title: Text("Third Shop"),
              subtitle: Text("Address"),
              trailing: Text(
                "OPEN",
                style: TextStyle(
                    color: CupertinoColors.systemRed,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Card(
            elevation: 12.0,
            child: ListTile(
              title: Text("Forth Shop"),
              trailing: Text(
                "Close",
                style: TextStyle(
                    color: CupertinoColors.systemGrey,
                    fontWeight: FontWeight.bold),
              ),
              subtitle: Text("Address"),
            ),
          )
        ],
      ),
    );
  }
}
