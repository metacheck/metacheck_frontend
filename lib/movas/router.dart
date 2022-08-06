import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:metacheck_frontend/extension/provider_ext.dart';
import 'package:metacheck_frontend/main.dart';
import 'package:metacheck_frontend/movas/actions/scrape_action.dart';
import 'package:metacheck_frontend/movas/actions/splash_action.dart';
import 'package:metacheck_frontend/movas/observables/user_observable.dart';
import 'package:metacheck_frontend/movas/views/pages/home_page/home_page.dart';
import 'package:metacheck_frontend/movas/views/pages/sessions_page/crawl_sessions_page.dart';
import 'package:metacheck_frontend/movas/views/pages/sign_in_page/sign_in_page.dart';
import 'package:metacheck_frontend/movas/views/pages/sign_up_page/sign_up_page.dart';
import 'package:metacheck_frontend/movas/views/pages/single_url_export_view/single_url_export_page.dart';
import 'package:metacheck_frontend/movas/views/pages/splash_page/splash_page.dart';
import 'package:movas/movas.dart';
import 'package:qlevar_router/qlevar_router.dart';

import '../helpers/logger.dart';

class AppRoutes {
  static String homePage = '/home';
  static String splash = '';
  static String exportPage = '/export';
  static String sessions = '/sessions';
  static String login = '/login';
  static String register = '/register';

  final routes = [
    QRoute(
        pageType: qFadePage(),
        name: sessions,
        path: sessions,
        middleware: [AuthMiddleware()],
        builder: () => const CrawlSessionsPage()),
    QRoute(
        pageType: qFadePage(),
        name: homePage,
        path: homePage,
        middleware: [AuthMiddleware()],
        builder: () => HomePage()),
    QRoute(
        pageType: qFadePage(),
        name: login,
        path: login,
        builder: () => const SignInPage()),
    QRoute(
        pageType: qFadePage(),
        name: register,
        path: register,
        builder: () => const SignUpPage()),
    QRoute(
        name: exportPage,
        pageType: qFadePage(),
        path: 'result/:id',
        middleware: [AuthMiddleware(), ExportMiddleware()],
        builder: () => const SingleUrlExportPage()),
  ]
      .map((e) =>
          e.copyWith(middleware: [InitializedMiddleware(), ...?e.middleware]))
      .toList()
    ..add(
      QRoute(
          pageType: qFadePage(),
          name: splash,
          path: splash,
          middleware: [],
          builder: () => const SplashPage()),
    );

  static QFadePage qFadePage() {
    return const QFadePage(
      transitionDurationMilliseconds: 300,
    );
  }
}

class InitializedMiddleware extends QMiddleware {
  @override
  Future<bool> canPop() async => true;
  @override
  Future<String?> redirectGuard(String path) async {
    if (initialized == false) {
      return AppRoutes.splash;
    }
    return null;
  }
}

class ExportMiddleware extends QMiddleware {
  @override
  Future<bool> canPop() async => true;
  @override
  Future<String?> redirectGuard(String path) async {
    return null;
  }

  @override
  Future onEnter() {
    logger.info("on match");
    var id = QR.params['id'];
    ScrapeAction.of(navKey.currentContext!).selectCrawlSession(id.toString());
    return super.onEnter();
  }
}

class AuthMiddleware extends QMiddleware {
  @override
  Future<bool> canPop() async => true;
  @override
  Future<String?> redirectGuard(String path) async {
    final UserO user = get<UserO>();
    if (user.userState == UserState.loggedOut) {
      return AppRoutes.login;
    }

    return null;
  }

  @override
  Future onEnter() {
    return super.onEnter();
  }
}

class FadeTransitionRouteBuilder extends PageRouteBuilder {
  FadeTransitionRouteBuilder(Widget page, {Duration? duration})
      : super(
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return page;
          },
          transitionDuration: duration ?? const Duration(milliseconds: 500),
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
