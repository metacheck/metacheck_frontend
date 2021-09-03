import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:metacheck_frontend/helpers/app_constants.dart';

class PlatformWidgetLoader extends StatelessWidget {
  final Widget webView;
  final Widget mobileView;
  final Widget tabletView;
  final bool shouldCenterMobileView;

  /// Set this to true where you are using the same widget for mobile and web
  final bool constrainWebView;

  PlatformWidgetLoader({
    required this.webView,
    required this.mobileView,
    required this.tabletView,
    this.constrainWebView = false,
    this.shouldCenterMobileView = true,
  });

  @override
  Widget build(BuildContext context) {
    if (kIsWeb)
      return LayoutBuilder(builder: (_, constraints) {
        /// If the constrained width < height, we are in vertical orientation
        /// For this case we should return the mobile view

        if (constraints.maxWidth < constraints.maxHeight) {
          /// If the tablet cutoff is exceeded by the maxWidth then tablet
          /// view should be preferred if available

          if ((constraints.maxWidth > AppConstants.DESIGN_TABLET_CUTOFF) &&
              (tabletView != null)) return tabletView;

          final child = ConstrainedBox(
              constraints:
                  BoxConstraints(maxWidth: AppConstants.DESIGN_REF_WIDTH),
              child: mobileView);

          if (shouldCenterMobileView)
            return Center(
              child: child,
            );
          else
            return child;
        }

        if (constraints.maxWidth < 600) return mobileView;
        if (constrainWebView)
          return ConstrainedBox(
            constraints:
                BoxConstraints(maxWidth: AppConstants.DESIGN_REF_WIDTH),
            child: webView,
          );
        return webView;
      });

    return mobileView;
  }
}
