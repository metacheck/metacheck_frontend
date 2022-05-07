import 'package:metacheck_frontend/movas/observables/my_crawl_result.dart';
import 'package:movas/provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../movas/stores/crawl_result_store.dart';

List<SingleChildWidget> storeProviders = [
  MyStoreProvider3<CrawlResultStore, MyCrawlResultO, MyCrawlSessionO,
          MyCrawlSessionsO>(
      initialData: MyCrawlResultO(),
      initialData2: MyCrawlSessionO(),
      initialData3: MyCrawlSessionsO(),
      storeBuilder: (context) => CrawlResultStore(StaticProvider.of(context)))
];
