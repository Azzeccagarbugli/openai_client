import 'package:http/http.dart' as http;
import 'package:openai_client/openai_client.dart';

/// List and describe the various models available in the API.
///
/// You can refer to the Models documentation to understand
/// what models are available and the differences between them.
///
/// For more detail see the [OpenAI API documentation](https://beta.openai.com/docs/api-reference/models).
class OpenAIModels {
  /// Creates a new instance which belongs to [client].
  OpenAIModels(this.client) : baseUrl = client.baseUrl.resolve(apiModels);

  /// The parent [OpenAIClient].
  final OpenAIClient client;

  /// The base url for all endpoints for [Models].
  ///
  /// See more at [Models](https://beta.openai.com/docs/api-reference/models).
  final Uri baseUrl;

  /// Lists the currently available models, and provides
  /// basic information about each one such as the owner and availability.
  Future<Models> list() async {
    Logger(
      title: 'Models',
      description: 'Fetching is started...',
      level: Level.debug,
      isActive: client.enableLogging,
    ).log();

    final req = Request(
      client: client,
      httpRequest: http.Request('GET', baseUrl),
      bodyDeserializer: (body) => Models.fromMap(body as Map<String, dynamic>),
    );

    final res = await req.go();

    if (res.statusCode == 200) {
      Logger(
        title: 'Models',
        description: 'The models are fetched successfully!',
        level: Level.info,
        isActive: client.enableLogging,
      ).log();
      return req.goAndGet();
    } else if (res.statusCode == 403) {
      throw Exception(
        'Not authorized, API key is invalid or not provided.',
      );
    } else {
      throw Exception(
        'Models not fetched • Stauts code: ${res.statusCode}.',
      );
    }
  }

  /// Retrieves a model instance, providing basic information
  /// about the model such as the owner and permissioning.
  Future<Data> byId({required String id}) async {
    Logger(
      title: 'Model by id',
      description: 'Fetching is started...',
      level: Level.debug,
      isActive: client.enableLogging,
    ).log();

    final url = baseUrl.replace(path: '${baseUrl.path}/$id');

    final req = Request(
      client: client,
      httpRequest: http.Request('GET', url),
      bodyDeserializer: (body) => Data.fromMap(body as Map<String, dynamic>),
    );

    final res = await req.go();

    if (res.isOk) {
      Logger(
        title: 'Model by id',
        description: 'The model was fetched successfully!',
        level: Level.info,
        isActive: client.enableLogging,
      ).log();
      return req.goAndGet();
    } else if (res.statusCode == 403) {
      throw Exception(
        'Not authorized, API key is invalid or not provided.',
      );
    } else {
      throw Exception(
        'Models not fetched • Stauts code: ${res.statusCode}.',
      );
    }
  }
}
