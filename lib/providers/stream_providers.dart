import 'package:metacheck_frontend/movas/services/local_storage/local_storage_service.dart';
import 'package:movas/movas.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> streams = [
  Provider<PublishSubject<LocalStorageUpdate>>(create: (c)=>PublishSubject(sync: true),)
];
