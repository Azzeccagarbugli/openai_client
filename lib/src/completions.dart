import 'package:http/http.dart' as http;
import 'package:openai_client/src/client.dart';
import 'package:openai_client/src/logger/logger.dart';
import 'package:openai_client/src/model/model.dart';
import 'package:openai_client/src/network/network.dart';

/// Creates a completion for the provided prompt and parameters.
///
/// For more detail see the [OpenAI API documentation](https://beta.openai.com/docs/api-reference/completions/create).
class OpenAICompletions {
  /// Creates a new instance which belongs to [client].
  OpenAICompletions(this.client)
      : baseUrl = client.baseUrl.resolve(apiCompletions);

  /// The parent [OpenAIClient].
  final OpenAIClient client;

  /// The base url for all endpoints for [Completions].
  ///
  /// See more at [Completions](https://beta.openai.com/docs/api-reference/completions).
  final Uri baseUrl;

  /// Creates a completion for the provided prompt and parameters.
  ///
  /// A deeper explanation of the parameters can be
  /// found in the [OpenAI API documentation](https://beta.openai.com/docs/api-reference/completions/create).
  Request<Completion> create({
    required String model,
    String? prompt,
    String? suffix,
    int maxTokens = 16,
    int temperature = 1,
    int topP = 1,
    int n = 1,
    bool stream = false,
    int? logprobs,
    bool echo = false,
    String? stop,
    int presencePenalty = 0,
    int frequencyPenalty = 0,
    int bestOf = 1,
    Map<String, dynamic>? logitBias,
    String? user,
  }) {
    Logger(
      title: 'Completions',
      description: 'Fetching is started...',
      level: Level.debug,
      isActive: client.enableLogging,
    ).log();

    final jsonBody = <String, dynamic>{
      'model': model,
      'prompt': prompt,
      'suffix': suffix,
      'max_tokens': maxTokens,
      'temperature': temperature,
      'top_p': topP,
      'n': n,
      'stream': stream,
      'logprobs': logprobs,
      'echo': echo,
      'stop': stop,
      'presence_penalty': presencePenalty,
      'frequency_penalty': frequencyPenalty,
      'best_of': bestOf,
      if (logitBias != null) 'logit_bias': logitBias,
      if (user != null) 'user': user,
    };

    final req = Request(
      client: client,
      httpRequest: http.Request('POST', baseUrl),
      bodyDeserializer: (body) =>
          Completion.fromMap(body as Map<String, dynamic>),
      jsonBody: jsonBody,
    );

    Logger(
      title: 'Completions',
      description: 'Returning the request...',
      level: Level.info,
      isActive: client.enableLogging,
    ).log();

    return req;
  }
}
