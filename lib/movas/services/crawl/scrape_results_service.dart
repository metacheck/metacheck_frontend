import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:metacheck_frontend/helpers/logger.dart';
import 'package:metacheck_frontend/movas/models/results/scrape_results.dart';
import 'package:metacheck_frontend/movas/models/user/user.dart';
import 'package:movas/movas.dart';

class ScrapeResultsService {
  late final FirebaseFirestore firestore;
  final PublishSubject<UserE> userE$;
  final PublishSubject<ScrapeResultsE> scrapeResultsE$;

  String userId = "leo";
  StreamSubscription? userListener;
  ScrapeResultsService(this.userE$, this.scrapeResultsE$) {
    userE$.listen((value) {
      userId = value.name;
      _setupListenerForUser();
    });
    firestore = FirebaseFirestore.instance;
    _setupListenerForUser();
  }

  void _setupListenerForUser() {
    userListener?.cancel();
    userListener = null;
    userListener = firestore
        .collection("results")
        .where("user_id", isEqualTo: userId)
        .snapshots()
        .listen((event) {
      logger.info("len " + event.docs.length.toString());
      scrapeResultsE$.add(ScrapeResultsE.fromList(event.docs));
    });
  }
}
