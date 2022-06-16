import 'package:flutter/material.dart';

import './size_config.dart';

// Colors
const kPrimaryColor = Color(0xFF3EE78D);
const kPrimaryLightColor = Color(0xFFFFFFFF);
const kSecondaryColor = Color(0xFF3FC1A0);
const kTextColor = Color(0xFFFFFFFF);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [kPrimaryColor, kSecondaryColor],
);

// Time and Durations
const defDuration = Duration(milliseconds: 250);
const kAnimationDuration = Duration(milliseconds: 200);

// Styling
final defScreenPadding = EdgeInsets.symmetric(horizontal: getProporcionalWidth(34));
final defWidgetMargin = EdgeInsets.all(getProporcionalWidth(14));
const defBorderRadius = BorderRadius.all(Radius.circular(20));
const defBorderCircle = BorderRadius.all(Radius.circular(500));
final headingStyle = TextStyle(
  fontSize: getProporcionalWidth(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);
OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProporcionalWidth(15)),
    borderSide: const BorderSide(color: kTextColor),
  );
}