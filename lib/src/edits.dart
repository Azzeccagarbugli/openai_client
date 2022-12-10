import 'package:http/http.dart' as http;
import 'package:openai_client/src/client.dart';
import 'package:openai_client/src/logger/logger.dart';
import 'package:openai_client/src/model/model.dart';
import 'package:openai_client/src/network/network.dart';

/// Given a prompt and an instruction, the model will return an edited version of the prompt.
///
/// For more detail see the [OpenAI API documentation](https://beta.openai.com/docs/api-reference/edits).
class OpenAIEdits {
  /// Creates a new instance which belongs to [client].
  OpenAIEdits(this.client) : baseUrl = client.baseUrl.resolve(apiEdits);

  /// The parent [OpenAIClient].
  final OpenAIClient client;

  /// The base url for all endpoints for [Edits].
  ///
  /// See more at [Edits](https://beta.openai.com/docs/api-reference/edits).
  final Uri baseUrl;

  /// Creates a new edit for the provided input, instruction, and parameters.
  ///
  /// A deeper explanation of the parameters can be found
  /// in the [OpenAI API documentation](https://beta.openai.com/docs/api-reference/edits/create).
  Request<Edits> create({
    required String model,
    String input = '',
    required String instruction,
    int n = 1,
    double temperature = 1.0,
    int topP = 1,
  }) {
    Logger(
      title: 'Edits',
      description: 'Fetching is started...',
      level: Level.debug,
      isActive: client.enableLogging,
    ).log();

    final jsonBody = <String, dynamic>{
      'model': model,
      'input': input,
      'instruction': instruction,
      'n': n,
      'temperature': temperature,
      'top_p': topP,
    };

    final req = Request(
      client: client,
      httpRequest: http.Request('POST', baseUrl),
      bodyDeserializer: (body) => Edits.fromMap(body as Map<String, dynamic>),
      jsonBody: jsonBody,
    );

    Logger(
      title: 'Edits',
      description: 'Returning the request...',
      level: Level.info,
      isActive: client.enableLogging,
    ).log();

    return req;
  }
}
