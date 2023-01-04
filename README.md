![alt Banner of the openai_client project](https://raw.githubusercontent.com/Azzeccagarbugli/openai_client/main/assets/banner.png)

The [**OpenAI API**](https://beta.openai.com/docs/introduction) can be applied to virtually any task that involves understanding or generating natural language or code. They offer a spectrum of models with different levels of power suitable for different tasks, as well as the ability to fine-tune your own custom models.

# ℹ️ Info

This is an unofficial client, written purely in Dart that allows you to _easily_ use the API in your Dart or Flutter projects.

|                                   APIs                                    |     Dart class      | Implementation status |
| :-----------------------------------------------------------------------: | :-----------------: | :-------------------: |
|      [**Models**](https://beta.openai.com/docs/api-reference/models)      |   `OpenAIModels`    |          ✅           |
| [**Completions**](https://beta.openai.com/docs/api-reference/completions) | `OpenAICompletions` |          ✅           |
|       [**Edits**](https://beta.openai.com/docs/api-reference/edits)       |    `OpenAIEdits`    |          ✅           |
|      [**Images**](https://beta.openai.com/docs/api-reference/models)      |   `OpenAIImages`    |          ✅           |
|  [**Embeddings**](https://beta.openai.com/docs/api-reference/embeddings)  | `OpenAIEmbeddings`  |          ✅           |
|       [**Files**](https://beta.openai.com/docs/api-reference/files)       |    `Not present`    |          ❌           |
|  [**Fine-tunes**](https://beta.openai.com/docs/api-reference/fine-tunes)  |    `Not present`    |          ❌           |
| [**Moderations**](https://beta.openai.com/docs/api-reference/moderations) | `OpenAIModerations` |          ✅           |

# 🧰 Installation

You can install the package by adding it to your `pubspec.yaml` file.

```yaml
dependencies:
  openai_client: last_version
```

After the installation you would just need to import the package in your project.

```dart
import 'package:openai_client/openai_client.dart';
```

# 🚀 Getting Started

In order to use the API, you need to have an API key. You can get one [**here**](https://beta.openai.com/account/api-keys) and once you have it, you can use it in the client passing the key itself in the `OpenAIConfiguration` constructor.

```dart
// Create the configuration
final conf = OpenAIConfiguration(
    apiKey: 'Your API key',
    organizationId: 'Your organization ID', // Optional
);

// Create a new client
final client = OpenAIClient(configuration: conf);
```

# 🐛 Debugging

For testing and debugging purposes, you can use the built-in `Logger` to more easily check the status of requests and responses.

By default, the `Logger` is disabled. You can enable it by setting the `enableLogging` property to `true`.

```dart
// The instance of the client with the logger enabled
final client = OpenAIClient(
    ...
    enableLogging: true,
);
```

# 🎯 Examples

The provided example is a simple command line application that allows you to test the client. You can find it in the `example` folder.

# 📚 Documentation

The full documentation of the project is available [**here**](https://pub.dev/documentation/openai_client/latest/). All the methods are documented, and you can easily check the parameters that you can pass to them.

# 🤝 Contributing

If you want to contribute to `openai_client`, please make sure to review the [contribution guidelines](https://github.com/Azzeccagarbugli/openai_client/blob/master/CONTRIBUTING.md).

This project makes use of [GitHub issues](https://github.com/Azzeccagarbugli/openai_client/issues) for
tracking **requests and bugs only**, so please _don't_ use issues for general questions and discussion.

# 🪪 License

This project is licensed under the [**BSD-3-Clause**](https://raw.githubusercontent.com/Azzeccagarbugli/openai_client/main/LICENSE).

Furthermore, it's not affiliated with **OpenAI** in any way.
