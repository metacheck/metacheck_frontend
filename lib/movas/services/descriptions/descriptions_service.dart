import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:metacheck_frontend/helpers/logger.dart';
import 'package:metacheck_frontend/movas/models/generated_descriptions/generated_descriptions.dart';
import 'package:metacheck_frontend/movas/models/results/scrape_results.dart';
import 'package:metacheck_frontend/movas/models/user/user.dart';
import 'package:movas/movas.dart';

class MetaDescriptionResultsService {
  late final FirebaseFirestore firestore;
  final PublishSubject<UserE?> userE$;
  final PublishSubject<GeneratedDescriptionsE> resultsE$;

  String userId = "leo";
  StreamSubscription? scrapeResultsListener;
  MetaDescriptionResultsService(this.userE$, this.resultsE$) {
    firestore = FirebaseFirestore.instance;

    userE$.listen((value) {
      if (value == null) {
        _removeListener();
      } else {
        userId = value.uid;
        _setupListenerForUser();
      }
    });
  }

  void _removeListener() {
    scrapeResultsListener?.cancel();
    scrapeResultsListener = null;
    resultsE$.add(GeneratedDescriptionsE.fromList([]));
  }

  void _setupListenerForUser() {
    _removeListener();
    scrapeResultsListener = firestore
        .collection("descriptions")
        .where("user_id", isEqualTo: userId)
        .snapshots()
        .listen((event) {
      resultsE$.add(GeneratedDescriptionsE.fromList(event.docs));
    });
  }
}
