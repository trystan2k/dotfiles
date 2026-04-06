---
description: 'Create a new Linear issue with title, description, team, project, and optional parent linkage.'
---

Create a new issue in Linear for this project.

## Input

Parse the following from the user's command:

- `--title` (required): Issue title
- `--description` (required): Issue description (markdown supported)
- `--team` (required): Team key, name, or ID (e.g., "PBW" or "PadelBuddyWeb")
- `--project` (required): Project name or ID (e.g., "PadelBuddyWeb")
- `--parent-id` (optional): Parent issue ID to link as sub-issue (e.g., "PBW-5")

If any required parameter is missing, ask for it once.

## Workflow

### Step 1 — Load Linear skill

Load the `linear-cli` skill to ensure correct CLI usage. Also use the task template when defining the issue body.

### Step 2 — Resolve team and project identifiers

Query Linear to resolve the correct identifiers:

```bash
linear team list
linear project list
```

Match the provided team/project names to their actual keys/names in Linear. This handles cases where AGENTS.md uses a different format than the API expects.

### Step 3 — Build the create command

Construct the `linear issue create` command:

```bash
linear issue create \
  --title "<title>" \
  --description "<description>" \
  --team "<team-key>" \
  --project "<project-name>" \
  --parent "<parent-id>"
```

**Command building rules:**

- Use the resolved team key (not the display name) for `--team`
- Use the resolved project name for `--project`
- Only include `--parent` if `--parent-id` was provided
- Escape special characters in title and description for shell safety
- Priority defaults to 3 (medium) unless specified otherwise

### Step 4 — Execute and capture result

Run the command and capture the JSON output.

Extract from the response:

- `identifier` — the issue ID (e.g., PBW-6)
- `url` — the web URL (e.g., <https://linear.app/padelbuddyweb/issue/PBW-6>)
- `branchName` — suggested branch name (e.g., feature/pbw-6-title-slug)

### Step 5 — Return summary

Output a concise summary:

```markdown
Issue created: PBW-6
URL: https://linear.app/padelbuddyweb/issue/PBW-6
Branch: feature/pbw-6-title-slug
```

## Error Handling

If the command fails:

1. Check if API token is configured (`LINEAR_API_TOKEN` env var or `~/.linear_api_token`)
2. Verify team/project names exist in Linear
3. Verify parent-id exists if provided
4. Report the error message from Linear CLI to the user

## Example Usage

```bash
/create-linear-issue --title "Setup Vitest" --description "Configure Vitest testing..." --team "PBW" --project "PadelBuddyWeb"
/create-linear-issue --title "Add unit tests" --description "Write tests for scoring module" --team "PBW" --project "PadelBuddyWeb" --parent-id "PBW-5"
```

## Output Format

Always end with:

- Issue identifier (e.g., PBW-6)
- Issue URL
- Suggested branch name
- Confirmation of parent linkage (if applicable)
