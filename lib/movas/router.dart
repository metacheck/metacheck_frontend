import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:metacheck_frontend/movas/views/pages/home_page/home_page.dart';
import 'package:movas/router/router.dart' as movas;

var router = movas.Router(
  useDemo: true,
  routes: {},
  initialRoute: DemoRouteName.home,
  demoRoutes: {
    DemoRouteName.home: (c) => HomePage(),
  },
);

class RouteName {}

class DemoRouteName {
  static const home = "demohome";
}

class FadeTransitionRouteBuilder extends PageRouteBuilder {
  FadeTransitionRouteBuilder(Widget page, {Duration? duration})
      : super(
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return page;
          },
          transitionDuration: duration ?? Duration(milliseconds: 500),
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            return Align(
              child: FadeTransition(
                opacity: animation,
                child: child,
              ),
            );
          },
        );
}

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final routingData = settings.name!.getRoutingData;

    switch (routingData.route) {
      //Add route related data here

      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => Scaffold(
            body: Text("Page not found"),
          ),
        );
    }
  }
}

class RoutingData {
  final String? route;
  final Map<String, String>? _queryParameters;
  RoutingData({
    this.route,
    Map<String, String>? queryParameters,
  }) : _queryParameters = queryParameters;
  operator [](String key) => _queryParameters![key];
}

extension StringExtension on String {
  RoutingData get getRoutingData {
    var uriData = Uri.parse(this);
    print('queryParameters: ${uriData.queryParameters} path: ${uriData.path}');
    return RoutingData(
      queryParameters: uriData.queryParameters,
      route: uriData.path,
    );
  }
}
