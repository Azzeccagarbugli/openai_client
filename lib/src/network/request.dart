import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:openai_client/openai_client.dart';

/// A request holds all the information necessary to make a request to the api.
///
/// [T] is the type of the deserialized body.
///
/// A request is immutable and can be executed multiple times, each time
/// returning a new [Response]. To execute it and receive a [Response], call
/// [go].
///
/// The internal state of [httpRequest] and [jsonBody] should not be mutated.
@immutable
class Request<T> {
  /// Creates a new request.
  const Request({
    required this.client,
    required this.httpRequest,
    this.jsonBody,
    this.bodyDeserializer,
    this.customHeaders,
  });

  /// The [OpenAIClient] this request was created with.
  final OpenAIClient client;

  /// The [http.Request], as built by the endpoint, which created this request.
  ///
  /// The [http.Request] actually sent, might be different and is available
  /// through [Response.httpRequest].
  final http.Request httpRequest;

  /// The common dart json representation of the request body.
  ///
  /// This value will be encoded with [JsonEncoder].
  final dynamic jsonBody;

  /// The function used to transform the json response into [T].
  final BodyDeserializer<T>? bodyDeserializer;

  /// The custom headers that will be sent with the request.
  ///
  /// These headers will be merged with the headers
  /// from [httpRequest] and the authentication will be preserved.
  final Map<String, String>? customHeaders;

  /// Execute this [Request] and return its [Response].
  ///
  /// Might reject with [http.ClientException] during a network failure.
  Future<Response<T>> go() async {
    if (client.isClosed) {
      throw StateError(
        'Cannot execute request because OpenAIClient has already been closed.',
      );
    }

    final httpRequest = _prepareRequest();
    http.StreamedResponse httpResponse;
    String body;
    dynamic json;
    T? data;

    httpResponse = await client.httpClient.send(httpRequest);

    body = await httpResponse.stream.bytesToString();

    try {
      json = jsonDecode(body);
    } catch (e) {
      // ignore: avoid_catches_without_on_clauses
    }

    if (httpResponse.statusCode < 400 &&
        json != null &&
        bodyDeserializer != null) {
      data = bodyDeserializer!(json);
    }

    return Response(
      request: this,
      httpRequest: httpRequest,
      httpResponse: httpResponse,
      body: body,
      json: json,
      data: data,
    );
  }

  http.Request _prepareRequest() {
    final request = _copyRequest();

    if (jsonBody != null) {
      request.body = jsonEncode(jsonBody);
    }

    request.headers.addAll(_createHeaders());

    return request;
  }

  http.Request _copyRequest() {
    final request = http.Request(httpRequest.method, httpRequest.url);
    request.headers.addAll(httpRequest.headers);
    request.maxRedirects = httpRequest.maxRedirects;
    request.followRedirects = httpRequest.followRedirects;
    request.persistentConnection = httpRequest.persistentConnection;
    request.encoding = httpRequest.encoding;
    request.bodyBytes = httpRequest.bodyBytes;
    return request;
  }

  Map<String, String> _createHeaders() {
    final headers = <String, String>{};

    headers.addAll(publicActionAuthHeader(
      configuration: client.configuration,
    ));

    if (customHeaders != null) {
      headers.addAll(customHeaders!);
      return headers;
    }

    if (jsonBody != null) {
      headers.addAll({
        'Content-Type': 'application/json',
      });
    }

    return headers;
  }
}
