import 'package:flutter/material.dart';
import 'package:metacheck_frontend/movas/ui/ui_consts.dart';

class Padded extends StatelessWidget {
  final Widget child;
  const Padded({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: UI.sizes.spacing.md),
      child: child,
    );
  }
}
