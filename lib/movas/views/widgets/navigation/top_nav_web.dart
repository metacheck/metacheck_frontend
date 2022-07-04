import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:metacheck_frontend/helpers/app_constants.dart';
import 'package:metacheck_frontend/movas/router.dart';
import 'package:metacheck_frontend/movas/views/theme/theme.dart';
import 'package:metacheck_frontend/movas/views/widgets/buttons/outlined_button.dart';
import 'package:qlevar_router/qlevar_router.dart';

class TopNavBarWeb extends StatelessWidget implements PreferredSizeWidget {
  const TopNavBarWeb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: OATheme.of(context).secondaryBackgoundColor,
        height: 100,
        constraints: BoxConstraints(maxWidth: AppConstants.DESIGN_WEB_CUTOFF),
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                QR.toName(AppRoutes.homePage);
              },
              child: SvgPicture.asset(
                "assets/MetaCheck-logo.svg",
                height: 22,
                // width: 160,
              ),
            ),
            Spacer(),
            SizedBox(
              width: 24,
            ),
            MetacheckOutlinedButton(
              AppLocalizations.of(context)!.crawlSessions.toUpperCase(),
              onTap: () {
                QR.toName(AppRoutes.sessions);
              },
            ),
            SizedBox(
              width: 24,
            ),
            MetacheckOutlinedButton(
              AppLocalizations.of(context)!.logIn.toUpperCase(),
              onTap: () {},
            ),
            SizedBox(
              width: 24,
            ),
            MetacheckOutlinedButton(
              AppLocalizations.of(context)!.signUp.toUpperCase(),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size(1200, 100);
}
