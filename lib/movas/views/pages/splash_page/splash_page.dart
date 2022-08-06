import 'package:flutter/material.dart';
import 'package:metacheck_frontend/movas/views/pages/splash_page/splash_body.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashBody(),
    );
  }
}
