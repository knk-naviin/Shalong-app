import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Profile {
  String docId;
  String name;
  String email;
  String phone;
  bool isBarber;
  List<ShopInfo> shops = [];
  // String barbershopname;
  // String barbershopaddress;
  // String barberlocationurl;
  Profile(this.docId, this.name, this.email, this.phone, this.isBarber, this.shops);
}

class ShopInfo {
  String docId;
  String name;
  String address;
  String phone;
  ShopInfo(this.docId, this.name,this.address,this.phone);
}


Future<void> signout() async {
  (await GoogleSignIn().signOut());
  return FirebaseAuth.instance.signOut();
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
          shops.add(ShopInfo(doc.id, doc["name"], doc["address"], doc["phone"]));
        }
      }
      return Profile(docId, name, email, phonenumber, isBarber, shops);
    }
  }
  return null;
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
