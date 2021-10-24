


import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StartingScreen extends StatefulWidget {
  const StartingScreen({Key? key}) : super(key: key);

  @override
  _StartingScreenState createState() => _StartingScreenState();
}

class _StartingScreenState extends State<StartingScreen> {
  CarouselController buttonCarouselController = CarouselController();

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            CarouselSlider(
                items: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("images/vector.jpeg"),
                      Padding(
                        padding: const EdgeInsets.only(left: 47.0, right: 47),
                        child: Text(
                          "You can see all shop around you wheather they open or not",
                          style: TextStyle(color: CupertinoColors.systemGrey),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "images/Happy Bunch - Chat.png",
                          height: 270,
                        ),
                        Text(
                          "Make Friendly with barber with stylish hair style",
                          style: TextStyle(color: CupertinoColors.systemGrey),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("images/haircutting.webp"),
                        Text(
                          "After,You can see the barber busy or not",
                          style: TextStyle(color: CupertinoColors.systemGrey),
                        ),
                      ],
                    ),
                  )
                ],
                carouselController: buttonCarouselController,
                options: CarouselOptions(
                  // autoPlayInterval: Duration(
                  //   milliseconds: 10
                  // ),
                  // autoPlayAnimationDuration: Duration(
                  //   milliseconds: 10
                  // ),
                  pauseAutoPlayOnTouch : true,
                  height: 400,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  viewportFraction: 0.9,
                  aspectRatio: 2.0,
                  enlargeStrategy : CenterPageEnlargeStrategy.scale,
                  initialPage: 2,
                ))
          ],
        ),
      );
    }
  }

