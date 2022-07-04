import 'package:metacheck_frontend/helpers/logger.dart';
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

  MyCrawlSessionsO({
    this.sessions = const [],
  }) {
    // var doing = sessions
    //     .where((element) => element.scrapeResults.isEmpty)
    //     .length
    //     .toString();
    // logger.info("DOING " + doing);
    //
    // if (doing == "0") {
    //   print("All done at:" + DateTime.now().toString());
    // }
    //
    // logger.info("DONE " +
    //     sessions
    //         .where((element) => element.scrapeResults.isNotEmpty)
    //         .length
    //         .toString());
  }
}

class MyCrawlSessionO {
  final CrawlSession? session;

  const MyCrawlSessionO({
    this.session,
  });
}
