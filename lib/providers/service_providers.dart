import 'package:dio/dio.dart';
import 'package:metacheck_frontend/movas/services/http/base_http_service.dart';
import 'package:metacheck_frontend/movas/services/http/dio_http_service.dart';
import 'package:metacheck_frontend/movas/services/local_storage/hive_local_storage_service.dart';
import 'package:metacheck_frontend/movas/services/local_storage/local_storage_service.dart';
import 'package:movas/movas.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> services = [
  Provider<Dio>(
    lazy: false,
    create: (context) => Dio(),
  ),
  Provider<LocalStorageService>(
    lazy: false,
    create: (context) =>
        HiveLocalStorageService(StaticProvider.of(context))..init(),
  ),
  Provider<BaseHttpService>(
    lazy: false,
    create: (context) => DioHttpService(
      StaticProvider.of(context),
      StaticProvider.of(context),
    ),
  ),
];
