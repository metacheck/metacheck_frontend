import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:metacheck_frontend/movas/views/theme/theme.dart';
import 'package:qlevar_router/qlevar_router.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Center(
          child: SizedBox(
            width: 80,
            height: 80,
            child: CircularProgressIndicator(
              strokeWidth: 5,
              valueColor: AlwaysStoppedAnimation<Color?>(
                Theme.of(context).primaryColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

Future<void> showLoadingDialog(BuildContext context, [Widget? child]) {
  return showDialog(
      context: context,
      barrierDismissible: kDebugMode,
      builder: (_) => child ?? LoadingWidget());
}

Future<T> loadingActionHandler<T>(BuildContext context, Future<T> actionFuture,
    [Widget? child, bool showError = true]) async {
  showLoadingDialog(context, child);
  return actionFuture.then((value) {
    Navigator.pop(context);
    return value;
  }).catchError((e) {
    Navigator.pop(context);
    if (showError)
      QDialog.text(
        text: Text(e is DioError ? e.message : e.toString()),
        // onPressed: () => Navigator.of(context).pop(),
      ).show(context: context);
    throw e;
  });
}
