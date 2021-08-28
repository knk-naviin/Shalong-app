import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Profile {
  String firstName;
  String lastName;
  String phone;
  String email;
  bool isBarber;

  Profile(this.firstName, this.lastName, this.phone, this.email, this.isBarber);
}

Future<Profile?> profile() async {
  var uid = FirebaseAuth.instance.currentUser?.uid;
  if (uid != null) {
    CollectionReference userRef = FirebaseFirestore.instance.collection("user");
    var queryInfo = (await userRef.where("uid", isEqualTo: uid).get());

    var doc = queryInfo.docs.first;
    if (doc.exists) {
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
