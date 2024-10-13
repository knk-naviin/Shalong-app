import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../UserAuthentication/AuthManager.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  List<ShopInfo> favorites = [];  // Initialize with an empty list
  Map<String, List<Rating>>? ratings;
  bool isLoading = true;  // Flag to show loading state
  String? errorMessage;   // Store any error messages

  @override
  void initState() {
    super.initState();
    fetchFavoriteShops();  // Fetch favorites when the screen initializes
  }

  // Fetch shops that the user has marked as favorites
  Future<void> fetchFavoriteShops() async {
    try {
      var fetchedFavorites = await fetchShopsForFavorites();
      setState(() {
        // Ensure fetchedFavorites is not null, default to an empty list if it is
        favorites = fetchedFavorites ?? [];
        isLoading = false;  // Turn off loading state
      });
    } catch (error) {
      setState(() {
        errorMessage = "Error fetching favorites";
        isLoading = false;
      });
    }
  }

  // Helper to get average ratings
  String getRatings(int ratingCount, int userCount) {
    return userCount != 0 ? (ratingCount / userCount).toStringAsFixed(1) : "No ratings";
  }

  // Helper to fetch ratings for a shop by its ID
  List<Rating> ratingsForShopId(String shopId) {
    return ratings?[shopId] ?? [];
  }

  // The widget that builds the UI for the list of favorite shops
  Widget subWidget() {
    if (isLoading) {
      // Show a loading indicator while data is being fetched
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    if (errorMessage != null) {
      // Show error message if data fetching fails
      return Center(
        child: Text(
          errorMessage!,
          style: TextStyle(color: Colors.red, fontSize: 16),
        ),
      );
    }

    if (favorites.isEmpty) {
      // Show message when there are no favorites
      return Center(
        child: Text(
          "No favorite shops added yet.",
          style: TextStyle(fontSize: 18),
        ),
      );
    } else {
      // Build the list of favorite shops
      return ListView.builder(
        itemCount: favorites.length,
        itemBuilder: (context, index) {
          var favorite = favorites[index];
          return Card(
            shadowColor: Colors.blue,
            semanticContainer: false,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10), // Rounded corners
              side: BorderSide(
                style: BorderStyle.solid,
                color: CupertinoColors.systemGrey.withOpacity(0.2),
                width: 1,
              ),
            ),
            child: ListTile(
              tileColor: Colors.grey.shade50,
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
                  Divider(),
                ],
              ),
              trailing: Text(
                favorite.isOpen ? "Open" : "Closed",
                style: TextStyle(
                  fontSize: 20,
                  color: favorite.isOpen ? Colors.red : Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                favorite.address,
                style: TextStyle(
                  color: CupertinoColors.systemGrey,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 2,
                  wordSpacing: 2,
                ),
              ),
            ),
          );
        },
      );
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
            gradient: LinearGradient(colors: [Colors.lightBlueAccent, Colors.blue]),
          ),
        ),
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: subWidget(),
    );
  }
}
