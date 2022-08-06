import 'package:flutter/src/widgets/framework.dart';
import 'package:metacheck_frontend/movas/models/generated_descriptions/generated_descriptions.dart';

class MetaDescO {
  final List<GeneratedDescription> descriptions;
  late final Map<String, Map<String, GeneratedDescription>> mapped;
  MetaDescO({
    required this.descriptions,
  }) {
    Map<String, Map<String, GeneratedDescription>> tmpMap = {};
    for (var d in descriptions) {
      final val = tmpMap.putIfAbsent(d.sessionId, () => {});
      val.putIfAbsent(d.resultId, () => d);
    }
    mapped = Map.from(tmpMap);
    print("Mapped $mapped");
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MetaDescO &&
          runtimeType == other.runtimeType &&
          descriptions == other.descriptions;

  @override
  int get hashCode => descriptions.hashCode;

  GeneratedDescription? get(String resultid, String sessionId) {
    if (mapped.containsKey(sessionId)) {
      if (mapped[sessionId]!.containsKey(resultid)) {
        return mapped[sessionId]![resultid]!;
      }
    }
  }
}
