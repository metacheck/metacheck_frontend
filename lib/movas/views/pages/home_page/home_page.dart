import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:metacheck_frontend/mock.dart';
import 'package:metacheck_frontend/movas/actions/google_sheet_action.dart';
import 'package:metacheck_frontend/movas/actions/scrape_action.dart';
import 'package:metacheck_frontend/movas/observables/my_crawl_result.dart';
import 'package:metacheck_frontend/movas/router.dart';
import 'package:metacheck_frontend/movas/views/theme/theme.dart';
import 'package:metacheck_frontend/movas/views/widgets/navigation/top_nav_web.dart';
import 'package:metacheck_frontend/movas/views/widgets/textfiels/single_url_textfield.dart';
import 'package:metacheck_frontend/utils/loading_action.dart';
import 'package:movas/movas.dart';
import 'package:provider/provider.dart';
import 'package:qlevar_router/qlevar_router.dart';
import 'dart:js' as js;

import '../../../../helpers/logger.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController controller;
  @override
  void initState() {
    controller = TextEditingController();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final base = OATheme.of(context).baseTextStyle;
    return Scaffold(
      backgroundColor: OATheme.of(context).secondaryBackgoundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TopNavBarWeb(),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                color: OATheme.of(context).secondaryBackgoundColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 100,
                    ),
                    InkWell(
                      onTap: () {
                        GoogleSheetA.of(context).createSheet(
                            StaticProvider.of<MyCrawlSessionsO>(context)
                                .sessions
                                .first);
                      },
                      child: Text(
                        "Welcome to on site analyzer!",
                        textAlign: TextAlign.center,
                        style: base.copyWith(
                            fontSize: 48, fontWeight: FontWeight.w900),
                      ),
                    ),
                    SizedBox(
                      height: 80,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SingleUrlTextField(
                          hintText: 'Type the URL here',
                          textEditingController: controller,
                          onTap: () async {
                            loadingActionHandler(context, Future(() async {
                              var urls = (controller.text)
                                  .split(",")
                                  .map((e) => e.trim())
                                  .toList();
                              List<String> formatted = [];
                              for (var url in urls) {
                                var u = url.toString();
                                u.replaceAll("http://", "");
                                if (u.startsWith("http") == false) {
                                  u = "https://" + u;
                                }
                                formatted.add(u);
                              }

                              var s = await ScrapeAction.of(context)
                                  .startScrape(formatted);
                              logger.info(s);
                              return Future.value(s);
                            })).then((value) => QR.toName(AppRoutes.exportPage,
                                params: {"id": value.toString()}));
                          },
                        ),
                        if (false)
                          Center(
                            child: Consumer<MyCrawlSessionsO>(
                                builder: (context, o, _) {
                              var s = o.sessions;

                              return ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: s.length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return Center(
                                      child: InkWell(
                                        onTap: () {
                                          ScrapeAction.of(context)
                                              .selectCrawlSession(
                                                  s.elementAt(index).id);
                                          QR.toName(AppRoutes.exportPage,
                                              params: {
                                                "id": s.elementAt(index).id
                                              });
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                              s.elementAt(index).shortName),
                                        ),
                                      ),
                                    );
                                  });
                            }),
                          )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

// Text.rich(
// TextSpan(
// children: [
// TextSpan(
// text: 'Checking meta tags should be ',
// style: base.copyWith(
// fontWeight: FontWeight.w900, fontSize: 48)),
// TextSpan(
// text: 'eas',
// style: base.copyWith(
// fontWeight: FontWeight.w900,
// fontSize: 48,
// color: BaseTheme.of(context).accentColor,
// decoration: TextDecoration.underline,
// ),
// ),
// TextSpan(
// text: 'y.',
// style: base.copyWith(
// fontWeight: FontWeight.w900,
// fontSize: 48,
// color: BaseTheme.of(context).accentColor)),
// ],
// ),
// )
