// import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:metacheck_frontend/movas/models/results/single_result.dart';
import 'package:metacheck_frontend/movas/views/theme/theme.dart';

class BasicResultWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String? text;
  final double textBoxHeight;
  final SectionPass pass;
  final Widget? prefix;
  final Widget? textWidget;
  final VoidCallback? onTextTap;
  const BasicResultWidget({
    required this.title,
    required this.subtitle,
    this.text,
    required this.textBoxHeight,
    required this.pass,
    this.prefix,
    this.onTextTap,
    this.textWidget,
  }) : assert(textWidget == null || text == null);

  @override
  Widget build(BuildContext context) {
    final base = OATheme.of(context).baseTextStyle;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                  color: _colorForPass(pass),
                  borderRadius: BorderRadius.circular(4)),
            ),
            SizedBox(
              width: 10,
            ),
            SelectableText(
              title,
              style: base,
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        SelectableText(subtitle),
        SizedBox(
          height: 8,
        ),
        InkWell(onTap: onTextTap, child: descriptionWidget(context, base))
      ],
    );
  }

  Widget descriptionWidget(BuildContext context, TextStyle base) {
    if (text != null) {
      String text = this.text!;
      Widget child = SelectableText(
        text,
        style: base,
      );
      if (onTextTap != null)
        child = Text(
          text,
          style: base,
        );
      if (prefix != null)
        child = Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: prefix!,
            ),
            child
          ],
        );
      return Container(
          constraints: BoxConstraints(minHeight: textBoxHeight),
          width: double.maxFinite,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: OATheme.of(context).backgroundColor,
          ),
          child: child);
    }

    return textWidget!;
  }
}

class TextsForWidget {
  final Widget? prefix;
  final String text;

  const TextsForWidget({
    this.prefix,
    required this.text,
  });
}

Color _colorForPass(SectionPass pass) {
  switch (pass.type) {
    case SectionPassType.bad:
      return Colors.red;
      break;
    case SectionPassType.medium:
      return Colors.orangeAccent;
      break;
    case SectionPassType.great:
      return Colors.green;
      break;
  }
}

class MultipleResultWidget extends StatelessWidget {
  final String title;
  final String subtitle;

  final double textBoxHeight;
  final SectionPass pass;
  final List<TextsForWidget> texts;
  final bool useWrap;
  const MultipleResultWidget({
    required this.title,
    required this.subtitle,
    required this.texts,
    required this.textBoxHeight,
    required this.pass,
    this.useWrap = false,
  });

  @override
  Widget build(BuildContext context) {
    final base = OATheme.of(context).baseTextStyle;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                  color: _colorForPass(pass),
                  borderRadius: BorderRadius.circular(4)),
            ),
            SizedBox(
              width: 10,
            ),
            SelectableText(
              title,
              style: base,
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        SelectableText(subtitle),
        SizedBox(
          height: 8,
        ),
        if (useWrap)
          Wrap(
            runSpacing: 8,
            spacing: 8,
            children: [
              ...texts
                  .map(
                      (e) => descriptionWidget(context, base, e.text, e.prefix))
                  .toList()
            ],
          ),
        if (!useWrap)
          ...texts
              .map((e) => Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: descriptionWidget(context, base, e.text, e.prefix),
                  ))
              .toList()
      ],
    );
  }

  Widget descriptionWidget(
      BuildContext context, TextStyle base, String text, Widget? prefix) {
    Widget child = SelectableText(
      text,
      style: base,
    );
    if (prefix != null)
      child = Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: prefix,
          ),
          child
        ],
      );
    return Container(
        constraints: BoxConstraints(minHeight: textBoxHeight),
        width: useWrap ? null : double.maxFinite,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: OATheme.of(context).backgroundColor,
        ),
        child: child);
  }
}
