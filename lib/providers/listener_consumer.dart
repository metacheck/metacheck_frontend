import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// A helper widget which exposes a separate listener call back
/// which is called after every postFrame

class ListenerConsumer<T> extends StatelessWidget {
  final Function(BuildContext, T, Widget?) builder;
  final Function(BuildContext, T) listener;

  ListenerConsumer({required this.builder, required this.listener});

  @override
  Widget build(BuildContext context) {
    return Consumer<T>(
      builder: (context, observable, widget) {
        _listener(context, observable);
        return builder(context, observable, widget);
      },
    );
  }

  void _listener(BuildContext context, T observable) async {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      listener(context, observable);
    });
  }
}
