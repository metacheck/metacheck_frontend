import 'package:collection/collection.dart';
import 'package:metacheck_frontend/helpers/logger.dart';
import 'package:metacheck_frontend/movas/models/results/scrape_results.dart';
import 'package:metacheck_frontend/movas/models/results/single_result.dart';
import 'package:metacheck_frontend/movas/observables/my_crawl_result.dart';
import 'package:movas/movas.dart';
import 'package:movas/provider/provider.dart';

class CrawlResultStore
    extends Store3<MyCrawlResultO, MyCrawlSessionO, MyCrawlSessionsO> {
  String? _selectedCrawlSession;
  ScrapeResultsE? _latest;
  CrawlResultStore(PublishSubject<ScrapeResultsE> scrapeResultsE$) {
    add(MyCrawlResultO(pageCrawlResult: null));
    add(MyCrawlSessionO());
    add(MyCrawlSessionsO());
    scrapeResultsE$.listen((value) {
      add(MyCrawlSessionsO(
          sessions: value.crawlSessions.toList()
            ..sort((a, b) => b.startTime.compareTo(a.startTime))));
      _latest = value;
      _updateObservable();
    });
  }

  void selectCrawlResult(PageCrawlResult? crawlResult) {
    crawlResult?.map?.forEach((key, value) {
      print(key.toString() + " " + value.toString());
    });
    print(crawlResult?.seoScore ?? 0);
    add(MyCrawlResultO(pageCrawlResult: crawlResult));
  }

  void selectCrawlSession(String id) {
    _selectedCrawlSession = id;
    logger.info(id);
    _updateObservable();
  }

  void _updateObservable() {
    if (_latest == null) {
      add(MyCrawlSessionsO());
    } else {
      var session = _latest!.crawlSessions
          .firstWhereOrNull((element) => element.id == _selectedCrawlSession);
      add(MyCrawlSessionO(session: session));

      selectCrawlResult(session?.scrapeResults.firstOrNull);
    }
  }
}
