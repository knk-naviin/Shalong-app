// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:shalong/UserAuthentication/UserAuthScreen.dart';
//
// class StartingScreen extends StatefulWidget {
//   const StartingScreen({Key? key}) : super(key: key);
//
//   @override
//   _StartingScreenState createState() => _StartingScreenState();
// }
//
// class _StartingScreenState extends State<StartingScreen> {
//   CarouselController buttonCarouselController = CarouselController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Column(
//         children: [
//           Stack(
//             children: [
//               // Container(
//               //   width: MediaQuery.of(context).size.width,
//               //   height: 170,
//               //   decoration: BoxDecoration(
//               //
//               //   ),
//               //   color: Colors.red,
//               // ),
//               Center(
//                 child: Padding(
//                   padding: const EdgeInsets.only(top: 108.0),
//                   child: Text(
//                     "We'll style while you smile!",
//                     style: TextStyle(fontSize: 19),
//                   ),
//                 ),
//               ),
//               Center(
//                 child: Padding(
//                   padding: const EdgeInsets.only(top: 38.0),
//                   child: RichText(
//                     text: TextSpan(
//                       text: 'Shalon',
//                       style: TextStyle(
//                           fontFamily: "Bunya-Regular_PERSONAL",
//                           color: Colors.black,
//                           fontSize: 70),
//                       children: const <TextSpan>[
//                         TextSpan(
//                             text: 'g',
//                             style: TextStyle(
//                                 fontFamily: "Bunya-Regular_PERSONAL",
//                                 color: CupertinoColors.systemRed,
//                                 fontSize: 80))
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 75.0),
//                 child: CarouselSlider(
//                     items: [
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Image.asset(
//                               "images/vector.jpeg",
//                               width: 270,
//                             ),
//                             Text(
//                               "You can see all shop around you wheather they open or not",
//                               style:
//                                   TextStyle(color: CupertinoColors.systemGrey),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Image.asset(
//                               "images/Happy Bunch - Chat.png",
//                               height: 200,
//                             ),
//                             Text(
//                               "Make Friendly with barber with stylish hair style",
//                               style:
//                                   TextStyle(color: CupertinoColors.systemGrey),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Image.asset(
//                               "images/haircutting.webp",
//                               width: 270,
//                             ),
//                             Text(
//                               "After,You can see the barber busy or not",
//                               style:
//                                   TextStyle(color: CupertinoColors.systemGrey),
//                             ),
//                           ],
//                         ),
//                       )
//                     ],
//                     carouselController: buttonCarouselController,
//                     options: CarouselOptions(
//                       pauseAutoPlayOnTouch: true,
//                       height: 400,
//                       autoPlay: true,
//                       enlargeCenterPage: true,
//                       viewportFraction: 0.9,
//                       aspectRatio: 2.0,
//                       enlargeStrategy: CenterPageEnlargeStrategy.scale,
//                       initialPage: 2,
//                     )),
//               ),
//             ],
//           ),
//           Expanded(
//             child: Align(
//               alignment: FractionalOffset.bottomCenter,
//               child: Padding(
//                 padding: EdgeInsets.only(bottom: 50.0),
//                 child: CupertinoButton(
//                   color: Colors.red,
//                   child: Text("Continue"),
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => UserAuthScreen()),
//                     );
//                   },
//                 ), //Your widget here,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
