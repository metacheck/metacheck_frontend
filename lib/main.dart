import 'dart:io';
import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:metacheck_frontend/movas/ui/ui_consts.dart';
import 'package:metacheck_frontend/providers/providers.dart';
import 'package:movas/config/config.dart';
import 'package:provider/provider.dart';
import 'package:qlevar_router/qlevar_router.dart';

import 'firebase_options.dart';
import 'movas/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  QR.setUrlStrategy();
  moveAss(MetaCheck());
}

final GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

class MetaCheck extends StatelessWidget {
  final parser = QRouteInformationParser();
  final routerDelegate =
      QRouterDelegate(AppRoutes().routes, initPath: AppRoutes.splash);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp.router(
        scrollBehavior: MyCustomScrollBehavior(),

        key: navKey, theme: UI.themes.light(context),
        routeInformationParser: parser,
        routerDelegate: routerDelegate,
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          FormBuilderLocalizations.delegate,
          ...AppLocalizations.localizationsDelegates
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        title: 'MetaCheck',
        //router.initialRoute, //router.calculateInitialRoute,
      ),
    );
  }
}

class MCAppLocalizations {
  static AppLocalizations of(context) => AppLocalizations.of(context)!;
}
