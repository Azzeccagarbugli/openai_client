import 'package:http/http.dart' as http;
import 'package:openai_client/src/client.dart';
import 'package:openai_client/src/logger/logger.dart';
import 'package:openai_client/src/model/openai_chat/openai_chat.dart';
import 'package:openai_client/src/network/network.dart';

/// Given a chat conversation, the model will return a chat completion response.
///
/// For more detail see the [OpenAI API documentation](https://beta.openai.com/docs/api-reference/chat).
class OpenAIChat {
  /// Creates a new instance which belongs to [client].
  OpenAIChat(this.client) : baseUrl = client.baseUrl.resolve(apiChat);

  /// The parent [OpenAIClient].
  final OpenAIClient client;

  /// The base url for all endpoints for [Chat].
  ///
  /// See more at [Chat](https://beta.openai.com/docs/api-reference/chat).
  final Uri baseUrl;

  /// Creates a completion for the chat message.
  ///
  /// A deeper explanation of the parameters can be
  /// found in the [OpenAI API documentation](https://beta.openai.com/docs/api-reference/chat/create).
  Request<Chat> create({
    required String model,
    required List<ChatMessage> messages,
    double? temperature = 1.0,
    double? topP = 1.0,
    int? n = 1,
    bool stream = false,
    String? stop,
    int? maxTokens,
    int? presencePenalty = 0,
    int? frequencyPenalty = 0,
    Map<String, dynamic>? logitBias,
    String? user,
  }) {
    Logger(
      title: 'Chat',
      description: 'Fetching is started...',
      level: Level.debug,
      isActive: client.enableLogging,
    );

    if (temperature != null) {
      assert(
        temperature > 0 && temperature <= 2,
        'Temperature must be between 0 and 2',
      );
    }

    final jsonBody = <String, dynamic>{
      'model': model,
      'messages': messages.map((e) => e.toMap()).toList(),
      'temperature': temperature,
      'top_p': topP,
      'n': n,
      'stream': stream,
      if (stop != null) 'stop': stop,
      if (maxTokens != null) 'max_tokens': maxTokens,
      'presence_penalty': presencePenalty,
      'frequency_penalty': frequencyPenalty,
      if (logitBias != null) 'logit_bias': logitBias,
      if (user != null) 'user': user,
    };

    final req = Request(
      client: client,
      httpRequest: http.Request('POST', baseUrl),
      bodyDeserializer: (body) => Chat.fromMap(body as Map<String, dynamic>),
      jsonBody: jsonBody,
    );

    Logger(
      title: 'Chat',
      description: 'Returning the request...',
      level: Level.info,
      isActive: client.enableLogging,
    );

    return req;
  }
}
