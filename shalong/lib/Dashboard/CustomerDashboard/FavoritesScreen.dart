import 'package:flutter/material.dart';
import 'package:shalong/UserAuthentication/AuthManager.dart';

import 'ShopPageScreen.dart';

class FavScreen extends StatefulWidget {
  const FavScreen({Key? key}) : super(key: key);

  @override
  _FavScreenState createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen> {
  @override
  Widget build(BuildContext context) {


    return Container(
      child:  Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          borderOnForeground: false,
          child: ListTile(
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => ShopPageScreen(isopen: null,)),
              // );
            },
            title: Text(
              "shop.name",
              style: TextStyle(
                letterSpacing: 2,
                wordSpacing: 2,
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Divider(),
                Text("shop.address",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      letterSpacing: 2,
                      wordSpacing: 2
                  ),
                ),
                Divider(),
                Row(
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'Ratings | ',
                        style: DefaultTextStyle.of(context).style,
                        children: <TextSpan>[
                          TextSpan(text: '4.0★', style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.favorite),
                      onPressed: (){},
                    )
                  ],
                ),

              ],
            ),
          )),
    );
  }
}
