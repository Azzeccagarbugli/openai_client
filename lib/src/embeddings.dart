import 'package:http/http.dart' as http;
import 'package:openai_client/src/client.dart';
import 'package:openai_client/src/logger/logger.dart';
import 'package:openai_client/src/model/model.dart';
import 'package:openai_client/src/network/network.dart';

/// Get a vector representation of a given input that can be easily
/// consumed by machine learning models and algorithms.
///
/// For more detail see the  [Embeddings](https://beta.openai.com/docs/api-reference/embeddings).
class OpenAIEmbeddings {
  /// Creates a new instance which belongs to [client].
  OpenAIEmbeddings(this.client)
      : baseUrl = client.baseUrl.resolve(apiEmbeddings);

  /// The parent [OpenAIClient].
  final OpenAIClient client;

  /// The base url for all endpoints for [Embeddings].
  ///
  /// See more at [Embeddings](https://beta.openai.com/docs/api-reference/embeddings).
  final Uri baseUrl;

  /// Creates an embedding vector representing the input text.
  ///
  /// A deeper explanation of the parameters can be found
  /// in the [OpenAI API documentation](https://beta.openai.com/docs/api-reference/embeddings/create).
  Request<Embeddings> create({
    required String model,
    required List<String> input,
    String? user,
  }) {
    Logger(
      title: 'Embdeddings',
      description: 'Fetching is started...',
      level: Level.debug,
      isActive: client.enableLogging,
    ).log();

    final jsonBody = <String, dynamic>{
      'model': model,
      'input': input.map((e) => '$e\n').toString(),
      if (user != null) 'user': user,
    };

    final req = Request(
      client: client,
      httpRequest: http.Request('POST', baseUrl),
      bodyDeserializer: (body) =>
          Embeddings.fromMap(body as Map<String, dynamic>),
      jsonBody: jsonBody,
    );

    Logger(
      title: 'Embeddings',
      description: 'Returning the request...',
      level: Level.info,
      isActive: client.enableLogging,
    ).log();

    return req;
  }
}
