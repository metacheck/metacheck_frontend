import 'package:flutter/material.dart';
import 'package:metacheck_frontend/movas/views/theme/theme.dart';

import '../single_url_export_page.dart';

class WordCountWidget extends StatelessWidget {
  final int count;

  WordCountWidget(this.count);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: baseHeight,
      width: double.maxFinite,
      decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).primaryColor)),
    );
  }
}
