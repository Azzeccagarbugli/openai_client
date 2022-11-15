import 'package:collection/collection.dart';
import 'package:http/http.dart' as http;
import 'package:test/test.dart';

Matcher matchHttpRequest({
  required String method,
  String path = '',
  Map<String, String> queryParameters = const {},
}) {
  return MatchRequest(
    method: method,
    path: path,
    queryParameters: queryParameters,
  );
}

class MatchRequest extends Matcher {
  const MatchRequest({
    required this.method,
    required this.path,
    required this.queryParameters,
  });

  static const DeepCollectionEquality queryParametersEquality =
      DeepCollectionEquality.unordered();

  final String method;
  final String path;
  final Map<String, String> queryParameters;

  @override
  Description describe(Description description) {
    return description
        .add('Method: $method\n')
        .add('Path: $path\n')
        .add('Query Parameters: ')
        .addDescriptionOf(queryParameters);
  }

  @override
  Description describeMismatch(
    dynamic item,
    Description mismatchDescription,
    Map<dynamic, dynamic> matchState,
    bool verbose,
  ) {
    assert(item is http.Request);
    final req = item as http.Request;

    return mismatchDescription
        .add('Method: ${req.method}\n')
        .add('Path: ${req.url.path}\n')
        .add('Query Parameters: ')
        .addDescriptionOf(req.url.queryParameters);
  }

  @override
  bool matches(dynamic item, Map<dynamic, dynamic> matchState) {
    assert(item is http.Request);
    final req = item as http.Request;

    return req.method == method &&
        req.url.path == path &&
        queryParametersEquality.equals(
          req.url.queryParameters,
          queryParameters,
        );
  }
}
