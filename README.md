# VTQP Flutter Gym Sample

Architecture-first starter repository for the **VTQP Technical Lab - Challenge 01**.

This repository intentionally provides **foundations, boundaries, conventions, references, and contracts - not the challenge solution**. Trainees are expected to implement the required behavior while respecting the architecture.

> We do not evaluate how many lines of code you write. We evaluate whether you can explain why the code is organized this way.

## Start here

Before implementing anything, read these documents in order:

1. [`docs/architecture/ARCHITECTURE.md`](docs/architecture/ARCHITECTURE.md) - boundaries and dependency rules.
2. [`docs/architecture/decisions`](docs/architecture/decisions) - architectural decisions and rationale.
3. [`docs/REFERENCES.md`](docs/REFERENCES.md) - official references mapped to the decisions you will make.
4. [`CONTRIBUTING.md`](CONTRIBUTING.md) - branch, commit, PR, quality, and review expectations.

Do not guess when an official reference exists. Research first, understand the recommendation, then make and explain your decision.

## Technology baseline

- Flutter / Dart
- Riverpod for dependency injection and state management
- GoRouter for navigation
- Feature-first organization with Clean Architecture boundaries
- Flutter lints with stricter analysis options

## Required functional scope

The challenge must eventually provide four user-facing areas:

1. Login - simple form and simulated authentication.
2. Home - greeting, membership summary, and navigation.
3. Membership - membership type, status, and validity using mock data.
4. Access History - recent gym access records using mock data.

No backend or external service is required.

## Architecture

```text
lib/
|-- app/
|-- core/
|-- features/
|   |-- auth/
|   |-- home/
|   `-- membership/
|       |-- data/
|       |-- domain/
|       `-- presentation/
|-- shared/
`-- main.dart
```

### Dependency rule

Dependencies point inward:

```text
Presentation -> Domain <- Data
```

The domain layer must not import Flutter, Riverpod, GoRouter, or concrete data implementations.

Expected feature flow:

```text
Page -> Provider/Controller -> Use Case -> Repository Contract -> Repository Implementation -> Data Source
```

The UI must not know whether membership information comes from a mock source, REST API, database, or another implementation.

## Strict rules

- Do not access mock data directly from widgets.
- Do not instantiate concrete repositories inside pages or widgets.
- Do not place business rules inside UI widgets.
- Do not import `data` classes from the `presentation` layer.
- Do not make domain entities depend on Flutter.
- Do not create generic `utils.dart`, `helpers.dart`, or `constants.dart` dumping grounds.
- Prefer small, explicit types with one responsibility.
- Keep feature-specific code inside its feature.
- Shared code must be genuinely shared by multiple features.
- Every dependency crossing an architectural boundary must have a clear reason.

## Patterns trainees must implement and explain

- Repository Pattern
- Dependency Injection
- Use Case / Application Service
- Observer / State Management with Riverpod
- SOLID principles in practical decisions

The starter does **not** implement these patterns for the challenge. It establishes the environment and architectural boundaries and points you to the references needed to implement them intentionally.

## Getting started

```bash
git clone https://github.com/Ventoqipa/vtqp_flutter_gym_sample.git
cd vtqp_flutter_gym_sample
flutter pub get
flutter analyze
flutter test
flutter run
```

If platform folders are not present in your clone, generate them once with:

```bash
flutter create .
flutter pub get
```

Do not overwrite the architecture or documentation when running Flutter tooling.

## Before asking for help

Use the repository references and follow this sequence:

1. Define the problem precisely.
2. Reproduce it.
3. Read the relevant architecture rule.
4. Check the official Flutter/Dart/Riverpod/GoRouter documentation in `docs/REFERENCES.md`.
5. Form a hypothesis.
6. Run the smallest experiment that can validate it.
7. Document what you tried and what happened.
8. Ask for help with evidence, not only with a symptom.

## Delivery workflow

1. Select/assign the Trello card.
2. Move it to `In Progress` only when work starts.
3. Create a focused branch. Do not work directly on `main`.
4. Make small, descriptive commits.
5. Run analysis and tests locally.
6. Review your own diff.
7. Open a Pull Request with scope, changes, and test instructions.
8. The other trainee reviews the PR and asks architecture questions.
9. Address review comments and leave the work in `Review` for final evaluation.

## Definition of Done

A challenge implementation is ready for review only when the application runs, all required areas are reachable, boundaries are respected, dependencies are injected, `flutter analyze` passes, relevant tests pass, and both trainees can explain the complete dependency flow.

## Out of scope

Backend, real APIs, payments, membership purchase/renewal, FaceID, turnstiles, push notifications, production authentication, complex persistence, analytics, advertising, and external integrations.

## Documentation language

**All source code, identifiers, comments, commits, branches, Pull Requests, and project documentation must be written in English.**
