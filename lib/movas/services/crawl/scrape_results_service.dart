import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:metacheck_frontend/helpers/logger.dart';
import 'package:metacheck_frontend/movas/models/generated_descriptions/generated_descriptions.dart';
import 'package:metacheck_frontend/movas/models/results/scrape_results.dart';
import 'package:metacheck_frontend/movas/models/user/user.dart';
import 'package:movas/movas.dart';

class ScrapeResultsService {
  late final FirebaseFirestore firestore;
  final PublishSubject<UserE?> userE$;
  final PublishSubject<ScrapeResultsE> scrapeResultsE$;

  String userId = "leo";
  StreamSubscription? scrapeResultsListener;
  ScrapeResultsService(this.userE$, this.scrapeResultsE$) {
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
    scrapeResultsE$.add(ScrapeResultsE.fromList([]));
  }

  void _setupListenerForUser() {
    _removeListener();
    scrapeResultsListener = firestore
        .collection("results")
        .where("user_id", isEqualTo: userId)
        .snapshots()
        .listen((event) {
      logger.info("len " + event.docs.length.toString());
      scrapeResultsE$.add(ScrapeResultsE.fromList(event.docs));
    });
  }
}
