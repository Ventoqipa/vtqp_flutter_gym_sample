# Contributing to the VTQP Flutter Gym Sample

## Language

English is mandatory for source code, identifiers, comments, documentation, branch names, commit messages, Pull Request titles/descriptions, and review comments.

## Branching

Never implement challenge work directly on `main`.

Use focused branch names:

```text
feature/auth-flow
feature/membership
feature/access-history
refactor/membership-boundaries
test/membership-use-case
```

## Commits

Prefer small commits that describe intent.

Examples:

```text
feat: add membership repository contract
feat: implement mock membership data source
test: cover active membership use case
refactor: separate membership state from page
```

Avoid messages such as `changes`, `fix`, `update`, or `work`.

## Pull Requests

Every Pull Request must explain:

- Problem/scope.
- Architectural approach.
- What changed.
- How to test it.
- Known limitations or intentional omissions.

Keep a Pull Request focused enough that another trainee can understand and review it.

## Before requesting review

Run:

```bash
dart format --set-exit-if-changed .
flutter analyze
flutter test
```

Then review your own diff.

## Review expectations

Review architecture before style. Ask whether responsibilities and dependencies are correct before discussing minor formatting.

A reviewer should challenge:

- Dependency direction.
- Concrete implementations leaking into Presentation.
- Business rules inside widgets.
- Unnecessary abstractions.
- Missing tests for meaningful behavior.
- Names that hide responsibility.

The author must be able to explain the complete flow from UI to data source.
