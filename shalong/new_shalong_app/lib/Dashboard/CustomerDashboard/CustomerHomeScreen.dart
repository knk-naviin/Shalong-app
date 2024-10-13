import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../UserAuthentication/AuthManager.dart';
import 'CustomerAccountInfoScreen.dart';
import 'ShopPageScreen.dart';

class CustomerHomeScreen extends StatefulWidget {
  const CustomerHomeScreen({Key? key}) : super(key: key);

  @override
  _CustomerHomeScreenState createState() => _CustomerHomeScreenState();
}

class _CustomerHomeScreenState extends State<CustomerHomeScreen> {
  List<ShopInfo> shops = [];
  Map<String, List<Rating>> ratings = {};
  Map<String, List<Favorite>> favorites = {};

  var searchText = "";
  var name = FirebaseAuth.instance.currentUser!.displayName;

  RefreshController _refreshController =
  RefreshController(initialRefresh: false);
  TextEditingController editingController = TextEditingController();

  void _onRefresh() async {
    loadData(true);
  }

  void loadData(bool isRefresh) async {
    try {
      var value = await shopTuple();
      if (value != null && value.isNotEmpty) {
        setState(() {
          shops = value[0] as List<ShopInfo>;
          ratings = value[1] as Map<String, List<Rating>>;
          favorites = value[2] as Map<String, List<Favorite>>;
        });
        if (isRefresh) {
          _refreshController.refreshCompleted();
        } else {
          _refreshController.loadComplete();
        }
      } else {
        // Handle empty data case
        setState(() {
          shops = [];
        });
        if (isRefresh) {
          _refreshController.refreshCompleted();
        } else {
          _refreshController.loadComplete();
        }
      }
    } catch (e) {
      print('Error loading data: $e');
      _refreshController.refreshFailed();
    }
  }

  void _onLoading() async {
    loadData(false);
  }

  @override
  void initState() {
    super.initState();
    _onLoading(); // Load data when the screen initializes
  }

  String averageRatingString(List<Rating> shopRatings) {
    if (shopRatings.isEmpty) return "0.0";
    double totalRating = shopRatings.fold(0, (sum, rating) => sum + rating.value);
    return (totalRating / shopRatings.length).toStringAsFixed(1);
  }

  List<Rating> ratingsForShopId(String shopId) {
    return ratings[shopId] ?? [];
  }

  Widget shopList(List<ShopInfo>? shops) {
    // Check if shops list is empty
    if (shops!.isEmpty) {
      return Center(
        child: Scaffold(
          backgroundColor: Colors.white70,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 CircularProgressIndicator(),
                SizedBox(height: 20), // Space between the loading indicator and the text
                Text("No shops listed. Please wait..."),
              ],
            ),
          ),
        ),
      );
    }

    return Column(
      children: [
        GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 100,
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                        gradient: LinearGradient(
                          colors: [Colors.lightBlueAccent, Colors.blue],
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Flexible(
                                child: Text(
                                  "Hi ",
                                  style: TextStyle(
                                    fontSize: 23,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Flexible(
                                flex: 6,
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
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      left: 0,
                      right: 0,
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 20.0),
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 10),
                              blurRadius: 50,
                              color: Colors.blue.withOpacity(0.23),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: CupertinoSearchTextField(
                            controller: editingController,
                            backgroundColor: Colors.white,
                            onChanged: (value) {
                              setState(() {});
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: SmartRefresher(
            enablePullDown: true,
            enablePullUp: false,
            header: WaterDropHeader(
              waterDropColor: CupertinoColors.activeBlue,
            ),
            controller: _refreshController,
            onRefresh: _onRefresh,
            onLoading: _onLoading,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: shops.length,
              itemBuilder: (context, index) {
                var shop = shops[index];

                if (editingController.text.isEmpty ||
                    shop.name.toLowerCase().contains(editingController.text.toLowerCase())) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ShopPageScreen(shop, ratingsForShopId(shop.docId)),
                        ),
                      );
                    },
                    child: Card(
                      shadowColor: Colors.blue,
                      semanticContainer: false,
                      borderOnForeground: true,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(
                          style: BorderStyle.solid,
                          color: CupertinoColors.systemGrey.withOpacity(0.2),
                          width: 1,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    shop.name,
                                    style: TextStyle(
                                      letterSpacing: 3,
                                      wordSpacing: 2,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Text(
                                  shop.isOpen ? "Open" : "Closed",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: shop.isOpen ? Colors.green : Colors.red,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              shop.address,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                letterSpacing: 2,
                                wordSpacing: 2,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: RichText(
                                    text: TextSpan(
                                      text: 'Ratings | ',
                                      style: DefaultTextStyle.of(context).style,
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: averageRatingString(
                                            ratingsForShopId(shop.docId),
                                          ),
                                          style: TextStyle(
                                            color: Colors.blue,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Add to Favorites",
                                    style: TextStyle(
                                      color: favorites[shop.docId] == null
                                          ? CupertinoColors.systemGrey
                                          : CupertinoColors.activeBlue,
                                    ),
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      favorites[shop.docId] == null
                                          ? CupertinoIcons.heart
                                          : CupertinoIcons.heart_fill,
                                      color: favorites[shop.docId] == null
                                          ? CupertinoColors.systemGrey
                                          : CupertinoColors.activeBlue,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        if (favorites[shop.docId] == null) {
                                          setFavorite(shop);
                                          favorites[shop.docId] = [
                                            Favorite("docId", "uid", shop.docId)
                                          ];
                                        } else {
                                          removeFavorite(shop);
                                          favorites.remove(shop.docId);
                                        }
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                } else {
                  return Container();
                }
              },
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var photo = FirebaseAuth.instance.currentUser!.photoURL;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        body: shopList(shops),
        appBar: AppBar(
          title: Text("Home"),
          actions: [
            IconButton(
              icon: Icon(CupertinoIcons.person),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CustomerAccountInfoScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
