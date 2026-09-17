# Engineering References

This document is the research map for the challenge. Prefer primary and official documentation. Do not copy an example without understanding the architectural responsibility it demonstrates.

## 1. Flutter architecture - mandatory reading

### Architecture overview
- Architecting Flutter apps: https://docs.flutter.dev/app-architecture
- Guide to app architecture: https://docs.flutter.dev/app-architecture/guide
- Architecture recommendations: https://docs.flutter.dev/app-architecture/recommendations
- Common architecture concepts: https://docs.flutter.dev/app-architecture/concepts
- Architecture design patterns: https://docs.flutter.dev/app-architecture/design-patterns

Use these references when deciding:
- where a responsibility belongs;
- whether logic is UI, domain, or data logic;
- why repositories exist;
- why a UI should not know the concrete data source;
- whether a domain/use-case layer is justified;
- how unidirectional data flow and a single source of truth affect the design.

Questions you should be able to answer after reading:
- What is separation of concerns?
- What is a repository responsible for?
- What must a widget not do?
- When is an additional domain layer useful?
- Where should orchestration involving multiple repositories live?

## 2. Flutter fundamentals

- Flutter documentation: https://docs.flutter.dev/
- Flutter widget catalog: https://docs.flutter.dev/ui/widgets
- Layouts: https://docs.flutter.dev/ui/layout
- Forms and validation cookbook: https://docs.flutter.dev/cookbook/forms/validation
- Navigation and routing: https://docs.flutter.dev/ui/navigation
- Testing overview: https://docs.flutter.dev/testing/overview
- Unit testing: https://docs.flutter.dev/cookbook/testing/unit/introduction
- Widget testing: https://docs.flutter.dev/cookbook/testing/widget/introduction
- Integration testing: https://docs.flutter.dev/testing/integration-tests
- Debugging Flutter apps: https://docs.flutter.dev/testing/debugging
- DevTools: https://docs.flutter.dev/tools/devtools

Use these references instead of inventing custom solutions for framework problems that Flutter already solves.

## 3. Dart - mandatory coding standards

- Dart documentation: https://dart.dev/docs
- Effective Dart: https://dart.dev/effective-dart
- Effective Dart - Style: https://dart.dev/effective-dart/style
- Effective Dart - Documentation: https://dart.dev/effective-dart/documentation
- Effective Dart - Usage: https://dart.dev/effective-dart/usage
- Effective Dart - Design: https://dart.dev/effective-dart/design
- Dart analyzer: https://dart.dev/tools/dart-analyze
- Dart formatter: https://dart.dev/tools/dart-format
- Dart doc: https://dart.dev/tools/dart-doc
- Dart testing: https://dart.dev/tools/testing
- Asynchronous programming: https://dart.dev/libraries/async/async-await
- Futures and error handling: https://dart.dev/libraries/async/futures-error-handling
- Null safety: https://dart.dev/null-safety

Repository expectations derived from these references:
- types use `UpperCamelCase`;
- variables and methods use `lowerCamelCase`;
- files/directories use `lowercase_with_underscores`;
- run `dart format` rather than manually formatting code;
- use `///` for public API documentation when documentation adds value;
- comments explain why, constraints, or non-obvious decisions rather than restating code.

## 4. Riverpod - state and dependency injection

- Riverpod documentation: https://riverpod.dev/
- Riverpod concepts: https://riverpod.dev/docs/concepts2/providers
- ProviderContainer/ProviderScope concepts: https://riverpod.dev/docs/concepts2/containers
- Consumers: https://riverpod.dev/docs/concepts2/consumers
- Provider lifecycles: https://riverpod.dev/docs/concepts2/auto_dispose
- Provider overrides: https://riverpod.dev/docs/concepts2/overrides
- Testing: https://riverpod.dev/docs/how_to/testing

Use Riverpod deliberately for two different concerns:
1. Dependency composition/injection.
2. Observable application/UI state.

Do not use a provider merely because a value exists. Be able to explain ownership, lifecycle, consumers, and why the state should be observable.

Questions:
- Who owns this state?
- Who can modify it?
- Who observes it?
- What is the lifetime of the dependency/state?
- Can it be overridden in a test?
- Is the provider exposing a contract or leaking an implementation detail?

## 5. GoRouter and navigation

- Flutter navigation overview: https://docs.flutter.dev/ui/navigation
- go_router package: https://pub.dev/packages/go_router
- go_router API: https://pub.dev/documentation/go_router/latest/

Rules:
- route paths/names should be centralized when doing so improves consistency;
- pages should not contain unrelated routing configuration;
- navigation is an application/presentation concern, not domain logic;
- do not pass data through routes when the data has a more appropriate owner.

## 6. Packages and dependency selection

- pub.dev: https://pub.dev/
- Package dependencies: https://dart.dev/tools/pub/dependencies
- Creating packages: https://dart.dev/tools/pub/create-packages

Before adding a dependency, answer:
- What problem does it solve?
- Can Flutter/Dart already solve it?
- Is it maintained?
- What new coupling does it introduce?
- Does it belong in the architecture?

Adding a package without a reason is not architecture.

## 7. Design principles and patterns

Use the Flutter architecture references above as the primary source. For broader terminology, use these references as supporting material:

- Refactoring.Guru - Repository-related and general pattern vocabulary: https://refactoring.guru/design-patterns
- Martin Fowler - Dependency Injection / Inversion of Control: https://martinfowler.com/articles/injection.html
- Martin Fowler - Presentation Model: https://martinfowler.com/eaaDev/PresentationModel.html

Patterns are not goals. A pattern is justified only when it solves a concrete design problem.

For this challenge, focus on:
- Repository Pattern: isolates data access behind a contract.
- Dependency Injection: composition code decides implementations; consumers receive dependencies.
- Use Case/Application Service: expresses an application action when it adds a meaningful boundary.
- Observer/reactive state: state changes propagate to interested consumers.

Avoid pattern theater: do not add factories, managers, services, abstractions, base classes, or interfaces that have no clear responsibility.

## 8. SOLID references

- Dart/Flutter architecture concepts: https://docs.flutter.dev/app-architecture/concepts
- SOLID overview by Robert C. Martin (background): https://en.wikipedia.org/wiki/SOLID

For the lab, translate SOLID into concrete questions:
- SRP: Does this class have one coherent reason to change?
- OCP: Can a data implementation change without rewriting UI/domain behavior?
- LSP: Can an implementation replace its contract without surprising consumers?
- ISP: Is the contract focused, or does it force consumers to depend on methods they do not use?
- DIP: Does high-level policy depend on abstractions rather than concrete data implementations?

Do not quote SOLID definitions during review without connecting them to your code.

## 9. Git and GitHub workflow

- Git documentation: https://git-scm.com/doc
- GitHub - About branches: https://docs.github.com/en/get-started/using-github/github-flow
- GitHub - Creating a pull request: https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/creating-a-pull-request
- GitHub - Reviewing changes: https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/reviewing-changes-in-pull-requests
- GitHub - About code review: https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/reviewing-changes-in-pull-requests/about-pull-request-reviews

A PR is part of the engineering work, not an upload mechanism. It must make the change understandable and reviewable.

## 10. Testing strategy

Start with behavior and boundaries, not percentages.

Recommended priority:
1. Domain/use-case unit tests for business behavior.
2. Repository tests when mapping/error behavior exists.
3. Provider/controller tests for state transitions.
4. Widget tests for meaningful UI behavior.
5. Integration tests only when a cross-feature flow justifies them.

Test names should describe behavior. Avoid tests that merely mirror implementation details.

## 11. Error handling

References:
- Dart exceptions: https://dart.dev/language/error-handling
- Futures and error handling: https://dart.dev/libraries/async/futures-error-handling

Questions before implementing an error path:
- Is this failure expected or exceptional?
- Which layer understands the technical error?
- Which layer decides the user-facing meaning?
- Are technical details leaking into the domain/UI?
- Is failure represented consistently?

The starter includes error/result foundations. Extend them only when the challenge actually requires it.

## 12. Accessibility and UI quality

- Flutter accessibility: https://docs.flutter.dev/ui/accessibility-and-internationalization/accessibility
- Accessibility testing: https://docs.flutter.dev/ui/accessibility-and-internationalization/accessibility-testing
- Material Design: https://m3.material.io/

Even in a technical lab, controls should have understandable labels, forms should expose useful validation, and layouts should remain usable at common device sizes.

## 13. Performance - use evidence

- Flutter performance: https://docs.flutter.dev/perf
- Performance best practices: https://docs.flutter.dev/perf/best-practices
- DevTools performance view: https://docs.flutter.dev/tools/devtools/performance

Do not optimize based on guesses. First identify a measurable problem.

## 14. Security boundaries for this lab

This is a mock-data educational application. Do not add real credentials, API keys, personal data, or production secrets.

General references:
- Flutter security resources: https://docs.flutter.dev/security
- GitHub secret scanning guidance: https://docs.github.com/en/code-security/secret-scanning/introduction/about-secret-scanning

Never commit `.env` secrets or credentials to this repository.

## 15. Search strategy

When blocked, use this order:

1. Error message and local evidence.
2. Repository architecture documentation.
3. Official Flutter/Dart documentation.
4. Official package documentation (Riverpod, go_router).
5. Package source/issues when behavior is package-specific.
6. High-quality secondary material only after primary sources.

Stack Overflow, blog posts, videos, and AI assistants can help discover ideas, but they are not architectural authority. Validate important claims against primary documentation and your own experiment.

## 16. Architecture review checklist

Before opening a PR, be prepared to answer:

- Which layer owns this behavior and why?
- What dependencies did you introduce?
- In which direction do those dependencies point?
- What is the source of truth?
- What is observable state versus derived UI state?
- What concrete implementation could be replaced without changing the caller?
- What would change if mock data became an HTTP API?
- What did you test and why?
- Which official reference influenced a non-obvious decision?
- What did you deliberately avoid adding?

If you cannot answer these questions, the implementation is not ready for architectural review.
