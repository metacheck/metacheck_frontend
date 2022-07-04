import 'package:metacheck_frontend/movas/services/http/requests/base_http_request.dart';

class StartCrawlSessionRequest extends BaseHttpRequest {
  final List<String> urls;

  StartCrawlSessionRequest(this.urls)
      : super(endpoint: "/model/scraper.bpmn/task/call_scrape/receive");

  @override
  Map<String, dynamic> toMap() {
    return {
      "urls": urls,
    };
  }
}
