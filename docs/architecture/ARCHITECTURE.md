# Architecture Guide

## Purpose

This repository is a teaching environment with production-minded boundaries. The architecture is deliberately stricter than the size of the sample requires so trainees practice dependency direction, replaceability, and explicit responsibilities before working on real projects.

The starter establishes the rules. It does not implement the challenge.

## Architectural style

The project uses **feature-first Clean Architecture**.

Top-level organization separates application composition, cross-cutting core contracts, business features, and genuinely shared presentation elements.

Within a feature, code is separated into three layers:

### Presentation

Owns Flutter UI, interaction state, Riverpod controllers/providers, and presentation mapping.

Presentation may depend on Domain. It must not depend directly on concrete Data implementations.

### Domain

Owns business entities, repository contracts, and use cases.

Domain is the most stable layer and must remain framework-independent. It must not import Flutter, Riverpod, GoRouter, HTTP clients, databases, or concrete data models.

### Data

Owns data sources, transport/storage models, mapping, and concrete repository implementations.

Data implements contracts defined by Domain. A data source is an implementation detail; it does not define business policy.

## Dependency direction

```text
Presentation ------> Domain <------ Data
       |                ^             |
       |                |             |
       +---- DI composition ----------+
```

The dependency inversion principle is mandatory at the Domain/Data boundary.

## Expected request flow

```text
Page
  -> Controller / Provider
    -> Use Case
      -> Repository Contract (Domain)
        -> Repository Implementation (Data)
          -> Data Source
```

Data returns through the same boundaries in the opposite runtime direction, but source-code dependencies still point toward Domain.

## Composition and dependency injection

Riverpod is the composition mechanism for this lab. Providers should assemble dependencies outside widgets.

A widget may read a provider. It must not create a concrete repository, data source, or use case itself.

Keep provider definitions close to the feature that owns them. Do not create a global service-locator file containing every dependency in the application.

## Repository rule

A repository contract describes what the domain needs, not how data is obtained.

Bad contract:

```text
fetchMembershipFromMockJson()
```

Better contract:

```text
getMembership()
```

The concrete implementation decides whether that information comes from mock data, REST, local storage, or another source.

## Use case rule

A use case represents a meaningful application/domain action. Do not create a use case merely to forward every trivial getter. For this lab, at least one use case must demonstrate the boundary and be explainable.

A use case must not know about widgets, navigation, or visual state.

## State management rule

Riverpod manages presentation/application state and dependency composition. It does not replace domain boundaries.

Avoid providers that become containers for unrelated mutable state. State should have an owner and a reason to exist.

## Model and entity rule

Data models describe external/storage representation. Domain entities describe concepts used by business behavior.

Do not leak a data model into presentation merely because its fields currently look identical to an entity. Mapping is a boundary and should remain explicit when representations can diverge.

## Navigation rule

Routes are composed under `lib/app/router`. Feature pages do not own the global router.

Use named constants/centralized paths rather than scattering raw route strings throughout widgets.

## Error rule

Do not show infrastructure exceptions directly in UI. Translate failures at an appropriate boundary into states/messages the presentation layer can handle.

The starter includes only a minimal exception foundation. Trainees decide what additional failure representation the challenge actually needs.

## Testing expectations

Tests should protect decisions and behavior, not implementation details.

Priority order for this lab:

1. Domain/use-case behavior.
2. Repository behavior and mapping when meaningful.
3. Provider/controller state transitions.
4. Critical widget behavior.

A test should make refactoring safer. Avoid tests that merely assert constructors or duplicate framework behavior.

## Naming conventions

- Files: `snake_case.dart`
- Types: `UpperCamelCase`
- Variables/functions/providers: `lowerCamelCase`
- Repository contract: `MembershipRepository`
- Concrete implementation: descriptive implementation name such as `MockMembershipRepository`
- Data source: descriptive source name such as `MockMembershipDataSource`
- Use case: verb-oriented name such as `GetMembership`

All names and documentation must be in English.

## Forbidden shortcuts

The following are architecture violations for this challenge:

- Mock lists or maps embedded in pages/widgets.
- Concrete repository construction in a widget.
- `presentation` importing a class from a feature's `data` directory.
- Domain importing Flutter/Riverpod/GoRouter.
- Business decisions in button callbacks.
- One giant provider/controller handling unrelated features.
- A global `utils.dart` used as a dumping ground.
- Duplicate domain concepts represented by untyped maps.
- Static global mutable state.
- Direct commits to `main` for challenge implementation.

## Architecture review questions

During review, every trainee should be able to answer:

- What would change if mock data were replaced by an API?
- Which layer owns the repository contract and why?
- Where is dependency inversion visible?
- Why does the page not know the data source?
- What responsibility belongs to the use case?
- Which state is owned by Riverpod and why?
- Which implementation can be replaced without changing the UI?
- What would be the architectural consequence of moving this class to another layer?

If a trainee cannot explain a dependency, the dependency should be reconsidered.
