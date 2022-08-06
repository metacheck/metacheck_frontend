import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:metacheck_frontend/movas/ui/ui_consts.dart';

class Themes {
  ThemeData light(BuildContext context) => ThemeData(
        brightness: Brightness.light,
        fontFamily: "Raleway",
        disabledColor: Color(0xffD6D9E0),
        accentColor: Color(0xff00b4cc),
        errorColor: Colors.red,
        primaryColor: const Color(0xff00b4cc),
        scaffoldBackgroundColor: Colors.white,
        backgroundColor: Color(0xfffafafa),
        buttonTheme: Theme.of(context).buttonTheme.copyWith(
            colorScheme: Theme.of(context).buttonTheme.colorScheme!.copyWith(
                primary: const Color(0xff50A6FB),
                secondary: const Color(0xffFEC89A))),
        primaryIconTheme: Theme.of(context)
            .iconTheme
            .copyWith(color: const Color(0xff50A6FB)),
        iconTheme: Theme.of(context)
            .iconTheme
            .copyWith(color: const Color(0xff50A6FB)),
        selectedRowColor: const Color(0xff50A6FB).withOpacity(0.95),
        unselectedWidgetColor: const Color(0xffF5F5F5),
        tabBarTheme: Theme.of(context).tabBarTheme.copyWith(
              labelColor: const Color(0xff50A6FB),
              overlayColor: MaterialStateProperty.all(const Color(0xffF0F0F0)),
              unselectedLabelColor: const Color(0xff2E3131),
              labelStyle: const TextStyle(
                fontSize: 14,
                color: Color(0xff50A6FB),
                height: 16.8 / 14,
              ),
              unselectedLabelStyle: const TextStyle(
                fontSize: 14,
                color: Color(0xff2E3131),
                height: 16.8 / 14,
              ),
            ),
        dialogTheme: Theme.of(context).dialogTheme.copyWith(
                contentTextStyle: const TextStyle(
              fontSize: 16,
              color: Color(0xff181B1D),
              fontWeight: FontWeight.w500,
              height: 19 / 16,
            )),
        inputDecorationTheme: Theme.of(context).inputDecorationTheme.copyWith(
              focusedBorder: outline(context),
              border: outline(context),
              focusedErrorBorder: errorOutline(context),
              disabledBorder: outline(context),
              errorBorder: errorOutline(context),
              hintStyle: TextStyle(
                fontSize: 16,
                color: const Color(0xff1A1A1A).withOpacity(0.5),
                height: 19.2 / 24,
              ),
              errorStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xffEE0004),
                height: 16.8 / 14,
              ),
              labelStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xff181B1D),
                height: 16.8 / 14,
              ),
            ),
        textTheme: Theme.of(context).textTheme.copyWith(
            button: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.white,
              height: 19 / 16,
            ),
            headline5: const TextStyle(
                fontSize: 16,
                color: Color(0xff181B1D),
                height: 16 / 16,
                fontWeight: FontWeight.w600),
            headline4: const TextStyle(
                fontSize: 18,
                color: Color(0xff181B1D),
                height: 18 / 18,
                fontWeight: FontWeight.bold),
            headline1: const TextStyle(
                color: Color(0xff181B1D),
                fontWeight: FontWeight.w900,
                fontSize: 48,
                height: 39.2 / 32),
            headline2: const TextStyle(
                fontSize: 24,
                color: Color(0xff181B1D),
                height: 29.11 / 24,
                fontWeight: FontWeight.w600),
            headline3: const TextStyle(
                fontSize: 24,
                color: Color(0xff181B1D),
                height: 29.11 / 24,
                fontWeight: FontWeight.w500),
            bodyText2: const TextStyle(
                fontSize: 14,
                color: Color(0xff181B1D),
                height: 16.8 / 14,
                fontWeight: FontWeight.normal),
            bodyText1: const TextStyle(
                fontSize: 16,
                color: Color(0xff181B1D),
                height: 19.2 / 16,
                fontWeight: FontWeight.normal)),
      );

  OutlineInputBorder errorOutline(context) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(UI.sizes.borderRadius.textField),
      borderSide: BorderSide(color: Colors.red, width: 2),
    );
  }

  OutlineInputBorder outline(context) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(UI.sizes.borderRadius.textField),
      borderSide: BorderSide(color: Color(0xff00b4cc), width: 2),
    );
  }
}
