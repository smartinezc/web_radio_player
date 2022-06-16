import 'package:flutter/material.dart';

class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double screenHeight;
  static late double screenWidth;
  static double? defaultSize;
  static Orientation? orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenHeight = _mediaQueryData.size.height;
    screenWidth = _mediaQueryData.size.width;
    orientation = _mediaQueryData.orientation;
  }
}

// Get the proporcional height for the user's screen size
double getProporcionalHeight(double inputHeight) {
  // 812 is the layout height that the designer used
  return (inputHeight / 844.0) * SizeConfig.screenHeight;
}

// Get the proporcional width for the user's screen size
double getProporcionalWidth(double inputWidth) {
  // 390 is the layout width that the designer used
  return (inputWidth / 390.0) * SizeConfig.screenWidth;
}