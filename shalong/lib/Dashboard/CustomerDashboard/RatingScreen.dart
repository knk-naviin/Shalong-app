import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shalong/UserAuthentication/AuthManager.dart';

class RatingScreen extends StatefulWidget {
  ShopInfo shopInfo;
  Rating? rating;
  RatingScreen(this.shopInfo, this.rating);
  @override
  _RatingScreenState createState() {
  if (rating == null) {
    rating = rating = Rating("", FirebaseAuth.instance.currentUser?.uid ?? "", shopInfo.docId, "", 0, DateTime.now(), "");
  }
    return _RatingScreenState(rating!, false);
  }
}

class _RatingScreenState extends State<RatingScreen> {
  Rating rating;
  bool isUpdate;
  _RatingScreenState(this.rating, this.isUpdate);

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rating Screen"),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.lightBlueAccent, Colors.blue])),
        ),
        backgroundColor: Colors.blue,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.cancel),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          TextButton(
            child: Text(
              "Send",
              style: TextStyle(color: CupertinoColors.white),
            ),
            onPressed: () {
              if (formkey.currentState!.validate()) {
                (formkey.currentState!.save());
                // Navigator.pop(context);
                submitReview(rating);
              }
            },
          )
        ],
      ),
      body: Form(
        key: formkey,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: RatingBar.builder(
                  initialRating: rating.value.toDouble(),
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => Icon(
                    CupertinoIcons.star_fill,
                    color: CupertinoColors.systemBlue,
                  ),
                  glow: false,
                  onRatingUpdate: (ratingValue) {
                    rating.value = ratingValue.toInt();
                  },
                ),
              ),
            ),
            Center(child: Text("Tap a Star to Rate")),
            Padding(
              padding: const EdgeInsets.only(right: 12.0, top: 25),
              child: CupertinoTextFormFieldRow(
                  onSaved: (value) {
                    rating.review = value!;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Review";
                    }
                  },
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: CupertinoColors.systemGrey,
                          style: BorderStyle.solid)),
// maxLines: 1,
                  placeholder: "One Line Review"),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: CupertinoTextFormFieldRow(
                  onSaved: (value) {
                    rating.feedback = value!;
                  },
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: CupertinoColors.systemGrey,
                          style: BorderStyle.solid)),
                  maxLines: 5,
                  placeholder: "FeedBack(Optional)"),
            ),
            Divider()
          ],
        ),
      ),
    );
  }
}
