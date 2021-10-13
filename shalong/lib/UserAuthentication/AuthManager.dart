
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';


class Rating {
  String docId;
  String shopId;
  String uid;
  String review;
  int value;
  String feedback;
  DateTime date;

  Rating(this.docId, this.uid, this.shopId, this.review, this.value, this.date, this.feedback);

 Map<String, Object> jsonRef() {
   return {"uid": uid, "shop_id": shopId, "review": review, "value": value, "date": date,"feedback":feedback};
 }

 static Rating object(QueryDocumentSnapshot doc) {
   // var value = doc["value"] as double;
   return Rating(doc.id, doc["uid"], doc["shop_id"], doc["review"], doc["value"], doc["date"].toDate(), doc["feedback"]);
 }

}

class ShopInfo {
  String docId;
  String name;
  String address;
  String phone;
  bool isOpen;
  bool shopbusy;

  ShopInfo(this.docId, this.name, this.address, this.phone, this.isOpen ,this.shopbusy);
}


class Profile {
  String docId;
  String name;
  String email;
  String phone;
  bool isBarber = false;

  List<ShopInfo> shops = [];
  // String barbershopname;
  // String barbershopaddress;
  // String barberlocationurl;
  Profile(this.docId, this.name, this.email, this.phone, this.isBarber, this.shops,);
}

Future<void> signout() async {
  (await GoogleSignIn().signOut());
  return FirebaseAuth.instance.signOut();
}

Future<Profile?> initalizeAppAndFetchProfile() async {
  await Firebase.initializeApp();
  return profile();
}

Future<Profile?> profile() async {

  var uid = FirebaseAuth.instance.currentUser?.uid;
  if (uid != null) {
    CollectionReference userRef = FirebaseFirestore.instance.collection("user");
    var queryInfo = (await userRef.where("uid", isEqualTo: uid).get());
    var docs = queryInfo.docs;

    if (docs.length > 0) {
      var doc = queryInfo.docs.first;
      var name = doc["name"];
      var email = doc["email"];
      var phonenumber = doc["phone"];
      var isBarber = doc["is_barber"];
      var docId = doc.id;
      List<ShopInfo> shops = [];

      CollectionReference userRef = FirebaseFirestore.instance.collection("shop");
      var shopQueryInfo = (await userRef.where("uid", isEqualTo: uid).get());
      var docs = shopQueryInfo.docs;
      if (docs.length > 0) {
        for (doc in docs) {
          // List<Rating> ratings = [];
          // for (var ratingDoc in doc["ratings"]) {
          //   Timestamp date =  ratingDoc["date"];
          //   ratings.add(Rating(ratingDoc["uid"], ratingDoc["review"], ratingDoc["value"], date.toDate(),ratingDoc["feedback"]));
          // }

            shops.add(ShopInfo(
              doc.id,
              doc["name"],
              doc["address"],
              doc["phone"],
              doc["is_open"],
              doc["shop_busy"],
          )
          );
        }
      }
      return Profile(docId, name, email, phonenumber, isBarber, shops,);
    }
  }
  return null;
}

Future<List<Rating>?> fetchRatings() async {
  CollectionReference ratingInfo = FirebaseFirestore.instance.collection("rating");
  var ratingQueryInfo = (await ratingInfo.get());
  var docs = ratingQueryInfo.docs;
  List<Rating> ratings = [];
  if (docs.length > 0) {
    for (var doc in docs) {
        ratings.add(Rating.object(doc));
    }
      return ratings;
  }
}

// final Map<String, int> someMap = {
//   "a": 1,
//   "b": 2,
// };

Future<Map<String, List<Rating>>> ratingMap() async {
  Map<String, List<Rating>> map = {};
  var ratings = await fetchRatings();
  if (ratings != null) {
    for (var rating in ratings) {
      if ([rating.shopId] != null) {
        map[rating.shopId] = ratings.where((element) => element.shopId == rating.shopId).toList();
      }
    }
  }

return map;
}

Future<List<Object?>> shopTuple() async{
  List list = [];
  var shops = await fetchShops();
  var ratings = await ratingMap();
  if (shops == null)  {
    shops = [];
  }
  list.add(shops);
  list.add(ratings);
  return list;
}



Future<List<ShopInfo>?> fetchShops() async {
  CollectionReference shopRef = FirebaseFirestore.instance.collection("shop");
  var shopQueryInfo = (await shopRef.get());
  var docs = shopQueryInfo.docs;
  List<ShopInfo> shops = [];
  if (docs.length > 0) {
    for (var doc in docs) {
      // List<Rating> ratings = [];
      // for (var ratingDoc in doc["ratings"]) {
      //   Timestamp date =  ratingDoc["date"];
      //   ratings.add(Rating(ratingDoc["uid"], ratingDoc["review"], ratingDoc["value"], date.toDate(),ratingDoc["feedback"]));
      //   ratings.add(Rating());
      // }
      var name = doc["name"] ?? "";
      var address = doc["address"] ?? "";
      var phonenumber = doc["phone"] ?? "";
      var isOpen = doc["is_open"];
      var shopbusy = doc["shop_busy"];
      shops.add(ShopInfo(doc.id, name, address, phonenumber, isOpen,shopbusy));
    }
  }
  return shops;
}



setShopStatus(ShopInfo shop) {
  CollectionReference shopRef = FirebaseFirestore.instance.collection("shop");
   shopRef.doc(shop.docId).update({"is_open": shop.isOpen, "shop_busy": shop.shopbusy});
}

submitReview(Rating rating) {
  CollectionReference ratingRef = FirebaseFirestore.instance.collection(
      "rating");
  if (rating.docId == "") {
    ratingRef.add(rating.jsonRef());
  } else {
    ratingRef.doc(rating.docId).update(rating.jsonRef());
  }
}




Future<UserCredential?> signInWithGoogle() async {

  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth =
  await googleUser?.authentication;
  if (googleAuth != null) {
    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    var userCredentials =
    await FirebaseAuth.instance.signInWithCredential(credential);
    // Once signed in, return the UserCredential
    return userCredentials;
  }
}
