# ADR 0001: Feature-first Clean Architecture

- Status: Accepted
- Date: 2026-09-16

## Context

The lab must prepare trainees for larger mobile applications without giving them the challenge solution. A purely screen-based or layer-only global structure makes ownership less explicit as features grow.

## Decision

Organize business code by feature. Inside each feature, use Presentation, Domain, and Data boundaries when those layers are needed.

Dependencies must point toward Domain. Data implements Domain repository contracts. Presentation consumes Domain behavior through injected dependencies.

## Consequences

### Positive

- Feature ownership is explicit.
- Data sources can be replaced with limited UI impact.
- Domain behavior can be tested without Flutter.
- Trainees practice dependency inversion in a small environment.

### Cost

- More files and explicit types than a minimal demo application.
- Requires discipline to avoid ceremonial abstractions.

## Guardrail

Do not create empty abstractions merely to satisfy the folder structure. Every class must have a responsibility that can be explained.
