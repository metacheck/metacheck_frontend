import 'package:flutter/material.dart';
import 'package:metacheck_frontend/movas/ui/sizes.dart';
import 'package:metacheck_frontend/movas/ui/themes.dart';

class UI {
  static const double CONTENT_MAX_WIDTH = 350.0;
  static Sizes sizes = Sizes();
  static Themes themes = Themes();
}

extension SpacingBox on double {
  /// vertical
  SizedBox get v => SizedBox(
        height: this,
      );

  /// horizontal
  SizedBox get h => SizedBox(
        width: this,
      );
}

class ConstrainedContent extends StatelessWidget {
  final Widget child;

  const ConstrainedContent({
    required this.child,
  });
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: UI.CONTENT_MAX_WIDTH),
      child: child,
    );
  }
}
