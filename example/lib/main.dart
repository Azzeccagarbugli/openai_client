import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:openai_client/openai_client.dart';
import 'package:openai_client/src/model/openai_chat/chat_message.dart';

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

  // Create a chat.
  final chat = await client.chat
      .create(
          model: 'gpt-3.5-turbo',
          message: const ChatMessage(
            role: 'user',
            content: 'How do you think is Batman dealing with Robin recently?',
          ))
      .data;
  // Print the chat.
  log(chat.toString());

  // Create an edit.
  final edit = await client.edits
      .create(
        model: 'text-davinci-edit-001',
        instruction: 'Fix the spelling mistakes',
        input: 'Batmaen and Robin were playing ches in the Batcave',
      )
      .data;
  // Print the edit.
  log(edit.toString());

  // Create an image.
  final image = await client.images
      .create(
        prompt: 'Batman is walking down the street with his friends',
        n: 2,
      )
      .data;
  // Print the image.
  log(image.toString());

  // Create an embedding.
  final embedding = await client.embeddings.create(
    model: 'text-similarity-babbage-001',
    input: ['Batman was talking to Alfred'],
  ).data;
  // Print the embedding.
  log(embedding.toString());

  final moderation =
      await client.moderations.create(input: 'Batman is a bad boy').data;
  // Print the moderation.
  log(moderation.toString());

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
