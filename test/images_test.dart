import 'dart:io';

import 'package:openai_client/openai_client.dart';
import 'package:test/test.dart';

import 'test_utils.dart';

void main() {
  final client = OpenAIClient(
    configuration: const OpenAIConfiguration(
      apiKey: '',
      organizationId: '',
    ),
  );

  group('Images', () {
    test('Create an image', () async {
      final req = client.images.create(
        prompt: '',
      );

      expect(
        req.httpRequest,
        matchHttpRequest(
          method: 'POST',
          path: client.images.baseUrl.resolve(apiImagesGenerations).path,
        ),
      );
    });

    test('Editing an image', () async {
      final req = client.images.edit(
        image: File(''),
        prompt: '',
      );

      expect(
        req.httpRequest,
        matchHttpRequest(
          method: 'POST',
          path: client.images.baseUrl.resolve(apiImagesEdits).path,
        ),
      );
    });

    test('Variate an image', () async {
      final req = client.images.variation(
        image: File(''),
      );

      expect(
        req.httpRequest,
        matchHttpRequest(
          method: 'POST',
          path: client.images.baseUrl.resolve(apiImagesVariations).path,
        ),
      );
    });
  });
}
