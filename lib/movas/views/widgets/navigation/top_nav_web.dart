import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:metacheck_frontend/helpers/app_constants.dart';
import 'package:metacheck_frontend/movas/actions/auth_action.dart';
import 'package:metacheck_frontend/movas/observables/user_observable.dart';
import 'package:metacheck_frontend/movas/router.dart';
import 'package:metacheck_frontend/movas/views/theme/theme.dart';
import 'package:metacheck_frontend/movas/views/widgets/buttons/outlined_button.dart';
import 'package:metacheck_frontend/utils/loading_action.dart';
import 'package:provider/provider.dart';
import 'package:qlevar_router/qlevar_router.dart';

class TopNavBarWeb extends StatelessWidget implements PreferredSizeWidget {
  const TopNavBarWeb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final value = context.watch<UserO>();
    return Center(
      child: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        height: 100,
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              constraints: BoxConstraints(maxWidth: 1200),
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
                  Row(
                    children: [
                      Row(
                        children: value.userState == UserState.loggedIn
                            ? [
                                SizedBox(
                                  width: 24,
                                ),
                                MetacheckOutlinedButton(
                                  text: AppLocalizations.of(context)!
                                      .crawlSessions
                                      .toUpperCase(),
                                  onTap: () {
                                    QR.toName(AppRoutes.sessions);
                                  },
                                ),
                                SizedBox(
                                  width: 24,
                                ),
                              ]
                            : [],
                      ),
                      Row(
                        children: value.userState == UserState.loggedIn
                            ? [
                                MetacheckOutlinedButton(
                                  text: AppLocalizations.of(context)!
                                      .logout
                                      .toUpperCase(),
                                  onTap: () async {
                                    await loadingActionHandler(context,
                                        AuthAction.of(context).logout());
                                    QR.to(AppRoutes.login);
                                  },
                                ),
                              ]
                            : [
                                MetacheckOutlinedButton(
                                  text: AppLocalizations.of(context)!
                                      .logIn
                                      .toUpperCase(),
                                  onTap: () {
                                    QR.to(AppRoutes.login);
                                  },
                                ),
                                SizedBox(
                                  width: 24,
                                ),
                                MetacheckOutlinedButton(
                                  text: AppLocalizations.of(context)!
                                      .signUp
                                      .toUpperCase(),
                                  onTap: () {
                                    QR.to(AppRoutes.register);
                                  },
                                ),
                              ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size(1200, 100);
}
