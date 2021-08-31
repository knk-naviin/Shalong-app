import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Profile {
  String firstName;
  String lastName;
  String phone;
  String email;
  bool isBarber;

  Profile(this.firstName, this.lastName, this.phone, this.email, this.isBarber);
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
      var firstName = doc["firstname"];
      var lastName = doc["lastname"];
      var email = doc["email"];
      var phone = doc["phone"];
      var isBarber = doc["is_barber"];
      return Profile(firstName, lastName, phone, email, isBarber);
    }
  }
  return null;
}

Future<Profile?> signInWithGoogleAndGetProfile() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth = await googleUser
      ?.authentication;
  if (googleAuth != null) {
    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    var userCredentials = await FirebaseAuth.instance.signInWithCredential(
        credential);
    // Once signed in, return the UserCredential
    if (userCredentials != null) {
      return profile();
    }
  }
  return null;
}

