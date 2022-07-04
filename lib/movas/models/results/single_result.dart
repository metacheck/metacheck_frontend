import 'dart:math';

import 'package:metacheck_frontend/utils/score_extractor/score_extractor.dart';

class InternalLink {
  final String href;
  final String text;

  const InternalLink({
    required this.href,
    required this.text,
  });

  bool get valid {
    try {
      return Uri.tryParse(this.href)!.isAbsolute;
    } catch (e) {}
    return false;
  }

  factory InternalLink.fromMap(Map<String, dynamic> map) {
    return InternalLink(
      href: map['href'] as String,
      text: map['text'] as String,
    );
  }
}

class PageCrawlResult {
  final String id;
  final String url;

  final String metaTitleSubtitle;
  final SectionPass metaTitleValid;
  final String metaTitle;

  final String metaDescriptionSubtitle;
  final SectionPass metaDescriptionValid;
  final String metaDescription;

  final String featuredImageSubtitle;
  final String featuredImagePath;
  final SectionPass featuredImageValid;

  final double seoScore;

  final String wordCountSubtitle;
  final SectionPass wordCountValid;
  final int wordCount;
  final String text;

  final String h1Subtitle;
  final SectionPass h1Valid;
  final String h1Text;

  final String subheadingsSubtitle;
  final SectionPass subheadingsValid;
  final SectionPass keywordsValid;
  final SectionPass linksValid;
  final List<Subheading> subheadingsList;
  final List<KeywordScore>? keywordScores;
  final List<InternalLink> links;

  PageCrawlResult({
    required this.id,
    required this.url,
    required this.linksValid,
    required this.links,
    required this.metaTitleSubtitle,
    required this.keywordsValid,
    required this.metaTitleValid,
    required this.metaTitle,
    required this.text,
    required this.metaDescriptionSubtitle,
    required this.metaDescriptionValid,
    required this.metaDescription,
    required this.featuredImageSubtitle,
    required this.featuredImagePath,
    required this.featuredImageValid,
    required this.seoScore,
    required this.wordCountSubtitle,
    required this.wordCountValid,
    required this.wordCount,
    required this.h1Subtitle,
    required this.h1Valid,
    required this.h1Text,
    required this.subheadingsSubtitle,
    required this.subheadingsValid,
    required this.subheadingsList,
    this.keywordScores,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PageCrawlResult &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;

  factory PageCrawlResult.fromMap(Map<String, dynamic> map, {String? id}) {
    var obj = PageCrawlResult(
      linksValid: SectionPass.bad(),
      links: ((map["links"] ?? []) as List)
          .map((e) => InternalLink.fromMap(e))
          .where((element) => element.valid)
          .toList(),
      url: map["url"],
      id: id ?? map["id"] ?? "id",
      text: map["text"],
      metaTitleSubtitle: map['metaTitleSubtitle'] ?? "todo missing",
      keywordsValid: map['keywordsValid'] ?? SectionPass.great(),
      metaTitleValid: map['metaTitleValid'] ?? SectionPass.bad(),
      metaTitle: map['title'] as String,
      metaDescriptionSubtitle: map['metaDescriptionSubtitle'] ?? "todo missing",
      metaDescriptionValid: map['metaDescriptionValid'] ?? SectionPass.bad(),
      metaDescription: map['description'] as String,
      featuredImageSubtitle: map['featuredImageSubtitle'] ?? "todo missing",
      featuredImagePath: (map['featuredImage'] as String),
      featuredImageValid: map['featuredImageValid'] ?? SectionPass.bad(),
      seoScore: map['seoScore'] ?? 69,
      wordCountSubtitle: map['wordCountSubtitle'] ?? "todo missing",
      wordCountValid: map['wordCountValid'] ?? SectionPass.bad(),
      wordCount: map['wordCount'] as int,
      h1Subtitle: map['h1Subtitle'] ?? "missing",
      h1Valid: map['h1Valid'] ?? SectionPass.bad(),
      h1Text: map['heading'] as String,
      subheadingsSubtitle: map['subheadingsSubtitle'] ?? "todo missing",
      subheadingsValid: map['subheadingsValid'] ?? SectionPass.bad(),
      subheadingsList: (map['headings'])
          .map<Subheading>((e) => Subheading.fromMap(e))
          .toList(),
      keywordScores: map["keyword_score"] == null
          ? null
          : (((map["keyword_score"] ?? {}) as Map<String, dynamic>)
              .entries
              .map((e) => KeywordScore(
                  keyword: e.key,
                  score: double.tryParse(e.value.toString()) ?? 0))
              .toList()
              .where((element) => element.score > 0.5)
              .toList()
            ..sort((a, b) => b.score.compareTo(a.score))),
    );
    obj = obj.calculateScore();
    return obj;
  }

  PageCrawlResult copyWith({
    String? id,
    String? url,
    String? text,
    String? metaTitleSubtitle,
    SectionPass? metaTitleValid,
    SectionPass? linksValid,
    String? metaTitle,
    String? metaDescriptionSubtitle,
    SectionPass? metaDescriptionValid,
    String? metaDescription,
    String? featuredImageSubtitle,
    String? featuredImagePath,
    SectionPass? featuredImageValid,
    double? seoScore,
    String? wordCountSubtitle,
    SectionPass? wordCountValid,
    int? wordCount,
    String? h1Subtitle,
    SectionPass? h1Valid,
    String? h1Text,
    String? subheadingsSubtitle,
    SectionPass? subheadingsValid,
    SectionPass? keywordsValid,
    List<Subheading>? subheadingsList,
    List<KeywordScore>? keywordScores,
    List<InternalLink>? links,
  }) {
    return PageCrawlResult(
      id: id ?? this.id,
      url: url ?? this.url,
      text: text ?? this.text,
      linksValid: linksValid ?? this.linksValid,
      keywordsValid: keywordsValid ?? this.keywordsValid,
      metaTitleSubtitle: metaTitleSubtitle ?? this.metaTitleSubtitle,
      metaTitleValid: metaTitleValid ?? this.metaTitleValid,
      metaTitle: metaTitle ?? this.metaTitle,
      metaDescriptionSubtitle:
          metaDescriptionSubtitle ?? this.metaDescriptionSubtitle,
      metaDescriptionValid: metaDescriptionValid ?? this.metaDescriptionValid,
      metaDescription: metaDescription ?? this.metaDescription,
      featuredImageSubtitle:
          featuredImageSubtitle ?? this.featuredImageSubtitle,
      featuredImagePath: featuredImagePath ?? this.featuredImagePath,
      featuredImageValid: featuredImageValid ?? this.featuredImageValid,
      seoScore: seoScore ?? this.seoScore,
      wordCountSubtitle: wordCountSubtitle ?? this.wordCountSubtitle,
      wordCountValid: wordCountValid ?? this.wordCountValid,
      wordCount: wordCount ?? this.wordCount,
      h1Subtitle: h1Subtitle ?? this.h1Subtitle,
      h1Valid: h1Valid ?? this.h1Valid,
      h1Text: h1Text ?? this.h1Text,
      subheadingsSubtitle: subheadingsSubtitle ?? this.subheadingsSubtitle,
      subheadingsValid: subheadingsValid ?? this.subheadingsValid,
      subheadingsList: subheadingsList ?? this.subheadingsList,
      keywordScores: keywordScores ?? this.keywordScores,
      links: links ?? this.links,
    );
  }

  Map<Type, SectionPass> get map => Map<Type, SectionPass>.from({
        FeaturedImageExtractor:
            FeaturedImageExtractor(featuredImagePath).extractScore(),
        H1ScoreExtractor: H1ScoreExtractor(h1Text).extractScore(),
        MetaDescriptionExtractor: MetaDescriptionExtractor(
          metaDescription,
        ).extractScore(),
        MetaTitleScoreExtractor:
            MetaTitleScoreExtractor(metaTitle).extractScore(),
        SubheadingsExtractor: SubheadingsExtractor(
                subheadingsList,
                subheadingsList.any((element) => element.occurences > 1),
                wordCount)
            .extractScore(),
        WordCountExtractor:
            WordCountExtractor(text, links.length, wordCount).extractScore(),
        InternalLinksExtractor:
            InternalLinksExtractor(text, links.length, wordCount)
                .extractScore(),
      });

  PageCrawlResult calculateScore() {
    Map<Type, SectionPass> secmap = map;

    return this.copyWith(
        seoScore: getScore(secmap),
        linksValid: secmap[InternalLinksExtractor],
        featuredImageValid: secmap[FeaturedImageExtractor],
        h1Valid: secmap[H1ScoreExtractor],
        metaDescriptionValid: secmap[MetaDescriptionExtractor],
        metaTitleValid: secmap[MetaTitleScoreExtractor],
        subheadingsValid: secmap[SubheadingsExtractor],
        wordCountValid: secmap[WordCountExtractor]);
  }

  double getScore(Map<Type, SectionPass> map) {
    int max = map.keys.length * 100;
    late double total;
    try {
      double totalstakes =
          map.values.map((e) => e.stake).fold(0, (double a, double b) => a + b);
      double factor = 1;
      if (totalstakes < 100) {
        factor = 100 / totalstakes;
      }

      final modified = map.values
          .map((e) => e.copyWith(stake: e.stake * factor))
          .map((e) => e);

      total = modified
          .map((e) => e.stake * (e.score / 100))
          .fold(0.0, (double a, double b) => a + b);
      return min(total, 100);
    } catch (e) {
      return 0;
    }
  }
}

class Subheading {
  final String type;
  final String text;
  final int occurences;

  const Subheading({
    required this.type,
    required this.text,
    required this.occurences,
  });

  factory Subheading.fromMap(Map<String, dynamic> map) {
    return Subheading(
      type: map['name'] as String,
      text: map['value'] as String,
      occurences: map['occurences'] ?? 1,
    );
  }
}

enum SectionPassType {
  bad,
  medium,
  great,
}

class SectionPass {
  final SectionPassType type;
  final double score;
  final String text;
  final double stake;

  SectionPass.bad()
      : type = SectionPassType.bad,
        score = 0,
        stake = 0,
        text = "";
  SectionPass.great()
      : type = SectionPassType.great,
        stake = 0,
        score = 0,
        text = "";

  const SectionPass({
    required this.type,
    required this.score,
    required this.text,
    required this.stake,
  });

  @override
  String toString() {
    return 'SectionPass{type: $type, score: $score, text: $text, stake: $stake}';
  }

  SectionPass copyWith({
    SectionPassType? type,
    double? score,
    String? text,
    double? stake,
  }) {
    return SectionPass(
      type: type ?? this.type,
      score: score ?? this.score,
      text: text ?? this.text,
      stake: stake ?? this.stake,
    );
  }
}

class KeywordScore {
  final String keyword;
  final double score;
  final int count;
  KeywordScore({
    required this.keyword,
    required this.score,
  }) : count = keyword.split(" ").length;
}
