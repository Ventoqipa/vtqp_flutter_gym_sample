# ADR 0002: Riverpod for composition and presentation state

- Status: Accepted
- Date: 2026-09-16

## Context

The lab needs an explicit dependency-composition mechanism and predictable presentation state without introducing a service locator or manual global singletons.

## Decision

Use Riverpod for dependency injection/composition and presentation/application state.

Widgets may consume providers but must not construct concrete data-layer dependencies. Provider composition should remain feature-local whenever possible.

## Consequences

- Dependencies can be overridden in tests.
- Construction is separated from consumption.
- State ownership is visible.
- Riverpod remains a presentation/composition concern and does not enter Domain.
