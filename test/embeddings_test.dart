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

  group('Embeddings', () {
    test('Create an embedding', () async {
      final req = client.embeddings.create(
        model: '',
        input: [''],
      );

      expect(
        req.httpRequest,
        matchHttpRequest(
          method: 'POST',
          path: client.embeddings.baseUrl.path,
        ),
      );
    });
  });
}
