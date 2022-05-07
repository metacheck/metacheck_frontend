import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:metacheck_frontend/movas/actions/scrape_action.dart';
import 'package:metacheck_frontend/movas/observables/my_crawl_result.dart';
import 'package:metacheck_frontend/movas/router.dart';
import 'package:metacheck_frontend/movas/views/theme/theme.dart';
import 'package:metacheck_frontend/movas/views/widgets/navigation/top_nav_web.dart';
import 'package:metacheck_frontend/movas/views/widgets/textfiels/single_url_textfield.dart';
import 'package:provider/provider.dart';
import 'package:qlevar_router/qlevar_router.dart';

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
          Container(
            color: OATheme.of(context).secondaryBackgoundColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 100,
                ),
                Text(
                  "Welcome to on site analyzer!",
                  textAlign: TextAlign.center,
                  style:
                      base.copyWith(fontSize: 48, fontWeight: FontWeight.w900),
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
                        var url = (controller.text);
                        url.replaceAll("http://", "");
                        if (url.startsWith("http") == false) {
                          url = "https://" + url;
                        }

                        var s = await ScrapeAction.of(context)
                            .createScrapeSession();
                        await ScrapeAction.of(context)
                            .startScrape([Uri.tryParse(url).toString()], s);
                        QR.toName(AppRoutes.exportPage, params: {"id": s});
                      },
                    ),
                    Center(
                      child:
                          Consumer<MyCrawlSessionsO>(builder: (context, o, _) {
                        return ListView.builder(
                            itemCount: o.sessions.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Center(
                                child: InkWell(
                                  onTap: () {
                                    ScrapeAction.of(context).selectCrawlSession(
                                        o.sessions.elementAt(index).id);
                                    QR.toName(AppRoutes.exportPage, params: {
                                      "id": o.sessions.elementAt(index).id
                                    });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        o.sessions.elementAt(index).shortName),
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
