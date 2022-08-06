import 'package:metacheck_frontend/extension/provider_ext.dart';
import 'package:metacheck_frontend/movas/models/results/single_result.dart';
import 'package:metacheck_frontend/movas/observables/my_crawl_result.dart';
import 'package:metacheck_frontend/movas/observables/user_observable.dart';
import 'package:metacheck_frontend/movas/services/crawl/crawl_service.dart';
import 'package:metacheck_frontend/movas/services/crawl/requests/generate_meta_desc_request.dart';
import 'package:metacheck_frontend/movas/services/crawl/requests/start_crawl_session_request.dart';
import 'package:metacheck_frontend/movas/services/crawl/scrape_results_service.dart';
import 'package:metacheck_frontend/movas/stores/crawl_result_store.dart';
import 'package:movas/movas.dart';

import '../services/crawl/requests/crawl_request.dart';

class ScrapeAction {
  final CrawlService crawlService;
  final ScrapeResultsService scrapeResultsService;
  final CrawlResultStore crawlResultStore;
  ScrapeAction(
      this.crawlService, this.scrapeResultsService, this.crawlResultStore);

  Future<String> startScrape(List<String> urls) {
    return crawlService
        .startScrapeSession(StartCrawlSessionRequest(urls, get<UserO>().uid!));
  }

  Future<String> startMetaDescGeneration() {
    return crawlService.startMetaDescGeneration(MetaDescGenRequest(
        get<MyCrawlResultO>().pageCrawlResult!.id,
        get<MyCrawlSessionO>().session!.id,
        get<UserO>().uid!));
  }

  factory ScrapeAction.of(context) => ScrapeAction(
        StaticProvider.of(context),
        StaticProvider.of(context),
        StaticProvider.of(context),
      );

  Future<void> selectCrawlSession(String id) async {
    crawlResultStore.selectCrawlSession(id);
  }

  Future<void> selectSingleResult(PageCrawlResult? crawlResult) async {
    crawlResultStore.selectCrawlResult(crawlResult);
  }
}
