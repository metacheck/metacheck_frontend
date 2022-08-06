import 'dart:async';

import 'package:flutter/foundation.dart';

void main() {
  print('## start SynchronousFuture');
  doAsyncWorkWithSynchronousFuture();
  print('## end SynchronousFuture');

  if (kDebugMode) {
    print('## start FutureOr');
  }
  doAsyncWorkWithFutureOr();
  print('## end FutureOr');
}

Future<void> doAsyncWorkWithSynchronousFuture() async {
  print(await makeCofeeWithSynchronousFuture());
}

Future<void> doAsyncWorkWithFutureOr() async {
  print(await makeCofeeWithFutureOr());
}

Future<String> makeCofeeWithSynchronousFuture() async {
  // await Future.delayed(Duration(seconds: 1));
  return SynchronousFuture('SynchronousFuture coffee');
}

FutureOr<String> makeCofeeWithFutureOr() => 'FutureOr coffee';
