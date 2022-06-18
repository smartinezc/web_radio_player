import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './constants.dart';


ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: kSecondaryColor,
    primaryColor: kPrimaryColor,
    fontFamily: "Poppins",
    appBarTheme: appBarTheme(),
    textTheme: textTheme(),
    inputDecorationTheme: inputDecorationTheme(),
    iconTheme: iconTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
    color: Colors.white,
    elevation: 0,
    systemOverlayStyle: SystemUiOverlayStyle.dark,
    iconTheme: const IconThemeData(color: Colors.black),
    toolbarTextStyle: const TextTheme(
      headline6: TextStyle(
        color: Color(0XFF8B8B8B),
        fontSize: 18,
      ),
    ).bodyText2,
    titleTextStyle: const TextTheme(
      headline6: TextStyle(
        color: Color(0XFF8B8B8B),
        fontSize: 18,
      ),
    ).headline6,
  );
}

InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(28),
    borderSide: const BorderSide(color: kTextColor),
    gapPadding: 10,
  );
  return InputDecorationTheme(
    floatingLabelBehavior: FloatingLabelBehavior.always,
    contentPadding: const EdgeInsets.symmetric(horizontal: 42, vertical: 20),
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    border: outlineInputBorder,
  );
}

TextTheme textTheme() {
  return const TextTheme(
    bodyText1: TextStyle(color: kTextColor),
    bodyText2: TextStyle(color: kTextColor),
  );
}

IconThemeData iconTheme() {
  return const IconThemeData(
    size: 28,
    color: kTextColor,
  );
}

