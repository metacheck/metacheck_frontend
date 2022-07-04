import 'package:flutter/material.dart';
import 'package:flutter_expandable_table/flutter_expandable_table.dart';
import 'package:intl/intl.dart';
import 'package:metacheck_frontend/helpers/app_constants.dart';
import 'package:metacheck_frontend/movas/models/results/single_result.dart';
import 'package:metacheck_frontend/movas/observables/my_crawl_result.dart';
import 'package:metacheck_frontend/movas/router.dart';
import 'package:metacheck_frontend/movas/views/theme/theme.dart';
import 'package:metacheck_frontend/movas/views/widgets/navigation/top_nav_web.dart';
import 'package:provider/provider.dart';
import 'package:qlevar_router/qlevar_router.dart';

class CrawlSessionsPage extends StatefulWidget {
  const CrawlSessionsPage({Key? key}) : super(key: key);

  _CrawlSessionsPageState createState() => _CrawlSessionsPageState();
}

class _CrawlSessionsPageState extends State<CrawlSessionsPage> {
  Color get primaryColor => OATheme.of(context).secondaryBackgoundColor;
  Color accentColor = Color(0xFF0d2026);
  TextStyle textStyle = TextStyle(color: Colors.black);
  TextStyle textStyleSubItems = TextStyle(color: Colors.grey);

  ExpandableTable _buildExpandableTable(MyCrawlSessionsO o) {
    Map<String, List<dynamic>> values = {
      "URL Count": o.sessions.map((e) => e.scrapeResults.length).toList(),
      "Total Score": o.sessions.map((e) => e.totalScore?.toInt()).toList(),
      "Started at": o.sessions
          .map((e) =>
              DateFormat('yyyy-MM-dd – kk:mm').format(e.startTime).toString())
          .toList(),
      "Finished at": o.sessions
          .map((e) => e.endTime == null
              ? null
              : DateFormat('yyyy-MM-dd – kk:mm').format(e.endTime!).toString())
          .toList(),
      "State": o.sessions.map((e) => e.state).toList()
    };
    var columns = values.keys;

    int COLUMN_COUNT = columns.length;
    int ROW_COUNT = o.sessions.length;

    var decoration = BoxDecoration(
        border: Border.all(color: OATheme.of(context).accentColor),
        color: primaryColor);
    //Creation header
    ExpandableTableHeader header = ExpandableTableHeader(
        firstCell: Container(
            decoration: decoration,
            child: Center(
                child: Text(
              'Export\nName',
              style: textStyle,
            ))),
        children: List.generate(
            COLUMN_COUNT,
            (index) => Container(
                decoration: decoration,
                child: Center(
                    child: Text(
                  columns.elementAt(index),
                  style: textStyle,
                )))));

    //Creation rows
    List<ExpandableTableRow> rows = List.generate(
        ROW_COUNT,
        (rowIndex) => ExpandableTableRow(
              height: 50,
              firstCell: InkWell(
                onTap: () {
                  QR.toName(AppRoutes.exportPage, params: {
                    "id": o.sessions.elementAt(rowIndex).id.toString()
                  });
                },
                child: Container(
                    decoration: decoration,
                    child: Center(
                        child: Text(
                      o.sessions.elementAt(rowIndex).id,
                      maxLines: 1,
                      style: textStyle,
                    ))),
              ),
              legend: rowIndex == 0
                  ? Container(
                      decoration: decoration,
                      child: Center(
                        child: Text(
                          'Expandible Row...',
                          style: textStyle,
                        ),
                      ),
                    )
                  : null,
              children: List<Widget>.generate(
                  COLUMN_COUNT,
                  (columnIndex) => Container(
                      decoration: decoration,
                      child: Center(
                          child: Text(
                        values.entries
                                .elementAt(columnIndex)
                                .value
                                .elementAt(rowIndex)
                                ?.toString() ??
                            '',
                        style: textStyle,
                      )))),
            ));

    return ExpandableTable(
      rows: rows,
      header: header,
      headerHeight: 50,
      cellWidth: (AppConstants.DESIGN_WEB_CUTOFF - 5) / (columns.length + 1),
      // scrollShadowColor: OATheme.of(context).secondaryBackgoundColor,
    );
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
          Consumer<MyCrawlSessionsO>(
              // stream: null,
              builder: (context, o, _) {
            return ScrollConfiguration(
              behavior:
                  ScrollConfiguration.of(context).copyWith(scrollbars: false),
              child: Container(
                child: Flexible(
                  child: Container(
                    height: 50.45 * o.sessions.length + 50,
                    constraints: BoxConstraints(
                      maxWidth: AppConstants.DESIGN_WEB_CUTOFF,
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: OATheme.of(context).accentColor,
                                width: 2)),
                        child: _buildExpandableTable(o)),
                  ),
                ),
              ),
            );
          }),
          Text("txt"),
        ],
      ),
    );
  }
}
