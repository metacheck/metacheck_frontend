import 'dart:io';

abstract class BaseHttpRequest {
  final String endpoint;
  Map<String, dynamic> toMap();
  final ContentType? contentType;

  BaseHttpRequest({
    required this.endpoint,
    this.contentType,
  });
}
