

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';




class RatingsScreenSettings extends StatelessWidget {
  const RatingsScreenSettings({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: MyStatefulWidget(),
    );
  }
}

/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {

  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            leading:
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Cancel"),
            ),
            middle: Text("Write a Review"),
            trailing: TextButton(
              onPressed: () {
                if(formkey.currentState!.validate()){
                  (formkey.currentState!.save());
                  Navigator.pop(context);
                }
              },
              child: Text("Send"),
            ),
          ),
          child: Form(
            key: formkey,
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: RatingBar.builder(
                      initialRating: 3,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => Icon(
                        CupertinoIcons.star_fill,
                        color: CupertinoColors.systemBlue,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                  ),
                ),
                Center(child: Text("Tap a Star to Rate")),

                Padding(
                  padding: const EdgeInsets.only(right: 12.0,top: 25),
                  child: CupertinoTextFormFieldRow(
                      validator: (value){
                        if(value!.isEmpty){
                          return "Enter Review";
                        }
                      },
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: CupertinoColors.systemGrey,
                              style: BorderStyle.solid
                          )
                      ),
                      // maxLines: 1,
                      placeholder: "One Line Review"
                  ),
                ),


                Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: CupertinoTextFormFieldRow(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: CupertinoColors.systemGrey,
                              style: BorderStyle.solid
                          )
                      ),

                      maxLines: 5,
                      placeholder: "FeedBack(Optional)"
                  ),
                ),
                Divider()
              ],
            ),
          )
      ),
    );
  }
}
