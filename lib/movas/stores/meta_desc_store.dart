import 'package:metacheck_frontend/movas/observables/meta_desc.dart';
import 'package:movas/movas.dart';
import 'package:movas/provider/provider.dart';

import '../models/generated_descriptions/generated_descriptions.dart';

class MetaDescStore extends Store<MetaDescO> {
  MetaDescStore(PublishSubject<GeneratedDescriptionsE> stream) {
    add(MetaDescO(descriptions: []));
    stream.listen((value) {
      add(MetaDescO(descriptions: value.descriptions.toList()));
    });
  }
}
