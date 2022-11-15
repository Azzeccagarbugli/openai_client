import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:openai_client/openai_client.dart';

Future<void> main() async {
  // Load app credentials from environment variables or file.
  final configuration = await loadConfigurationFromEnvFile();

  // Create a new client.
  final client = OpenAIClient(
    configuration: configuration,
    enableLogging: true,
  );

  // Fetch the models.
  final models = await client.models.list().data;
  // Print the models list.
  log(models.toString());

  // Fetch a model by ID.
  final modelId = await client.models.byId(id: 'text-davinci-002').data;
  // Print the model.
  log(modelId.toString());

  // Create a completion.
  final completion = await client.completions
      .create(
        model: 'text-davinci-002',
        prompt: 'Batman was sleeping in his room when suddenly',
      )
      .data;
  // Print the completion.
  log(completion.toString());

  // Close the client and terminate the [http] connection.
  client.close();
}

/// Loads [OpenAIConfiguration] from environment variables
/// (`API_KEY`, `ORG_ID`).
///
/// Returns `null` if the variables do not exist.
Future<OpenAIConfiguration> loadConfigurationFromEnvFile() async {
  final file = File('.env.json');
  final content = await file.readAsString();
  final json = jsonDecode(content) as Map<String, dynamic>;

  return OpenAIConfiguration(
    apiKey: json['API_KEY'] as String,
    organizationId: json['ORG_ID'] as String,
  );
}
