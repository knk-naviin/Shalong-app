


import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shalong/UserAuthentication/UserAuthScreen.dart';

class StartingScreen extends StatefulWidget {
  const StartingScreen({Key? key}) : super(key: key);

  @override
  _StartingScreenState createState() => _StartingScreenState();
}

//
// final List<Map> robot = [
//   {
//     "name": "Image1",
//     "image": 'images/vector.jpeg',
//     "routeName": "/image1Dashboard"
//   },
//   {
//     "name": "Image2",
//     "image": 'images/vector2.jpeg',
//     "routeName": "/image2Dashboard"
//   },
//   {
//     "name": "Simulation",
//     "image": 'images/barberbusy.jpg',
//     "routeName": "/simDashboard"
//   },
//
// ];
//


class _StartingScreenState extends State<StartingScreen> {
  CarouselController buttonCarouselController = CarouselController();



    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.white,
        // body : Column(
        //     children: [ Container(
        //       // margin: EdgeInsets.symmetric(horizontal: 5),
        //         alignment: Alignment.center,
        //         child: CarouselSlider(
        //           carouselController: buttonCarouselController,
        //           options: CarouselOptions(
        //             height: 400,
        //             // aspectRatio: 2,
        //
        //             enlargeCenterPage: true,
        //             enableInfiniteScroll: false,
        //             viewportFraction: .5,
        //             initialPage: 0,
        //             autoPlay: true,
        //             autoPlayInterval: Duration(seconds: 4),
        //             autoPlayCurve: Curves.fastOutSlowIn,
        //             enlargeStrategy: CenterPageEnlargeStrategy.scale,
        //           ),
        //           items: imageSliders(),
        //         )),
        //       Padding(
        //         padding: const EdgeInsets.only(top: 300.0),
        //         child: SizedBox(
        //           width: 200,
        //           child: CupertinoButton(
        //             color: CupertinoColors.systemRed,
        //             onPressed: (){
        //               buttonCarouselController.nextPage(
        //                   duration: Duration(milliseconds: 300), curve: Curves.linear);
        //               Navigator.of(context).pushReplacementNamed('/userauthscreen');
        //             },
        //             child: Text(
        //               '→',
        //               style: TextStyle(fontSize: 20),
        //             ),
        //           ),
        //         ),
        //       )
        //     ]
        // ),
        body: Column(children: [
          Padding(
            padding: const EdgeInsets.only(top: 80),
            child: CarouselSlider(
                items: [
                  Padding(
                    padding: const EdgeInsets.only(top: 28.0),
                    child: Column(
                      children: [
                        Image.asset("images/vector.jpeg"),
                        Padding(
                          padding: const EdgeInsets.only(left: 47.0, right: 47),
                          child: Text(
                            "You can see all shop around you wheather they open or not",
                            style: TextStyle(
                                fontSize: 20, color: CupertinoColors.systemGrey),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Column(
                      children: [
                        Image.asset("images/Happy Bunch - Chat.png",height: 270,),
                        Text(
                          "Make Friendly with barber with stylish hair style",
                          style: TextStyle(
                              fontSize: 20, color: CupertinoColors.systemGrey),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Column(
                      children: [
                        Image.asset("images/barberbusy.jpg"),
                        Text(
                          "After,You can see the barber busy or not",
                          style: TextStyle(
                              fontSize: 20, color: CupertinoColors.systemGrey),
                        ),
                      ],
                    ),
                  )
                ],
                carouselController: buttonCarouselController,
                options: CarouselOptions(
                  height: 400,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  viewportFraction: 0.9,
                  aspectRatio: 2.0,
                  initialPage: 2,
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 300.0),
            child: SizedBox(
              width: 270,
              child: CupertinoButton(
                color: CupertinoColors.systemRed,
                onPressed: () => Navigator.of(context)
          .pushReplacementNamed("/userauthscreen"),
                child: Text(
                  'Continue →',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          )
        ]),
      );
    }
  }

