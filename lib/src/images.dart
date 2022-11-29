import 'package:http/http.dart' as http;
import 'package:openai_client/src/client.dart';
import 'package:openai_client/src/logger/logger.dart';
import 'package:openai_client/src/model/model.dart';
import 'package:openai_client/src/network/network.dart';

/// Given a prompt and/or an input image, the model will generate a new image.
///
/// For more detail see the [OpenAI API documentation](https://beta.openai.com/docs/api-reference/images).
class OpenAIImages {
  /// Creates a new instance which belongs to [client].
  OpenAIImages(this.client) : baseUrl = client.baseUrl.resolve(apiImages);

  /// The parent [OpenAIClient].
  final OpenAIClient client;

  /// The base url for all endpoints for [Images].
  ///
  /// See more at [Images](https://beta.openai.com/docs/api-reference/images).
  final Uri baseUrl;

  /// Creates an image given a prompt.
  ///
  /// A deeper explanation of the parameters can
  /// be found in the [OpenAI API documentation](https://beta.openai.com/docs/api-reference/images/create).
  Request<Images> create({
    required String prompt,
    int n = 1,
    ImageSize size = ImageSize.large,
    ResponseFormat responseFormat = ResponseFormat.url,
    String? user,
  }) {
    Logger(
      title: 'Images',
      description: 'Fetching is started...',
      level: Level.debug,
      isActive: client.enableLogging,
    ).log();

    final jsonBody = <String, dynamic>{
      'prompt': prompt,
      'n': n,
      'size': size.dimension,
      'response_format': responseFormat.format,
      if (user != null) 'user': user,
    };

    final url = baseUrl.resolve(apiImagesGenerations);

    final req = Request(
      client: client,
      httpRequest: http.Request('POST', url),
      bodyDeserializer: (body) => Images.fromMap(body as Map<String, dynamic>),
      jsonBody: jsonBody,
    );

    Logger(
      title: 'Images',
      description: 'Returning the request...',
      level: Level.info,
      isActive: client.enableLogging,
    ).log();

    return req;
  }
}
