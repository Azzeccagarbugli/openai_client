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

  group('Completion', () {
    test('Create a completions', () async {
      final req = client.completions.create(
        model: '',
        prompt: '',
      );

      expect(
        req,
        matchHttpRequest(
          method: 'POST',
          path: client.completions.baseUrl.path,
        ),
      );
    });
  });
}
