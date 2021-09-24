import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shalong/UserAuthentication/AuthManager.dart';

import 'ShopPageScreen.dart';

class CustomerHomeScreen extends StatefulWidget {
  const CustomerHomeScreen({Key? key}) : super(key: key);

  @override
  _CustomerHomeScreenState createState() => _CustomerHomeScreenState();
}

class _CustomerHomeScreenState extends State<CustomerHomeScreen> {
  late List<ShopInfo>? shops = null;

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    // monitor network fetch
    fetchShops().then((value) {
      setState(() {
        shops = value;
      });
      _refreshController.refreshCompleted();
    });
    // if failed,use refreshFailed()
  }

  void _onLoading() async {
    fetchShops().then((value) {
      setState(() {
        shops = value;
      });
      _refreshController.loadComplete();
    });
  }

  @override
  void initState() {
    super.initState();
  }

  Widget shopList(List<ShopInfo>? shops) {
    if (shops == null) {
      _onLoading();
      return Center(child: CircularProgressIndicator());
    }
    List<Widget> widgets = [];
    for (var shop in shops) {
      widgets.add(SizedBox(
        width: 50,
        height: 150,
        child: Card(
          child: ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ShopPageScreen()),
                );
              },
              title: Text(
                shop.name,
                style: TextStyle(
                  fontSize: 29,
                ),
              ),
              subtitle: Text(
                shop.address,
                style: TextStyle(
                  fontSize: 21,
                ),
              ),
              trailing: Text(
                shop.isOpen ? "Open" : "Closed",
                style: TextStyle(
                    color: shop.isOpen ? Colors.red : Colors.grey,
                    fontWeight: FontWeight.bold),
              )),
        ),
      ));
    }

    return ListView(children: widgets);
  }

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      enablePullDown: true,
      enablePullUp: true,
      header: WaterDropHeader(),
      // footer: CustomFooter(
      //   builder: (BuildContext context, LoadStatus mode) {
      //     Widget body;
      //     if (mode == LoadStatus.idle) {
      //       body = Text("pull up load");
      //     }
      //     else if (mode == LoadStatus.loading) {
      //       body = CupertinoActivityIndicator();
      //     }
      //     else if (mode == LoadStatus.failed) {
      //       body = Text("Load Failed!Click retry!");
      //     }
      //     else if (mode == LoadStatus.canLoading) {
      //       body = Text("release to load more");
      //     }
      //     else {
      //       body = Text("No more Data");
      //     }
      //     return Container(
      //       height: 55.0,
      //       child: Center(child: body),
      //     );
      //   },
      // ),
      controller: _refreshController,
      onRefresh: _onRefresh,
      onLoading: _onRefresh,
      child: shopList(shops),
    );
  }

  //   if (shops == null) {
  //     fetchShops().then((value) => setState((){
  //       if (value != null) {
  //         shops = value;
  //       }
  //     }));
  //     return Center(child: CircularProgressIndicator());
  //   } else {
  //     return shopList(shops!);
  //   }
  // }

}
