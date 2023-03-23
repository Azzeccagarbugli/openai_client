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

  group('Chat', () {
    test('Create a chat', () async {
      final req = client.chat.create(
        model: '',
        messages: const [
          ChatMessage(
            role: '',
            content: '',
          ),
        ],
      );

      expect(
        req.httpRequest,
        matchHttpRequest(
          method: 'POST',
          path: client.chat.baseUrl.path,
        ),
      );
    });
  });
}
