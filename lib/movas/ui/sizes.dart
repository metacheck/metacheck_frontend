import 'package:flutter/material.dart';

class ButtonSize {
  final double small = 34.0;
  final double medium = 56.0;
  final double large = 72.0;
  final double bottom = 86.0;
}

class BorderRadiusSize {
  final double button = 16.0;
  final double textField = 10.0;
  final double textFieldSmall = 4.0;
  final double card = 16.0;
  final double imageCard = 20.0;
  final double image = 18.0;
  final double popup = 16.0;

  final double bottomSheet = 30;
}

class Spacing {
  static const _basicSpacing = 16.0;

  /// 4
  final double xxxs = 0.25 * _basicSpacing;

  /// 8
  final double xxs = 0.5 * _basicSpacing;

  /// 12
  final double xs = 0.75 * _basicSpacing;

  /// 16
  final double sm = 1 * _basicSpacing;

  /// 20
  final double sm2 = 1.25 * _basicSpacing;

  /// 24
  final double md = 1.5 * _basicSpacing;

  /// 32
  final double lg = 2 * _basicSpacing;

  /// 40
  final double xl = 2.5 * _basicSpacing;

  /// 48
  final double xxl = 3 * _basicSpacing;

  /// 64
  final double xxxl = 4 * _basicSpacing;
}

class Sizes {
  /// BUTTONS
  final ButtonSize button = ButtonSize();

  /// BORDER RADIUS
  final BorderRadiusSize borderRadius = BorderRadiusSize();

  /// SPACING
  final Spacing spacing = Spacing();
}
