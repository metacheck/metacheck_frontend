import 'package:metacheck_frontend/providers/service_providers.dart';
import 'package:metacheck_frontend/providers/store_providers.dart';
import 'package:metacheck_frontend/providers/stream_providers.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  ...streams,
  ...services,
  ...storeProviders,
];
