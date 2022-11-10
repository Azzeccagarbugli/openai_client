import 'dart:developer';

import 'package:openai_client/openai_client.dart';

void main() {
  // Create a new client
  final openai = OpenAIClient();

  // Print the client object
  log(openai.toString());
}
