import 'package:metacheck_frontend/main.dart';
import 'package:movas/movas.dart';

T get<T>() {
  return StaticProvider.of<T>(navKey.currentContext!);
}
