import 'package:flutter/cupertino.dart';
import 'package:shalong/StartingScreen/constants/constants.dart';


class Slider {
  final String sliderImageUrl;
  final String sliderHeading;
  final String sliderSubHeading;

  Slider(
      {required this.sliderImageUrl,
      required this.sliderHeading,
      required this.sliderSubHeading});
}

final sliderArrayList = [
    Slider(
        sliderImageUrl: 'images/vector.jpeg',
        sliderHeading: Constants.SLIDER_HEADING_1,
        sliderSubHeading: Constants.SLIDER_DESC1),
    Slider(
        sliderImageUrl: 'images/Happy Bunch - Chat.png',
        sliderHeading: Constants.SLIDER_HEADING_2,
        sliderSubHeading: Constants.SLIDER_DESC2),
    Slider(
        sliderImageUrl: 'images/haircutting.webp',
        sliderHeading: Constants.SLIDER_HEADING_3,
        sliderSubHeading: Constants.SLIDER_DESC3),
  ];
