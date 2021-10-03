import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shalong/Dashboard/CustomerDashboard/ShopPageScreen.dart';
import 'package:shalong/UserAuthentication/AuthManager.dart';

class CustomerHomeScreen extends StatefulWidget {
  const CustomerHomeScreen({Key? key}) : super(key: key);
  @override
  _CustomerHomeScreenState createState() => _CustomerHomeScreenState();
}

class _CustomerHomeScreenState extends State<CustomerHomeScreen> {
  late List<ShopInfo>? shops = null;
  List<String> favorites = [];
  // bool _icon = false;
  var searchText = "";
  var name = FirebaseAuth.instance.currentUser!.displayName;
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  TextEditingController editingController = TextEditingController();

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

  getratings(int ratingCount, int userCount) {
    return ratingCount / userCount;
  }

  Widget shopList(List<ShopInfo>? shops) {
    if (shops == null) {
      _onLoading();
      return Center(
          child: Scaffold(
        backgroundColor: Colors.white70,
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Platform.isAndroid
                ? CircularProgressIndicator()
                : CupertinoActivityIndicator(
                    animating: true,
                  ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Loading"),
            )
          ],
        )),
      ));
    }
    List<Widget> widgets = [];
    widgets.add(Column(
      children: [
        Container(
          width: 440,
          height: 200,
          child: Stack(
            children: [
              new Container(
                width: 440,
                height: 180,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(36),
                      bottomRight: Radius.circular(36),
                    ),
                    gradient: LinearGradient(
                        colors: [Colors.lightBlueAccent, Colors.blue])),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        "Hi '",
                        style: TextStyle(
                          fontSize: 23,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Center(
                      child: Text(
                        name!,
                        style: TextStyle(
                            fontSize: 23,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.0),
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    height: 54,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 10),
                              blurRadius: 50,
                              color: Colors.blue.withOpacity(0.23))
                        ]),
                    child: TextField(
                      onChanged: (value) {
                        setState(() {});
                      },
                      controller: editingController,
                      decoration: InputDecoration(
                          // suffixIcon: Icon(Icons.search,color: Colors.blue,),
                          hintText: "Search",
                          hintStyle: TextStyle(color: Colors.blue),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none),
                    ),
                  ))
              // Padding(
              //   padding: const EdgeInsets.only(top: 150.0),
              //   child: TextField(
              //

              //
              //     decoration: InputDecoration(
              //       fillColor: Colors.red,
              //         labelText: "Search",
              //
              //         prefixIcon: Icon(Icons.search),
              //         border: OutlineInputBorder(
              //             borderRadius: BorderRadius.all(Radius.circular(12.0)))),
              //   ),
              // ),
            ],
          ),
        ),
      ],
    ));
    // for (var shop in shops) {
    widgets.add(
      Expanded(
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: shops.length,
            itemBuilder: (context, index) {
              var shop = shops[index];
              if (editingController.text.isEmpty) {
                return Center(
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(40), // if you need this
                      side: BorderSide(
                        color: Colors.grey.withOpacity(0.2),
                        width: 1,
                      ),
                    ),
                    borderOnForeground: true,
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ShopPageScreen(
                                    shopname: shop.name,
                                    shopadd: shop.address,
                                    isopen: shop.isOpen,
                                    phoneno: shop.phone,
                                  )),
                        );
                      },
                      title: Text(
                        shop.name,
                        style: TextStyle(
                          letterSpacing: 2,
                          wordSpacing: 2,
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Divider(),
                          Text(
                            shop.address,
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                letterSpacing: 2,
                                wordSpacing: 2),
                          ),
                          Divider(),
                          Row(
                            children: [
                              RichText(
                                text: TextSpan(
                                  text: 'Ratings | ',
                                  style: DefaultTextStyle.of(context).style,
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: '${shop.shopratings}★',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 67,
                              ),
                              Text("Add to Favorites"),
                              IconButton(
                                autofocus: true,
                                icon: Icon(
                                  // Icons.favorite_outline
                                  favorites.contains(shop.docId)
                                      ? CupertinoIcons.heart_fill
                                      : CupertinoIcons.heart,
                                  color: favorites.contains(shop.docId)
                                      ? CupertinoColors.systemBlue
                                      :CupertinoColors.systemGrey
                                ),
                                onPressed: () {
                                  setState(() {
                                    if (favorites.contains(shop.docId)) {
                                      favorites.remove(shop.docId);
                                    } else {
                                      favorites.add(shop.docId);
                                    }
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                      trailing: Text(shop.isOpen ? "Open" : "Closed",
                          style: TextStyle(
                              color: shop.isOpen ? Colors.red : Colors.grey,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                );
              } else if (shops[index]
                      .name
                      .toLowerCase()
                      .contains(editingController.text) ||
                  shops[index]
                      .name
                      .toLowerCase()
                      .contains(editingController.text)) {
                return ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ShopPageScreen(
                                shopname: shop.name,
                                shopadd: shop.address,
                                isopen: shop.isOpen,
                                phoneno: shop.phone,
                              )),
                    );
                  },
                  title: Text(shop.name),
                );
              } else {
                return Container();
              }
            }),
      ),
      /**/
    );
    //);
    // }

    return Column(
      children: widgets,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.lightBlueAccent, Colors.blue])),
        ),
        backgroundColor: Colors.blue,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.widgets),
          onPressed: () {},
          color: Colors.white,
        ),
      ),
      body: SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        header: WaterDropHeader(),
        controller: _refreshController,
        onRefresh: _onRefresh,
        onLoading: _onRefresh,
        child: shopList(shops),
      ),
    );
  }


}
