/// Contract for synchronous use cases that receive [Input] and return [Output].
///
/// This foundation intentionally contains no challenge-specific implementation.
abstract interface class UseCase<Output, Input> {
  Output call(Input input);
}

/// Input type for use cases that require no parameters.
final class NoInput {
  const NoInput();
}
