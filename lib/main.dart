import 'package:flutter/material.dart';
import 'package:metacheck_frontend/providers/providers.dart';
import 'package:movas/config/config.dart';
import 'package:provider/provider.dart';
import 'package:url_strategy/url_strategy.dart';

import 'movas/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  moveAss(MetaCheck());
}

final GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();

class MetaCheck extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
          navigatorKey: navKey,
          title: 'MetaCheck',
          routes: router.calculateAllRoutes,
          initialRoute: router
              .calculateInitialRoute //router.initialRoute, //router.calculateInitialRoute,
          ),
    );
  }
}
