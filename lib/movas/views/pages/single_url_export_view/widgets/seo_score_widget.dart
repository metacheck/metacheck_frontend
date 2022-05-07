import 'package:flutter/material.dart';
import 'package:metacheck_frontend/movas/views/theme/theme.dart';

import '../single_url_export_page.dart';

class SeoScoreWidget extends StatelessWidget {
  final int score;

  SeoScoreWidget(this.score);

  @override
  Widget build(BuildContext context) {
    final base = OATheme.of(context).baseTextStyle;

    return Container(
      height: baseHeight,
      width: double.maxFinite,
      padding: EdgeInsets.all(8),
      child: Column(
        children: [
          Expanded(
            flex: 5,
            child: FittedBox(
              child: Text(
                "$score/100",
                style: TextStyle().copyWith(fontWeight: FontWeight.w900),
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Expanded(
            flex: 3,
            child: FittedBox(
              child: Text(
                "SEO SCORE",
                style: TextStyle(
                    fontFamily: "Roboto", fontWeight: FontWeight.w100),
              ),
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
          border: Border.all(color: OATheme.of(context).primaryColor)),
    );
  }
}
