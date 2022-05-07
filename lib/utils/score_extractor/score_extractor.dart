import 'dart:math';

import 'package:metacheck_frontend/movas/models/results/single_result.dart';

abstract class ScoreExtractor {
  SectionPassType type = SectionPassType.bad;
  double score = 0;
  String text = "";
  double stake = 0;

  SectionPass extractScore() {
    return SectionPass(score: score, text: text, stake: stake, type: type);
  }
}

class H1ScoreExtractor extends ScoreExtractor {
  final String title;

  H1ScoreExtractor(this.title);

  @override
  SectionPass extractScore() {
    stake = 10;
    if (title.trim().isNotEmpty) {
      score = 100;
      type = SectionPassType.great;
    }
    return super.extractScore();
  }
}

class MetaTitleScoreExtractor extends ScoreExtractor {
  final String title;

  MetaTitleScoreExtractor(this.title);

  @override
  SectionPass extractScore() {
    stake = 10;

    if (title.length < 20) {
      return super.extractScore();
    }

    if (title.length > 30 && title.length < 68) {
      score = (title.length / 55) * 100;
      if (title.length > 30 && title.length < 60) {
        type = SectionPassType.great;
      } else {
        type = SectionPassType.medium;
      }

      text = "kulijada dost dobro";

      return super.extractScore();
    }
    if (title.length < 30) {
      score = (title.length / 70) * 100;
      type = SectionPassType.bad;
      text = "bad";

      return super.extractScore();
    }

    if (title.length > 68) {
      score = (title.length / 70) * 100;
      type = SectionPassType.bad;
      text = "bad";

      return super.extractScore();
    }
    return super.extractScore();
  }
}

class MetaDescriptionExtractor extends ScoreExtractor {
  final String desc;
  MetaDescriptionExtractor(
    this.desc,
  );

  // nedobro: <100 ili >155
  // dobro: izmedu 101 i 154
  // full lose: nema ga uopce, iliti missing

  @override
  SectionPass extractScore() {
    stake = 30;
    if (desc.length < 2) {
      return super.extractScore();
    }
    if (desc.length > 100 && desc.length < 155) {
      score = 100;
      type = SectionPassType.great;

      text = "kulijada dost dobro";

      return super.extractScore();
    }

    if (desc.length > 155 || desc.length <= 100) {
      score = 50;

      type = SectionPassType.medium;
    }

    return super.extractScore();
  }
}

class WordCountExtractor extends ScoreExtractor {
  final String words;
  final int linkCount;
  final int wordCount;

  WordCountExtractor(this.words, this.linkCount, this.wordCount);
  // <200
  // 201 - 499
  // 500+
  @override
  SectionPass extractScore() {
    stake = 20;
    if (wordCount == 0) {
      return super.extractScore();
    }

    double linksScore = 0;
    int expectedLinks = (wordCount / 250).ceil();
    score = (wordCount / max(wordCount, 500)) * 80;
    if (linkCount != 0 && expectedLinks != 0) {
      linksScore = (linkCount / max(linkCount, expectedLinks)) * 20;
    }

    if (wordCount < 200) {
      type = SectionPassType.bad;
      score += linksScore;
      return super.extractScore();
    }

    if (wordCount <= 499) {
      score += linksScore;
      type = SectionPassType.medium;
      return super.extractScore();
    }
    if (wordCount > 499) {
      if ((linkCount * 1.5).ceil() > expectedLinks) {
        linksScore = linksScore * 1.2;
      }

      score += linksScore;
      type = SectionPassType.great;
      return super.extractScore();
    }

    return super.extractScore();
  }
}

class SubheadingsExtractor extends ScoreExtractor {
  final List<Subheading> subheadings;
  final bool duplicates;

  SubheadingsExtractor(this.subheadings, this.duplicates);

  @override
  SectionPass extractScore() {
    stake = 5;
    score = 100;
    return super.extractScore();
  }
}

class FeaturedImageExtractor extends ScoreExtractor {
  final String image;

  FeaturedImageExtractor(this.image);

  @override
  SectionPass extractScore() {
    stake = 5;
    if (image.isNotEmpty && image.contains("http")) {
      score = 100;
      type = SectionPassType.great;
    }

    return super.extractScore();
  }
}
