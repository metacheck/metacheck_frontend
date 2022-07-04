import 'package:metacheck_frontend/movas/services/crawl/requests/crawl_request.dart';
import 'package:metacheck_frontend/movas/services/crawl/requests/start_crawl_session_request.dart';
import 'package:metacheck_frontend/movas/services/http/base_http_service.dart';

class CrawlService {
  final BaseHttpService httpService;

  CrawlService(this.httpService);

  Future<String> createScrapeSession(
      CreateScrapeSessionRequest scrapeSessionRequest) async {
    late String id;
    Map<String, dynamic> resp = await httpService.post(
        request: scrapeSessionRequest, converter: (data) => data);
    id = resp["id"];
    return id;
  }

  Future<String> startScrapeSession(
      StartCrawlSessionRequest sessionRequest) async {
    Map<String, dynamic> resp = await httpService.post(
        request: sessionRequest, converter: (data) => data);

    return resp["id_instance"].toString();
  }
}
