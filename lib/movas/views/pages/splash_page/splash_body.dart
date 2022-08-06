import 'package:flutter/material.dart';
import 'package:metacheck_frontend/movas/actions/splash_action.dart';
import 'package:metacheck_frontend/movas/router.dart';
import 'package:qlevar_router/qlevar_router.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({Key? key}) : super(key: key);

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody> {
  @override
  void initState() {
    SplashAction.of(context).init().then((loggedIn) {
      if (loggedIn) {
        return QR.to(AppRoutes.homePage);
      }

      return QR.to(AppRoutes.login);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator();
  }
}
