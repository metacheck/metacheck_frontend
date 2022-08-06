import 'package:cloud_firestore/cloud_firestore.dart';

class GeneratedDescriptionsE {
  final List<GeneratedDescription> descriptions;

  const GeneratedDescriptionsE({
    required this.descriptions,
  });

  factory GeneratedDescriptionsE.fromList(
      List<QueryDocumentSnapshot<Map<String, dynamic>>> list) {
    return GeneratedDescriptionsE(
        descriptions: list
            .map((e) => GeneratedDescription.fromMap(e.data(), e.id))
            .toList());
  }
}

enum DescriptionState {
  running,
  error,
  complete,
}

class GeneratedDescription {
  final DescriptionState state;
  final String sessionId;
  final String resultId;
  final String summary;
  final String id;
  factory GeneratedDescription.fromMap(Map<String, dynamic> map, String id) {
    return GeneratedDescription(
      summary: map["summarized"].toString(),
      id: id,
      state: DescriptionState.values
          .firstWhere((element) => element.name == map["state"]),
      sessionId: map['session_id'] as String,
      resultId: map['result_id'] as String,
    );
  }

  const GeneratedDescription({
    required this.state,
    required this.sessionId,
    required this.resultId,
    required this.summary,
    required this.id,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GeneratedDescription &&
          runtimeType == other.runtimeType &&
          state == other.state &&
          sessionId == other.sessionId &&
          resultId == other.resultId &&
          summary == other.summary &&
          id == other.id;

  @override
  int get hashCode =>
      state.hashCode ^
      sessionId.hashCode ^
      resultId.hashCode ^
      summary.hashCode ^
      id.hashCode;
}
