import 'package:metacheck_frontend/movas/services/http/requests/base_http_request.dart';

class StartCrawlSessionRequest extends BaseHttpRequest {
  final String id;
  final List<String> urls;

  StartCrawlSessionRequest(this.id, this.urls)
      : super(endpoint: "/instance/$id/task/call_scrape/receive");

  @override
  Map<String, dynamic> toMap() {
    return {
      "urls": urls,
    };
  }
}
