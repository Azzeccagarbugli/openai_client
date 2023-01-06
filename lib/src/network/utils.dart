import 'package:openai_client/src/client.dart';
import 'package:openai_client/src/configuration.dart';
import 'package:openai_client/src/logger/logger.dart';
import 'package:openai_client/src/network/network.dart';

/// Body deserializer as [typedef].
typedef BodyDeserializer<T> = T Function(dynamic body);

/// Injection [OpenAIConfiguration] into the header.
Map<String, String> publicActionAuthHeader({
  required OpenAIConfiguration configuration,
}) {
  return {
    'Authorization': 'Bearer ${configuration.apiKey}',
    if (configuration.organizationId != null)
      'OpenAI-Organization': configuration.organizationId!,
  };
}

/// Extension on [Request].
extension RequestExtension<T> on Request<T> {
  /// Executes this request and returns the response's data, in one call.
  ///
  /// See: [Request.go], [Response.get]
  Future<T> get data async {
    return (await go()).get();
  }
}

/// Handles the network request and returns the data.
///
/// Throws an [Exception] if the status code is not 200.
Future<dynamic> handleNetworkRequest(
  OpenAIClient client,
  Response<dynamic> res,
  Request<dynamic> req,
) {
  if (res.statusCode == 200) {
    Logger(
      title: 'Completions',
      description: 'Returning the request...',
      level: Level.info,
      isActive: client.enableLogging,
    );
    return req.data;
  } else if (res.statusCode == 403) {
    throw Exception(
      'Not authorized, check the API key - Stauts code: ${res.statusCode}',
    );
  } else if (res.statusCode == 429) {
    throw Exception(
      'Exceeded the current quota - Stauts code: ${res.statusCode}',
    );
  } else {
    throw Exception(
      'Completions error - Stauts code: ${res.statusCode}',
    );
  }
}
