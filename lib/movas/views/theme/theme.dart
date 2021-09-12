import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:movas/movas.dart';

abstract class BaseTheme {
  Color get primaryColor;
  Color get accentColor;
  Color get backgroundColor;
  Color get secondaryBackgoundColor;
  TextStyle get baseTextStyle;
  factory BaseTheme.of(context) => LightTheme();
}

class LightTheme implements BaseTheme {
  @override
  // TODO: implement accentColor
  Color get accentColor => Color(0xff00b4cc);

  @override
  // TODO: implement backgroundColor
  Color get backgroundColor => Colors.white;

  @override
  // TODO: implement primaryColor
  Color get primaryColor => Color(0xff00b4cc);

  @override
  // TODO: implement secondaryBackgoundColor
  Color get secondaryBackgoundColor => Color(0xfffafafa);


  @override
  // TODO: implement baseTextStyle
  TextStyle get baseTextStyle => TextStyle(fontSize: 14,fontFamily: "Raleway");
}
