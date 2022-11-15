import 'package:openai_client/openai_client.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  test('Executing requests after client has been closed should throw',
      () async {
    final client = OpenAIClient(
      configuration: const OpenAIConfiguration(
        apiKey: '',
        organizationId: '',
      ),
    );

    client.close();

    final req = client.models.list().data;

    expect(req, throwsStateError);
  });
}
