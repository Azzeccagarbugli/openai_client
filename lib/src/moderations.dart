import 'package:http/http.dart' as http;
import 'package:openai_client/src/client.dart';
import 'package:openai_client/src/logger/logger.dart';
import 'package:openai_client/src/model/model.dart';
import 'package:openai_client/src/network/network.dart';

/// Given a input text, outputs if the model
/// classifies it as violating OpenAI's content policy.
///
/// For more detail see the [OpenAI API documentation](https://beta.openai.com/docs/api-reference/moderation).
class OpenAIModerations {
  /// Creates a new instance which belongs to [client].
  OpenAIModerations(this.client)
      : baseUrl = client.baseUrl.resolve(apiModerations);

  /// The parent [OpenAIClient].
  final OpenAIClient client;

  /// The base url for all endpoints for [Moderation].
  ///
  /// See more at [Moderation](https://beta.openai.com/docs/api-reference/moderation).
  final Uri baseUrl;

  /// Classifies if text violates OpenAI's Content Policy.
  ///
  /// A deeper explanation of the parameters can be found
  /// in the [OpenAI API documentation](https://beta.openai.com/docs/api-reference/moderation/create).
  Request<Moderations> create({
    required String input,
    ModerationsModel model = ModerationsModel.latest,
  }) {
    Logger(
      title: 'Moderation creation',
      description: 'Fetching is started...',
      level: Level.debug,
      isActive: client.enableLogging,
    );

    final jsonBody = <String, dynamic>{
      'input': input,
      'model': model.label,
    };

    final req = Request(
      client: client,
      httpRequest: http.Request('POST', baseUrl),
      bodyDeserializer: (body) =>
          Moderations.fromMap(body as Map<String, dynamic>),
      jsonBody: jsonBody,
    );

    Logger(
      title: 'Moderation creation',
      description: 'Returning the request...',
      level: Level.info,
      isActive: client.enableLogging,
    );

    return req;
  }
}
