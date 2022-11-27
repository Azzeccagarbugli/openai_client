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

  group('Edits', () {
    test('Create an edit', () async {
      final req = client.edits.create(
        model: '',
        instruction: '',
      );

      expect(
        req.httpRequest,
        matchHttpRequest(
          method: 'POST',
          path: client.edits.baseUrl.path,
        ),
      );
    });
  });
}
