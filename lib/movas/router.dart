import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:metacheck_frontend/main.dart';
import 'package:metacheck_frontend/movas/actions/scrape_action.dart';
import 'package:metacheck_frontend/movas/views/pages/home_page/home_page.dart';
import 'package:metacheck_frontend/movas/views/pages/sessions_page/crawl_sessions_page.dart';
import 'package:metacheck_frontend/movas/views/pages/single_url_export_view/single_url_export_page.dart';
import 'package:qlevar_router/qlevar_router.dart';

import '../helpers/logger.dart';

class AppRoutes {
  static String homePage = '/home';
  static String exportPage = '/export';
  static String sessions = '/sessions';

  final routes = [
    QRoute(
        pageType: QFadePage(
          transitionDurationMilliseconds: 300,
        ),
        name: homePage,
        path: '/',
        builder: () => HomePage()),
    QRoute(
        pageType: QFadePage(
          transitionDurationMilliseconds: 300,
        ),
        name: sessions,
        path: '/sessions',
        builder: () => CrawlSessionsPage()),
    QRoute(
        name: exportPage,
        pageType: QFadePage(
          transitionDurationMilliseconds: 300,
        ),
        path: 'result/:id',
        middleware: [ExportMiddleware()],
        builder: () => SingleUrlExportPage()),
  ];
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
