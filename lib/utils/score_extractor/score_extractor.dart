import 'dart:math';
import 'dart:ui';

import 'package:metacheck_frontend/movas/models/results/single_result.dart';

abstract class ScoreExtractor {
  SectionPassType type = SectionPassType.bad;
  double _score = 0;
  String _text = "";
  double stake = 0;

  String get text => _text.isEmpty ? "Missing" : _text;

  set text(String value) {
    _text = value;
  }

  double get score => _score;

  set score(double value) {
    _score = min(110, value);
  }

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
      text = title.length.toString();

      return super.extractScore();
    }
    if (title.length >= 120) {
      score = 30;
      type = SectionPassType.bad;
      text = title.length.toString();

      return super.extractScore();
    }
    if (title.length > 68) {
      score = 80;
      type = SectionPassType.medium;
      text = title.length.toString();

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
    stake = 8;
    if (desc.length < 2) {
      return super.extractScore();
    }
    if (desc.length <= 100) {
      score = desc.length / 2;

      type = SectionPassType.medium;
    }
    if (desc.length > 100 && desc.length < 155) {
      score = 100;
      type = SectionPassType.great;

      text = "kulijada dost dobro";

      return super.extractScore();
    }

    if (desc.length > 155) {
      score = 80;

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
    stake = 7;
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

class InternalLinksExtractor extends ScoreExtractor {
  final String words;
  final int linkCount;
  final int wordCount;

  InternalLinksExtractor(this.words, this.linkCount, this.wordCount);
  // <200
  // 201 - 499
  // 500+
  @override
  SectionPass extractScore() {
    stake = 4;
    if (linkCount == 0) {
      return super.extractScore();
    }

    double factor = 500 / wordCount;

    double linksPer500 = (linkCount * factor);
    text = "$linksPer500";
    score = (1.2500 * (linksPer500 * linksPer500) + 29.75 * linksPer500) - 0.25;

    if (score < 50) {
      type = SectionPassType.bad;
    }
    if (score > 50 && score < 65) {
      type = SectionPassType.medium;
    }
    if (score >= 65) {
      type = SectionPassType.great;
    }
    score = min(score, 100);

    return super.extractScore();
  }
}

class SubheadingsExtractor extends ScoreExtractor {
  final List<Subheading> subheadings;
  final bool duplicates;
  final int wordCount;
  SubheadingsExtractor(this.subheadings, this.duplicates, this.wordCount);

  @override
  SectionPass extractScore() {
    stake = 12;
    score = 100;
    if (subheadings.isEmpty) {
      score = 0;
      type = SectionPassType.bad;
    } else {
      int expectedSubheadings = (wordCount / 180).ceil();
      if (subheadings.length < expectedSubheadings) {
        score = score * 0.8;
        if ((subheadings.length * 1.3).ceil() < expectedSubheadings) {
          type = SectionPassType.medium;
        }
      } else {
        type = SectionPassType.great;

        score = score * max(1, 1.3);
      }
    }

    if (duplicates) {
      type = SectionPassType.medium;

      score = score * 0.8;
    }

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
      text = image;
      type = SectionPassType.great;
    }

    return super.extractScore();
  }
}
