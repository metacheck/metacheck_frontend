import 'dart:math';

import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:metacheck_frontend/helpers/app_constants.dart';
import 'package:metacheck_frontend/movas/actions/scrape_action.dart';
import 'package:metacheck_frontend/movas/models/results/single_result.dart';
import 'package:metacheck_frontend/movas/observables/my_crawl_result.dart';
import 'package:metacheck_frontend/movas/views/pages/single_url_export_view/widgets/basic_result_widget.dart';
import 'package:metacheck_frontend/movas/views/pages/single_url_export_view/widgets/seo_score_widget.dart';
import 'package:metacheck_frontend/movas/views/theme/theme.dart';
import 'package:metacheck_frontend/movas/views/widgets/navigation/top_nav_web.dart';
import 'package:metacheck_frontend/utils/loading_action.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

var baseHeight = 130.0;

class SingleUrlExportPage extends StatelessWidget {
  const SingleUrlExportPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final base = OATheme.of(context).baseTextStyle;

    var verticalSpacing = SizedBox(
      height: 60,
    );
    var mock = MyCrawlResultO(
        pageCrawlResult: PageCrawlResult(
            text: "ss",
            url: "test.com",
            id: "vfejif",
            metaTitleSubtitle: "metaTitleSubtitle",
            metaTitleValid: SectionPass.bad(),
            metaTitle: "metaTitle",
            metaDescriptionSubtitle: "metaDescriptionSubtitle",
            metaDescriptionValid: SectionPass.bad(),
            metaDescription: "metaDescription",
            featuredImageSubtitle: "featuredImageSubtitle",
            featuredImagePath: "featuredImagePath",
            featuredImageValid: SectionPass.bad(),
            seoScore: 11,
            wordCountSubtitle: "wordCountSubtitle",
            wordCountValid: SectionPass.bad(),
            wordCount: 11,
            h1Subtitle: "h1Subtitle",
            h1Valid: SectionPass.bad(),
            h1Text: "h1Text",
            subheadingsSubtitle: "subheadingsSubtitle",
            subheadingsValid: SectionPass.bad(),
            subheadingsList: [],
            keywordScores: [],
            keywordsValid: SectionPass.great(),
            links: [],
            linksValid: SectionPass.bad()));
    return Scaffold(
      backgroundColor: OATheme.of(context).secondaryBackgoundColor,
      body: Consumer2<MyCrawlResultO, MyCrawlSessionO>(
          builder: (context, o, session, _) {
        var result = o.pageCrawlResult;

        return Scrollbar(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TopNavBarWeb(),
              if (result == null)
                Expanded(
                  child: Center(
                    child: LoadingWidget(),
                  ),
                )
              else
                Expanded(
                  child: ScrollConfiguration(
                    behavior: ScrollConfiguration.of(context)
                        .copyWith(scrollbars: false),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        if (session.session?.scrapeResults != null)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: session.session!.scrapeResults
                                .mapIndexed((i, e) => InkWell(
                                      onTap: () {
                                        ScrapeAction.of(context)
                                            .selectSingleResult(e);
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: o.pageCrawlResult?.url ==
                                                      e.url
                                                  ? Colors.teal
                                                  : null,
                                              border: Border.all(
                                                  width: 2,
                                                  color: OATheme.of(context)
                                                      .accentColor)),
                                          height: 44,
                                          width: 44,
                                          child:
                                              Center(child: Text(i.toString())),
                                        ),
                                      ),
                                    ))
                                .toList(),
                          ),
                        Expanded(
                          child: SingleChildScrollView(
                              child: Container(
                            constraints: BoxConstraints(
                                maxWidth: AppConstants.DESIGN_WEB_CUTOFF),
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              children: [
                                Wrap(
                                  // crossAxisAlignment: CrossAxisAlignment.start,
                                  spacing: 40,
                                  children: [
                                    Container(
                                      constraints: BoxConstraints(
                                          maxWidth:
                                              (AppConstants.DESIGN_WEB_CUTOFF /
                                                      2) -
                                                  25),
                                      child: Column(
                                        children: [
                                          BasicResultWidget(
                                            textBoxHeight: baseHeight / 3,
                                            title: "URL",
                                            pass: SectionPass.great(),
                                            text: result.url,
                                            subtitle: "Website url",
                                            onTextTap: () {
                                              launchUrlString(result.url);
                                            },
                                          ),
                                          verticalSpacing,
                                          BasicResultWidget(
                                            textBoxHeight: baseHeight / 3,
                                            title: 'Meta Title',
                                            pass: result.metaTitleValid,
                                            text: result.metaTitle,
                                            subtitle: result.metaTitleSubtitle,
                                          ),
                                          verticalSpacing,
                                          BasicResultWidget(
                                            textBoxHeight: baseHeight,
                                            title: "Meta Description",
                                            pass: result.metaDescriptionValid,
                                            text: result.metaDescription,
                                            subtitle:
                                                result.metaDescriptionSubtitle,
                                          ),
                                          verticalSpacing,
                                          BasicResultWidget(
                                            textBoxHeight: baseHeight * 4 / 3,
                                            title: 'Featured image',
                                            pass: result.featuredImageValid,
                                            textWidget: Image.network(
                                                result.featuredImagePath),
                                            subtitle:
                                                'No customer service, selling fake shoes. ',
                                          ),
                                          verticalSpacing,
                                        ],
                                      ),
                                    ),
                                    Container(
                                      constraints: BoxConstraints(
                                          maxWidth:
                                              (AppConstants.DESIGN_WEB_CUTOFF /
                                                      2) -
                                                  25),
                                      child: Column(
                                        children: [
                                          SeoScoreWidget(
                                              result.seoScore.ceil()),
                                          verticalSpacing,
                                          BasicResultWidget(
                                            textBoxHeight: baseHeight / 3,
                                            title: 'Word count',
                                            pass: result.wordCountValid,
                                            text: result.wordCount.toString() +
                                                " " +
                                                "WORDS",
                                            subtitle: result.wordCountSubtitle,
                                            prefix: Container(
                                              height: 30,
                                              width: 30,
                                              color: Colors.red,
                                            ),
                                          ),
                                          verticalSpacing,
                                          BasicResultWidget(
                                            textBoxHeight: baseHeight / 3,
                                            title: 'H1',
                                            pass: result.h1Valid,
                                            prefix: Text(
                                              "H1",
                                              style: OATheme.of(context)
                                                  .baseTextStyle
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 18,
                                                      color: Colors.green),
                                            ),
                                            text: result.h1Text,
                                            subtitle:
                                                'No customer service, selling fake shoes. ',
                                          ),
                                          verticalSpacing,
                                          SubheadingsList(
                                              result.subheadingsList,
                                              result.subheadingsValid),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                verticalSpacing,
                                if (result.keywordScores != null)
                                  KeywordsList(result.keywordScores!,
                                      result.keywordsValid),
                                verticalSpacing,
                                InternalLinksList(
                                    result.links, result.linksValid),
                                verticalSpacing,
                              ],
                            ),
                          )),
                        ),
                      ],
                    ),
                  ),
                )
            ],
          ),
        );
      }),
    );
  }
}

class KeywordsList extends StatelessWidget {
  final List<KeywordScore> scores;
  final SectionPass pass;
  KeywordsList(this.scores, this.pass);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MultipleResultWidget(
          pass: pass,
          title: 'KEYWORDS',
          useWrap: true,
          textBoxHeight: baseHeight / 3,
          subtitle: 'Here you can see your top scoring keywords',
          texts: [
            ...scores.map((e) => TextsForWidget(
                text: e.keyword,
                prefix: Text((e.score * 100.0).toStringAsFixed(2) + "%")))
          ],
        ),
      ],
    );
  }
}

class SubheadingsList extends StatelessWidget {
  final List<Subheading> subheadings;
  final pass;
  SubheadingsList(this.subheadings, this.pass);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MultipleResultWidget(
          pass: pass,
          title: 'SUBHEADINGS',
          textBoxHeight: baseHeight / 3,
          subtitle: 'Subtitle missing',
          texts: [
            ...subheadings.map((e) => TextsForWidget(
                  text: e.text,
                  prefix: Text(
                    e.type.toUpperCase(),
                    style: OATheme.of(context).baseTextStyle.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.green),
                  ),
                ))
          ],
        ),
      ],
    );
  }
}

class InternalLinksList extends StatelessWidget {
  final List<InternalLink> links;
  final pass;
  InternalLinksList(this.links, this.pass);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MultipleResultWidget(
          pass: pass,
          title: 'INTERNAL LINKS',
          textBoxHeight: baseHeight / 3,
          subtitle: 'Subtitle missing',
          texts: [
            ...links.map((e) => TextsForWidget(
                  text: e.href,
                  prefix: Text(
                    e.text.toUpperCase(),
                    style: OATheme.of(context).baseTextStyle.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.green),
                  ),
                ))
          ],
        ),
      ],
    );
  }
}
