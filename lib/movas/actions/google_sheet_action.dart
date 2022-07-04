import 'dart:convert';

import 'package:metacheck_frontend/movas/models/results/scrape_results.dart';
import 'dart:js' as js;

import '../../helpers/logger.dart';

class GoogleSheetA {
  Future<void> createSheet(CrawlSession crawlSession) async {
    var res = await js.context
        .callMethod('handleAuthClick', [jsonEncode(crawlSession.toSheet())]);
    logger.info("res is $res");
  }

  factory GoogleSheetA.of(context) => GoogleSheetA();

  GoogleSheetA();
}
