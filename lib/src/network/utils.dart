import 'package:openai_client/src/configuration.dart';
import 'package:openai_client/src/network/request.dart';

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
