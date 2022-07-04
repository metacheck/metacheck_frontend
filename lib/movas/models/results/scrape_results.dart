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
  final DateTime startTime;
  final DateTime? endTime;
  // list.map((e) => PageCrawlResult.fromMap(e.data(), id: e.id)).toList()
  const CrawlSession({
    required this.scrapeResults,
    required this.id,
    required this.startTime,
    required this.endTime,
  });

  factory CrawlSession.fromMap(Map<String, dynamic> map, id) {
    return CrawlSession(
      id: id,
      startTime: DateTime.parse(map["start_time"]),
      endTime: DateTime.tryParse(map["end_time"]?.toString() ?? ""),
      scrapeResults: ((map['scrape_results'] ?? [])
          .map<PageCrawlResult>((e) => PageCrawlResult.fromMap(e))).toList(),
    );
  }

  String get shortName {
    if (scrapeResults.isEmpty)
      return "DOING " + id;
    else
      return scrapeResults.map((e) => e.url).join(", ");
  }

  double? get totalScore {
    if (this.scrapeResults.isEmpty) return null;
    var max = this.scrapeResults.length * 100;
    return 100 *
        this
            .scrapeResults
            .map((e) => e.seoScore)
            .fold<double>(0, (a, b) => a + b) /
        max;
  }

  String get state => endTime == null ? "Running" : "Finished";

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CrawlSession &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;

  List? toSheet() {
    var rows = scrapeResults.map((e) => SheetRow.fromResult(e)).toList();
    List<List<dynamic>> x = [
      rows.first.names,
      for (var row in rows) row.values
    ];
    return x;
  }
}

class SheetRow {
  final List<dynamic> values;
  final List<dynamic> names;
  const SheetRow({
    required this.names,
    required this.values,
  });
  //     ❌
  //      ✅
  factory SheetRow.fromResult(PageCrawlResult result) {
    var structure = {
      "URL": result.url,
      "Meta Title": result.metaTitle,
      "<50": result.metaTitle.length > 50 ? "❌" : "✅",
      "Meta Description": result.metaDescription,
      "H1": result.h1Text.trim().isNotEmpty ? "✅" : "❌",
      "Subheadings": result.subheadingsList.length,
      "Word Count": result.wordCount.toString(),
      "Internal Links": result.links.length,
      "Featured Image": result.featuredImagePath.isNotEmpty ? "✅" : "❌",
      "SEO Score": result.seoScore.toInt(),
    };
    return SheetRow(names: [
      ...structure.keys
    ], values: [
      ...structure.values,
    ]);
  }
}

class SheetColumn {
  final String title;
  final List<dynamic> values;

  const SheetColumn({
    required this.title,
    required this.values,
  });
}
