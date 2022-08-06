import 'package:metacheck_frontend/movas/models/generated_descriptions/generated_descriptions.dart';
import 'package:metacheck_frontend/movas/models/results/scrape_results.dart';
import 'package:metacheck_frontend/movas/models/user/user.dart';
import 'package:metacheck_frontend/movas/services/local_storage/local_storage_service.dart';
import 'package:movas/movas.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> streams = [
  Provider<PublishSubject<LocalStorageUpdate>>(
    create: (c) => PublishSubject(sync: true),
  ),
  Provider<PublishSubject<UserE?>>(
    create: (c) => PublishSubject(sync: true),
  ),
  Provider<PublishSubject<ScrapeResultsE>>(
    create: (c) => PublishSubject(sync: true),
  ),
  Provider<PublishSubject<GeneratedDescriptionsE>>(
    create: (c) => PublishSubject(sync: true),
  ),
];
