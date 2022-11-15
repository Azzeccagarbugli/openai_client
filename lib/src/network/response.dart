import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:openai_client/src/network/request.dart';

/// The response to a [Request].
///
/// [T] is the type of the deserialized body.
///
/// Before using [data] check that the response [hasData].
@immutable
class Response<T> extends Equatable {
  /// Creates a new response.
  const Response({
    required this.request,
    required this.httpRequest,
    required this.httpResponse,
    required this.body,
    this.json,
    this.data,
  });

  /// The [Request] which created this response.
  final Request<T> request;

  /// The [http.Request] send to the server.
  final http.Request httpRequest;

  /// The [http.BaseResponse] received from the server.
  final http.BaseResponse httpResponse;

  /// The as utf8 decoded body of the response.
  final String body;

  /// The as json decoded body of the response.
  final dynamic json;

  /// The deserialized body of the response.
  final T? data;

  /// The status code of [httpResponse].
  int get statusCode => httpResponse.statusCode;

  /// Whether [statusCode] is below 400.
  bool get isOk => statusCode < 400;

  /// Whether this response [isOk] and [data] is not `null`.
  bool get hasData => isOk && data != null;

  /// Returns [data] if this request [hasData]. If the request has no data a
  /// [StateError] is thrown.
  T get() {
    if (!isOk) {
      throw StateError('Request is not OK: $statusCode\n$body');
    }

    if (!hasData) {
      throw StateError('Request has no data: $statusCode\n$body');
    }

    return data!;
  }

  @override
  List<Object?> get props => [
        request,
        httpRequest,
        httpResponse,
        body,
        json,
        data,
      ];
}
