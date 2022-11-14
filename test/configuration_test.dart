import 'package:openai_client/openai_client.dart';
import 'package:test/test.dart';

void main() {
  const configuration = OpenAIConfiguration(
    apiKey: 'test',
    organizationId: 'test',
  );

  group('Test the configuration class', () {
    test(
      'Checking equality of two instances of the same class',
      () {
        const configuration2 = OpenAIConfiguration(
          apiKey: 'test',
          organizationId: 'test',
        );

        expect(configuration, configuration2);
      },
    );
    test(
      'Checking equality of two instances of the same class with different values',
      () {
        const configuration2 = OpenAIConfiguration(
          apiKey: 'test2',
          organizationId: 'test2',
        );

        expect(configuration, isNot(configuration2));
      },
    );
    test(
      'Checking hashCode of two instances of the same class',
      () {
        const configuration2 = OpenAIConfiguration(
          apiKey: 'test',
          organizationId: 'test',
        );

        expect(configuration.hashCode, configuration2.hashCode);
      },
    );
    test(
      'Parameters are not null',
      () {
        expect(configuration.apiKey, isNotNull);
        expect(configuration.organizationId, isNotNull);
      },
    );
  });
}
