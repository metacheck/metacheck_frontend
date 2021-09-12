import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:metacheck_frontend/movas/views/theme/theme.dart';
import 'package:metacheck_frontend/movas/views/widgets/buttons/outlined_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TopNavBarWeb extends StatelessWidget implements PreferredSizeWidget {
  const TopNavBarWeb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: BaseTheme.of(context).backgroundColor,
        height: 100,
        constraints: BoxConstraints(maxWidth: 1200),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/MetaCheck-logo.svg",
              height: 22,
              width: 160,
            ),
            Spacer(),
            MetacheckOutlinedButton(AppLocalizations.of(context)!.logIn.toUpperCase()),
            SizedBox(width: 24,),
            MetacheckOutlinedButton(AppLocalizations.of(context)!.signUp.toUpperCase()),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size(1200, 100);
}
