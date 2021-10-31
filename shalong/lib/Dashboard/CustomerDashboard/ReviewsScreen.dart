import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shalong/UserAuthentication/AuthManager.dart';

class ReviewScreen extends StatefulWidget {
  List<Rating> ratings;
  // const ReviewScreen({Key? key}) : super(key: key);
  ReviewScreen(this.ratings);


  @override
  _ReviewScreenState createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();

    return Scaffold(
      appBar: AppBar(
        title: Text("Reviews"),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.lightBlueAccent, Colors.blue])),
        ),
        backgroundColor: Colors.blue,
        elevation: 0,
      ),

      body: Container(
        width: 350,
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: widget.ratings.length,
            itemBuilder: (context, index) {
              var rating = widget.ratings[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: ListTile(
                    title: Text(rating.review),
                    subtitle: Text(rating.feedback),

                    trailing: Text("${rating.date.day.toInt() - now.day.toInt()} days before"),
                  )
                ),
              );
            }),
      ),
    );
  }
}
