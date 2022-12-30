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

  group('Moderation', () {
    test('Create a moderation', () async {
      final req = client.moderations.create(input: '');

      expect(
        req.httpRequest,
        matchHttpRequest(
          method: 'POST',
          path: client.moderations.baseUrl.path,
        ),
      );
    });
  });
}
