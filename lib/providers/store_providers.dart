import 'package:metacheck_frontend/movas/observables/meta_desc.dart';
import 'package:metacheck_frontend/movas/observables/my_crawl_result.dart';
import 'package:metacheck_frontend/movas/observables/user_observable.dart';
import 'package:metacheck_frontend/movas/stores/user_store.dart';
import 'package:movas/provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../movas/stores/crawl_result_store.dart';
import '../movas/stores/meta_desc_store.dart';

List<SingleChildWidget> storeProviders = [
  MyStoreProvider(
      initialData: UserO(),
      storeBuilder: (context) => UserStore(StaticProvider.of(context))),
  MyStoreProvider(
      initialData: MetaDescO(descriptions: []),
      storeBuilder: (context) => MetaDescStore(StaticProvider.of(context))),
  MyStoreProvider3<CrawlResultStore, MyCrawlResultO, MyCrawlSessionO,
          MyCrawlSessionsO>(
      initialData: MyCrawlResultO(),
      initialData2: MyCrawlSessionO(),
      initialData3: MyCrawlSessionsO(),
      storeBuilder: (context) => CrawlResultStore(StaticProvider.of(context)))
];
