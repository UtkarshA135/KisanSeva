import 'package:flutter/material.dart';

ThemeData darktheme() {
  return ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Color(0xff212224),
    textTheme: TextTheme(
      headline4: TextStyle(fontSize: 23.0, fontWeight: FontWeight.bold),
      headline5: TextStyle(fontSize: 23.0, fontWeight: FontWeight.w200),
    ),
  );
}

ThemeData lighttheme() {
  return ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Color(0xffd6d6d6),
    textTheme: TextTheme(
      headline4: TextStyle(fontSize: 23.0, fontWeight: FontWeight.bold),
      headline5: TextStyle(fontSize: 23.0, fontWeight: FontWeight.w200),
    ),
  );
}

//dark
//0xff212224
//0xfffa5235
//0xff3d3d3d
//#3e3f41

//light
//sc #d6d6d6
//#f95309
//#e8e8e8
//#828282
