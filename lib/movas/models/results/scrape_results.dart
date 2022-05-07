import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:metacheck_frontend/movas/models/results/single_result.dart';

class ScrapeResultsE {
  final List<CrawlSession> crawlSessions;

  ScrapeResultsE(this.crawlSessions);

  factory ScrapeResultsE.fromList(
      List<QueryDocumentSnapshot<Map<String, dynamic>>> list) {
    return ScrapeResultsE(
        list.map((e) => CrawlSession.fromMap(e.data(), e.id)).toList());
  }
}

class CrawlSession {
  final List<PageCrawlResult> scrapeResults;
  final String id;
  // list.map((e) => PageCrawlResult.fromMap(e.data(), id: e.id)).toList()
  const CrawlSession({
    required this.scrapeResults,
    required this.id,
  });

  factory CrawlSession.fromMap(Map<String, dynamic> map, id) {
    return CrawlSession(
      id: id,
      scrapeResults: ((map['scrape_results'] ?? [])
          .map<PageCrawlResult>((e) => PageCrawlResult.fromMap(e))).toList(),
    );
  }

  String get shortName {
    if (scrapeResults.isEmpty)
      return id;
    else
      return scrapeResults.map((e) => e.url).join(", ");
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CrawlSession &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;
}
