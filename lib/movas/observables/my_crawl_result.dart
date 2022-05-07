import 'package:metacheck_frontend/movas/models/results/scrape_results.dart';
import 'package:metacheck_frontend/movas/models/results/single_result.dart';

// part 'my_crawl_result.freezed.dart';
//
// @freezed
// class MyCrawlResultO with _$MyCrawlResultO {
//   const factory MyCrawlResultO({
//     required PageCrawlResult? pageCrawlResult,
//   }) = _MyCrawlResultO;
//
//   factory MyCrawlResultO.fromJson(Map<String, Object?> json) =>
//       _$MyCrawlResultOFromJson(json);
// }

class MyCrawlResultO {
  final PageCrawlResult? pageCrawlResult;

  const MyCrawlResultO({
    this.pageCrawlResult,
  });
}

class MyCrawlSessionsO {
  final List<CrawlSession> sessions;

  const MyCrawlSessionsO({
    this.sessions = const [],
  });
}

class MyCrawlSessionO {
  final CrawlSession? session;

  const MyCrawlSessionO({
    this.session,
  });
}
