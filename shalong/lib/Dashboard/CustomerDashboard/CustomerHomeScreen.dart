import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shalong/Dashboard/CustomerDashboard/ShopPageScreen.dart';
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
        width: 50,
        height: 150,
        child: Card(
          child: ListTile(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ShopPageScreen(

                )),
              );
            },
            title: Text(shop.name,style: TextStyle(
              fontSize: 29,
            ),),
            subtitle: Text(shop.address,style: TextStyle(
              fontSize: 21,
            ),),
            trailing: Text( shop.isOpen ? "Open" : "Closed",
              style: TextStyle(
                  color: shop.isOpen?Colors.red:Colors.grey,
                  fontWeight: FontWeight.bold),
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
  }

}
