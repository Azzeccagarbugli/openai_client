/// The version of the API.
const apiVersion = 'v1';

/// The base url of the API.
const baseUrlOpenAI = 'https://api.openai.com/$apiVersion/';

/// The base url for all endpoints for [Models].
const apiModels = 'models';

/// The base url for all endpoints for [Completions].
const apiCompletions = 'completions';

/// The base url for all endpoints for [Edits].
const apiEdits = 'edits';

/// The base url for all endpoints for [Images].
const apiImages = 'images';

/// The [generation] url for the creation of the [Images].
const apiImagesGenerations = '$apiImages/generations';

/// The [edit] url for the editing of the [Images].
const apiImagesEdits = '$apiImages/edits';

/// The [variation] url for the variation of the [Images].
const apiImagesVariations = '$apiImages/variations';

/// The base url for all endpoints for [Embeddings].
const apiEmbeddings = 'embeddings';
