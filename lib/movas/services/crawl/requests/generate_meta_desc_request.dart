import 'package:metacheck_frontend/movas/services/http/requests/base_http_request.dart';

class MetaDescGenRequest extends BaseHttpRequest {
  final String resultId;
  final String sessionId;
  final String userId;

  MetaDescGenRequest(this.resultId, this.sessionId, this.userId)
      : super(
            endpoint:
                "/model/meta_desc_generator.bpmn/task/call_generate/receive");

  Map<String, dynamic> toMap() {
    return {
      'result_id': this.resultId,
      'session_id': this.sessionId,
      'user_id': this.userId,
    };
  }
}
