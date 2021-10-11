import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BarberNotificationScreen extends StatefulWidget {
  const BarberNotificationScreen({Key? key}) : super(key: key);

  @override
  _BarberNotificationScreenState createState() => _BarberNotificationScreenState();
}

class _BarberNotificationScreenState extends State<BarberNotificationScreen> {
  @override
  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();

  Widget build(BuildContext context) {
    return Center(
      child: Container(
        // child: FlipCard(
        //   direction: FlipDirection.VERTICAL,
        //
        //   front: Stack(
        //     alignment: Alignment.center,
        //     children: [
        //       Container(
        //         width: double.infinity,
        //         height: double.infinity,
        //         child: Image.network("https://media.istockphoto.com/photos/closed-shop-shutter-picture-id499264206?k=20&m=499264206&s=170667a&w=0&h=DcXX9UHX3r1eYoKEI__Jez5HdxQ5qvmf_OuVQ7RK7YU=",
        //         fit: BoxFit.fill,
        //         ),
        //       ),
        //       Image.network("https://i.pinimg.com/originals/40/a3/ef/40a3ef7de6ec1cb3d29425a51cdafdf7.png")
        //     ],
        //   ),
        //   back: Visibility(
        //     visible: true,
        //     child: Padding(
        //       padding:
        //       const EdgeInsets.only(top: 18.0, left: 8.0, right: 8.0),
        //       // child: CustomerList(),
        //       //   child: Column(
        //       //     children: [
        //       //       Row(
        //       //         mainAxisAlignment: MainAxisAlignment.center,
        //       //         children: [
        //       //           Text("Are You Busy?",style: TextStyle(
        //       //             fontSize: 25,
        //       //             fontWeight: FontWeight.bold
        //       //           ),),
        //       //           CupertinoSwitch(
        //       //             value: ShopBusy,
        //       //               onChanged: (bool value) {
        //       //                 setState(() {
        //       //                   ShopBusy = value;
        //       //                 });
        //       //                 var shop = profileInfo!.shops.first;
        //       //                 shop.shopbusy = ShopBusy;
        //       //                 setShopStatus(shop);
        //       //               }
        //       //           )
        //       //         ],
        //       //       )
        //       //     ],
        //       //   ),
        //       child: Card(
        //         child: ListTile(
        //           subtitle: Text(
        //               "PLease Notify to your customer, that you are busy or not"),
        //           title: Text(
        //             "Are You Busy?",
        //             style: TextStyle(
        //                 fontSize: 25, fontWeight: FontWeight.bold),
        //           ),
        //           trailing: CupertinoSwitch(
        //               activeColor: CupertinoColors.destructiveRed,
        //               value: true,
        //               onChanged: (bool value) {
        //                 // setState(() {
        //                 //   ShopBusy = value;
        //                 // });
        //                 // var shop = profileInfo!.shops.first;
        //                 // shop.shopbusy = ShopBusy;
        //                 // setShopStatus(shop);
        //               }),
        //         ),
        //       ),
        //     ),
        //   )
        // ),
        child: FlipCard(
          key: cardKey,
          flipOnTouch: false,
          front: Container(
            child: ElevatedButton(
              onPressed: () => cardKey.currentState!.toggleCard(),
              child: Text('Toggle'),
            ),
          ),
          back: Container(
            child: ElevatedButton(

              onPressed: () => cardKey.currentState!.toggleCard(),
              child: Text('Back'),
            ),
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
