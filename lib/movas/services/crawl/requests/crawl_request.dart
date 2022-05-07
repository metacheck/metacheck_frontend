import 'package:metacheck_frontend/movas/services/http/requests/base_http_request.dart';

class CreateScrapeSessionRequest extends BaseHttpRequest {
  CreateScrapeSessionRequest()
      : super(endpoint: "/model/scraper.bpmn/instance");

  @override
  Map<String, dynamic> toMap() {
    return {};
  }
}
