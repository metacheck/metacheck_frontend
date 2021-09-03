import 'package:flutter/material.dart';
import 'package:metacheck_frontend/helpers/app_constants.dart';

class SizeUtil {
  static bool isHorizontal(BoxConstraints constraints) {
    return constraints.maxWidth > constraints.maxHeight;
  }

  static bool isTabletView(BoxConstraints constraints) {
    return constraints.maxWidth > AppConstants.DESIGN_TABLET_CUTOFF;
  }
}
