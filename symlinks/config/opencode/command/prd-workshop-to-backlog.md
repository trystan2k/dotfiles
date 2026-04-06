---
description: 'Run a full PRD refinement workshop from an initial PRD file, generate modular PRD docs, produce an implementation backlog, and optionally create GitHub issues + project items after explicit confirmation.'
---

Run a complete PRD-to-backlog workflow for this repository.

## Input

- Initial PRD file path (for example: `docs/PRD-Initial.md`).
- If no path is provided, ask for it once.

## Mandatory Workflow

### Phase 1: Discovery and Context

1. Read:
   - `AGENTS.md`
   - input PRD file
   - existing `docs/prd/**` files if present
2. Load the `brainstorming` skill.
3. Identify ambiguities, conflicts, missing decisions, and hidden assumptions.

### Phase 2: Interactive Refinement (Question-Driven)

1. Run a structured interview with the user (using question tool and brainstorming skill).
2. Ask focused questions in small batches (1-3 related questions per batch).
3. Continue until requirements are implementation-safe across:
   - scope and feature behavior
   - scoring rules and edge cases
   - UX and accessibility
   - i18n and speech
   - persistence, offline, and recovery
   - testing (unit/e2e/manual)
   - CI/CD, quality gates, release policy
   - GitHub project workflow and team collaboration
4. Do not stop early. Close all material ambiguities.

### Phase 3: Understanding Lock (Hard Gate)

Before writing docs, present:

- understanding summary
- assumptions
- open questions

Then ask for explicit confirmation from the user before continuing.

### Phase 4: Generate Modular PRD Pack

Create/update these files:

- `docs/prd/prd-v2.md`
- `docs/prd/scoring-spec.md`
- `docs/prd/ux-spec.md`
- `docs/prd/qa-spec.md`
- `docs/prd/devops-spec.md`
- `docs/prd/project-ops-spec.md`
- `docs/prd/release-incident-runbook.md`
- `docs/prd/README.md`

Use normative language (`MUST`, `SHOULD`, `MAY`) for enforceable requirements.

### Phase 5: Build Backlog

Generate an ordered backlog from the refined PRD.

Backlog rules:

- Use plain task titles (no custom ID prefix in titles).
- Dependencies must use GitHub issue references format in task templates: `Depends On: #<issue>`.
- Branch convention in docs and output: `feature/[issue-id]-[title]` where `[issue-id]` is the full issue identifier (e.g., `PBW-030`).
- Include estimate, risk, acceptance criteria, and dependencies.

Return the backlog as:

1. Human-readable list
2. CSV suitable for project/issue creation

### Phase 6: Creation Confirmation (Hard Gate)

After backlog is generated, ask exactly one explicit confirmation question:

"Should I now create these as GitHub issues and add them to the GitHub Project defined in AGENTS.md?"

If user says **no**:

- stop after presenting artifacts.

If user says **yes**:

- create GitHub issues first
- then add each issue to the project board
- set initial status to the board's default start column (`Ready` if available)
- never create draft project items unless explicitly requested.

## GitHub Execution Rules

When creating issues/project items:

1. Resolve project from `AGENTS.md`.
2. Use `gh` commands.
3. If needed, use `subagents/project-manager-specialist` for issue/project operations.
4. Respect repository issue-first policy:
   - issue title without custom ID prefix
   - `Depends On` section with issue links
   - issue added to project with status set

## Final Output Requirements

Always end with:

- files created/updated
- key decisions captured
- backlog summary
- whether GitHub issues/project items were created
- created issue URLs (if created)
