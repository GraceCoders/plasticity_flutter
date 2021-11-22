import 'package:flutter/material.dart';

import 'colors.dart';


ThemeData lightTheme = ThemeData(
  primarySwatch: Colors.blue,
  accentColor: Color(0xffFF6F03),
  primaryColorDark: kColorPrimaryLight,

  brightness: Brightness.light,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  primaryColor: kColorPrimary,
  primaryColorBrightness: Brightness.light,
 // canvasColor: kDarkWhite,
  accentColorBrightness: Brightness.light,
  scaffoldBackgroundColor: Colors.white,
  bottomAppBarColor: Color(0xffFF6F03),
  cardColor: Color(0xaaF5E0C3),
  appBarTheme: AppBarTheme(
      actionsIconTheme: IconThemeData(color: Colors.black),
      iconTheme: IconThemeData(color: Colors.black),
      backgroundColor: Colors.white,
      elevation: 0.0,
      titleTextStyle: TextStyle(
          color: Colors.black, fontSize: 18, fontWeight: FontWeight.w800)),
  dividerColor: Color(0x1f6D42CE),
  //focusColor: Color(0x1aF5E0C3),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  primaryColor: Color(0xffFF6F03),
  primaryColorBrightness: Brightness.dark,
  primaryColorLight: Color(0x1aFF6F03),
  primaryColorDark: Color(0xffFF6F03),
  canvasColor: kDarkWhite,
  accentColor: Color(0xff457BE0),
  accentColorBrightness: Brightness.dark,
  scaffoldBackgroundColor: Color(0xffB5BFD3),
  bottomAppBarColor: Color(0xff6D42CE),
  cardColor: Color(0xaa311F06),
  dividerColor: Color(0x1f6D42CE),
  focusColor: Color(0x1a311F06),
);
