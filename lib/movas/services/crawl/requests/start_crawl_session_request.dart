import 'package:metacheck_frontend/movas/services/http/requests/base_http_request.dart';

class StartCrawlSessionRequest extends BaseHttpRequest {
  final List<String> urls;
  final String uid;
  StartCrawlSessionRequest(this.urls, this.uid)
      : super(endpoint: "/model/scraper.bpmn/task/call_scrape/receive");

  @override
  Map<String, dynamic> toMap() {
    return {
      "urls": urls,
      "user_id": this.uid,
    };
  }
}
