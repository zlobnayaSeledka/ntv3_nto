import 'package:flutter/material.dart';
class CustomAppTheme{
  static Color mainColor = const Color(0xff009b72); //Color(0xffbc264b); //Colors.black; // const Color(0xffb0d197);//Colors.limeAccent.shade400;
  static Color secondColor = const Color(0xffa6d2ff); //Color(0xff9cb7d4);
  static Color descriptionTextColor = Colors.grey.shade500;
  static Color mainTextColor = Colors.black;
  static Color backgroundColor = Colors.white;
  static Color errorColor = const  Color(0xffbc264b); //Colors.red;

  static String mainFont = 'Gilory';
  static String mainFontBold = 'Gilory_Bold';
  static String mainFontLight = 'Gilory_Light';

  static BoxShadow mainShadow =
    const BoxShadow(color: Color(0xfff0f0f0), spreadRadius: 4.0, blurRadius: 7.0);

  static double mainBorderRadius = 10.0;
}

