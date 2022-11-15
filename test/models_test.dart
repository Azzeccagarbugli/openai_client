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

  group('Models', () {
    test('Retrive the list of models', () async {
      final req = client.models.list();

      expect(
        req.httpRequest,
        matchHttpRequest(
          method: 'GET',
          path: client.models.baseUrl.path,
        ),
      );
    });

    test('Retrive a specified model by ID', () async {
      const id = 'batman';
      final req = client.models.byId(id: id);

      expect(
        req.httpRequest,
        matchHttpRequest(
          method: 'GET',
          path: client.models.baseUrl.resolve('$apiModels/$id').path,
        ),
      );
    });
  });
}
