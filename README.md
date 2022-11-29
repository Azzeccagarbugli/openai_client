![alt Banner of the openai_client project](https://raw.githubusercontent.com/Azzeccagarbugli/openai_client/main/assets/banner.png)

The [**OpenAI API**](https://beta.openai.com/docs/introduction) can be applied to virtually any task that involves understanding or generating natural language or code. They offer a spectrum of models with different levels of power suitable for different tasks, as well as the ability to fine-tune your own custom models.

This is an unofficial client, written purely in Dart that allows you to _easily_ use the API in your Dart or Flutter projects.

# Getting Started

In order to use the API, you need to have an API key. You can get one [**here**](https://beta.openai.com/account/api-keys) and once you have it, you can use it in the client passing the key itself in the `configuration` constructor.

```dart
// Create the configuration
final conf = OpenAIConfiguration(
    apiKey: 'Your API key',
    organizationId: 'Your organization ID' // Optional,
    );

// Create a new client
final client = OpenAIClient(configuration: conf);
```

## Debugging

For testing and debugging purposes, you can use the built-in `Logger` to more easily check the status of requests and responses.

By default, the `Logger` is disabled. You can enable it by setting the `enableLogging` property to `true`.

```dart
final client = OpenAIClient(
    ...
    enableLogging: true,
);
```

# Documentation

The full documentation of the project is available [here](https://pub.dev/documentation/openai_client/latest/). All the methods are documented, and you can easily check the parameters that you can pass to them.

## Contributing

If you want to contribute to `openai_client`, please make sure to review the [contribution guidelines](https://github.com/Azzeccagarbugli/openai_client/blob/master/CONTRIBUTING.md).

This project makes use of [GitHub issues](https://github.com/Azzeccagarbugli/openai_client/issues) for
tracking **requests and bugs only**, so please _don't_ use issues for general questions and discussion.

# Examples

The provided example is a simple command line application that allows you to test the client. You can find it in the `example` folder.
