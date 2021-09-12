import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:metacheck_frontend/movas/views/theme/theme.dart';
import 'package:metacheck_frontend/movas/views/widgets/navigation/top_nav_web.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final base = BaseTheme.of(context).baseTextStyle;
    return Scaffold(
      backgroundColor: BaseTheme.of(context).backgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TopNavBarWeb(),
          Container(
            color: BaseTheme.of(context).secondaryBackgoundColor,
            child: Column(
              children: [
                SizedBox(height: 100,),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                          text: 'Checking meta tags should be ',
                          style: base.copyWith(
                              fontWeight: FontWeight.w900, fontSize: 48)),
                      TextSpan(
                        text: 'eas',
                        style: base.copyWith(
                          fontWeight: FontWeight.w900,
                          fontSize: 48,
                          color: BaseTheme.of(context).accentColor,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      TextSpan(
                          text: 'y.',
                          style: base.copyWith(
                              fontWeight: FontWeight.w900,
                              fontSize: 48,
                              color: BaseTheme.of(context).accentColor)),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

