import 'package:flutter/material.dart';

class ShopPageScreen extends StatefulWidget {
  const ShopPageScreen({Key? key}) : super(key: key);

  @override
  _ShopPageScreenState createState() => _ShopPageScreenState();
}

class _ShopPageScreenState extends State<ShopPageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Row(
          children: [
            Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Shop Name kumar thamil lets",style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold
                  ),),
                ),
            ),
          ],
        ),
      ],
    ));
  }
}
