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
    final now = DateTime.now();
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
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: widget.ratings.length,
            itemBuilder: (context, index) {
              var rating = widget.ratings[index];
              return Card(
                  child: ListTile(
                title: Text(rating.review),
                subtitle: Text(rating.feedback),
                trailing:
                    Text("${now.difference(rating.date).inDays} days before"),
              ));
            }),

      ),
    );
  }
}
