import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

/// The configuration class for the **OpenAI** API.
///
/// It is required to provide an **API key** to
/// use the API and the **Organization ID** is optional.
///
/// For more information, see the [OpenAI API documentation](https://beta.openai.com/docs/api-reference/authentication).
@immutable
class OpenAIConfiguration extends Equatable {
  /// Creates a new [OpenAIConfiguration].
  ///
  /// The `apiKey` is required to use the API.
  const OpenAIConfiguration({
    required this.apiKey,
    this.organizationId,
  });

  /// The API key to use to authenticate with the API.
  final String apiKey;

  /// The organization ID to use to authenticate with the API.
  final String? organizationId;

  @override
  List<Object?> get props => [apiKey, organizationId];
}
