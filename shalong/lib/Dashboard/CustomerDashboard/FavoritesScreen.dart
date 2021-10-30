import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shalong/UserAuthentication/AuthManager.dart';

import 'ShopPageScreen.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  late List<ShopInfo>? favorites = null;
  late Map<String, List<Rating>>? ratings = null;
  late List<ShopInfo>? shops = null;

  getratings(int ratingCount, int userCount) {
    return ratingCount / userCount;
  }

  List<Rating> ratingsForShopId(String shopId) {
    return ratings?[shopId] ?? [];
  }

  Widget subWidget() {
    if (favorites == null) {
      fetchShopsForFavorites().then((value) {
        setState(() {
          favorites = value;
        });
      });
      return Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Favorites",
            style: TextStyle(fontSize: 32),
          ),
        ],
      ));
    } else {
      List<Widget> list = [];
      for (var favorite in favorites!) {
        list.add(Card(
          shadowColor: Colors.blue,
          semanticContainer: false,
          borderOnForeground: true,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // if you need this
            side: BorderSide(
              style: BorderStyle.solid,
              color: CupertinoColors.systemGrey.withOpacity(0.2),
              width: 1,
            ),
          ),
          child: ListTile(
            tileColor: Colors.grey.shade50,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ShopPageScreen(
                        favorite, ratingsForShopId(favorite.docId))),
              );
            },
            title: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      favorite.name,
                      style: TextStyle(
                        letterSpacing: 3,
                        wordSpacing: 2,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Divider()
              ],
            ),
            trailing: Text(favorite.isOpen ? "Open" : "Closed",
                style: TextStyle(
                    fontSize: 20,
                    color: favorite.isOpen ? Colors.red : Colors.grey,
                    fontWeight: FontWeight.bold)),
            subtitle: Text(
              favorite.address,
              style: TextStyle(
                  color: CupertinoColors.systemGrey,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 2,
                  wordSpacing: 2),
            ),
          ),
        ));
      }
      return ListView(children: list);
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Favorites"),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.lightBlueAccent, Colors.blue])),
        ),
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: subWidget(),
    );
  }
}
