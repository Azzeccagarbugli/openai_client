import 'package:http/http.dart' as http;
import 'package:openai_client/src/completions.dart';
import 'package:openai_client/src/configuration.dart';
import 'package:openai_client/src/edits.dart';
import 'package:openai_client/src/images.dart';
import 'package:openai_client/src/models.dart';
import 'package:openai_client/src/network/network.dart';

/// The class that represents a client connection to the **OpenAI** API.
///
/// `HTTP` calls are made through the [http](https://pub.dev/packages/http)
/// package, which provides a platform independent client, making the
/// [OpenAIClient] platform independent as well.
///
/// For more detail see the [OpenAI API documentation](https://beta.openai.com/docs/api-reference).
class OpenAIClient {
  /// Creates a new instance of the [OpenAIClient].
  ///
  /// [OpenAIConfiguration] must not be `null`.
  ///
  /// If no [httpClient] is provided, one is created.
  OpenAIClient({
    required this.configuration,
    http.Client? httpClient,
    bool? enableLogging,
  })  : _http = httpClient ?? http.Client(),
        enableLogging = enableLogging ?? false;

  /// The [OpenAIConfiguration] used by this client.
  final OpenAIConfiguration configuration;

  /// The URI for the base url of the Too Good To Go API.
  final Uri baseUrl = Uri.parse(baseUrlOpenAI);

  /// Value indicating whether the logger should be enabled.
  bool enableLogging;

  /// Private [http.Client] used to make the `HTTP` calls.
  final http.Client _http;

  /// Get the [http.Client] used by this client.
  http.Client get httpClient => _http;

  var _closed = false;

  /// Check if the [http.Client] is closed.
  bool get isClosed => _closed;

  /// Provides access to resources related to [Models].
  OpenAIModels get models => OpenAIModels(this);

  /// Provides access to resources related to [Completions].
  OpenAICompletions get completions => OpenAICompletions(this);

  /// Provides access to resources related to [Edits].
  OpenAIEdits get edits => OpenAIEdits(this);

  /// Provides access to resources related to [Images].
  OpenAIImages get images => OpenAIImages(this);

  /// Closes this client and frees allocated resources.
  ///
  /// Failure to close this a client might cause the dart process to hang.
  ///
  /// After this method has been called this instance must not be used any more.
  void close() {
    _closed = true;
    _http.close();
  }
}
