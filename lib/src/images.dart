import 'dart:io';

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
      title: 'Images creation',
      description: 'Fetching is started...',
      level: Level.debug,
      isActive: client.enableLogging,
    );

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
      title: 'Images creation',
      description: 'Returning the request...',
      level: Level.info,
      isActive: client.enableLogging,
    );

    return req;
  }

  /// Creates an edited or extended image given an original image and a prompt.
  ///
  /// A deeper explanation of the parameters can
  /// be found in the [OpenAI API documentation](https://beta.openai.com/docs/api-reference/images/edit).
  Request<Images> edit({
    required File image,
    File? mask,
    required String prompt,
    int n = 1,
    ImageSize size = ImageSize.large,
    ResponseFormat responseFormat = ResponseFormat.url,
    String? user,
  }) {
    Logger(
      title: 'Images editing',
      description: 'Fetching is started...',
      level: Level.debug,
      isActive: client.enableLogging,
    );

    final jsonBody = <String, dynamic>{
      'image': image.path,
      if (mask != null) 'mask': mask.path,
      'prompt': prompt,
      'n': n,
      'size': size.dimension,
      'response_format': responseFormat.format,
      if (user != null) 'user': user,
    };

    final url = baseUrl.resolve(apiImagesEdits);

    final req = Request(
      client: client,
      httpRequest: http.Request('POST', url),
      bodyDeserializer: (body) => Images.fromMap(body as Map<String, dynamic>),
      jsonBody: jsonBody,
    );

    Logger(
      title: 'Images editing',
      description: 'Returning the request...',
      level: Level.info,
      isActive: client.enableLogging,
    );

    return req;
  }

  /// Creates a variation of a given image.
  ///
  /// A deeper explanation of the parameters can
  /// be found in the [OpenAI API documentation](https://beta.openai.com/docs/api-reference/images/variation).
  Request<Images> variation({
    required File image,
    int n = 1,
    ImageSize size = ImageSize.large,
    ResponseFormat responseFormat = ResponseFormat.url,
    String? user,
  }) {
    Logger(
      title: 'Images variation',
      description: 'Fetching is started...',
      level: Level.debug,
      isActive: client.enableLogging,
    );

    final jsonBody = <String, dynamic>{
      'image': image.path,
      'n': n,
      'size': size.dimension,
      'response_format': responseFormat.format,
      if (user != null) 'user': user,
    };

    final url = baseUrl.resolve(apiImagesVariations);

    final req = Request(
      client: client,
      httpRequest: http.Request('POST', url),
      bodyDeserializer: (body) => Images.fromMap(body as Map<String, dynamic>),
      jsonBody: jsonBody,
    );

    Logger(
      title: 'Images variation',
      description: 'Returning the request...',
      level: Level.info,
      isActive: client.enableLogging,
    );

    return req;
  }
}
