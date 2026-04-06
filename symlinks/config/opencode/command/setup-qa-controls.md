---
description: "Set up QA controls (Biome linter/formatter + lint-staged + Husky git hooks + Commitlint) in a Node.js project. Installs all tools, creates config files, and wires up pre-commit, commit-msg, and pre-push hooks."
---

Set up a complete QA controls stack in this Node.js project. The stack consists of:

- **Biome** — unified linter and formatter for JS/TS/JSON
- **lint-staged** — run Biome only on staged files (fast pre-commit)
- **Husky v9** — git hooks manager
- **Commitlint** — conventional commit message enforcement

Load the `biome`, `husky`, and `lint-staged` skills before starting. Follow every instruction in each skill precisely.

---

## Step 1 — Install dependencies

Run this single command to install all required dev dependencies:

```bash
npm install --save-dev husky @commitlint/cli @commitlint/config-conventional @biomejs/biome lint-staged
```

---

## Step 2 — Initialise Husky

```bash
npx husky init
```

This creates `.husky/` and adds `"prepare": "husky"` to `package.json`.

Verify `package.json` now contains:

```json
"scripts": {
  "prepare": "husky"
}
```

---

## Step 3 — Add Biome scripts to `package.json`

Add these scripts to the `scripts` section of `package.json`:

```json
"lint":     "biome check .",
"lint:fix": "biome check --write .",
"format":   "biome format --write ."
```

---

## Step 4 — Create `biome.json`

Create `biome.json` in the project root. Start from this template and adjust to match the project's existing code style (check existing files for quote style, semicolon usage, indentation):

```json
{
  "$schema": "./node_modules/@biomejs/biome/configuration_schema.json",
  "files": {
    "includes": [
      "**",
      "!dist",
      "!node_modules",
      "!build",
      "!coverage"
    ]
  },
  "formatter": {
    "enabled": true,
    "indentStyle": "space",
    "indentWidth": 2,
    "lineEnding": "lf"
  },
  "linter": {
    "enabled": true,
    "rules": {
      "recommended": true
    }
  },
  "javascript": {
    "formatter": {
      "quoteStyle": "single",
      "trailingCommas": "none",
      "semicolons": "asNeeded"
    }
  }
}
```

**Important decisions to make before writing `biome.json`:**

1. Read 3–5 existing source files to detect current quote style, semicolons, and indentation. Match them.
2. If the project uses platform-specific globals (e.g. Zepp OS, browser extensions, React Native), declare them in `javascript.globals` to avoid `noUndeclaredVariables` false positives.
3. If the project intentionally uses `console.log` (servers, CLI tools, device apps), add `"noConsole": "off"` under `linter.rules.suspicious`.
4. Use `files.includes` with `!` negation — **not** the deprecated `files.ignore` (Biome v2 syntax).

---

## Step 5 — Run a baseline lint fix

Before wiring up pre-commit hooks, fix all existing files to match the new Biome config. This prevents the first real commit from being blocked by pre-existing style issues:

```bash
npm run lint:fix
```

Review the changes. If any file was incorrectly modified, tune `biome.json` rules and re-run.

---

## Step 6 — Create `commitlint.config.js`

**Check whether `package.json` contains `"type": "module"`.**

If yes, the project uses ES modules — use `export default`:

```js
export default {
  extends: ['@commitlint/config-conventional']
}
```

If no (CommonJS project), use `module.exports`:

```js
module.exports = {
  extends: ['@commitlint/config-conventional']
}
```

---

## Step 7 — Create `.lintstagedrc.json`

```json
{
  "*.{js,ts}": "biome check --write --no-errors-on-unmatched --files-ignore-unknown=true",
  "*.json":    "biome check --write --no-errors-on-unmatched --files-ignore-unknown=true"
}
```

Adjust the glob patterns if the project uses additional file types (`.jsx`, `.tsx`, `.mjs`, etc.).

---

## Step 8 — Create Husky hooks

Create all three hooks and make them executable:

```bash
# pre-commit: lint staged files
echo 'npx lint-staged' > .husky/pre-commit
chmod +x .husky/pre-commit

# commit-msg: validate conventional commit format
echo 'npx --no -- commitlint --edit "$1"' > .husky/commit-msg
chmod +x .husky/commit-msg

# pre-push: run test suite
echo 'npm test' > .husky/pre-push
chmod +x .husky/pre-push
```

Verify all three hooks are executable:

```bash
ls -la .husky/
```

Expected: `-rwxr-xr-x` for each hook file.

---

## Step 9 — Verify everything works

Run these checks and confirm each passes:

```bash
# 1. Hooks are reinstallable
npm run prepare

# 2. Lint passes with no errors
npm run lint

# 3. Tests still pass (nothing was broken)
npm test

# 4. Commitlint rejects a bad message
echo "bad commit message" | npx commitlint
# Expected: exit 1 with subject-empty / type-empty errors

# 5. Commitlint accepts a good message
echo "feat: add qa controls" | npx commitlint
# Expected: exit 0
```

---

## Completion Criteria

All of the following must be true before this task is considered done:

- [ ] `npm run lint` exits 0 with 0 errors
- [ ] `npm test` exits 0 (all tests pass)
- [ ] `npm run prepare` exits 0 (hooks reinstall cleanly)
- [ ] `.husky/pre-commit`, `.husky/commit-msg`, `.husky/pre-push` all exist and are executable
- [ ] `commitlint` rejects `"bad message"` and accepts `"feat: add qa controls"`
- [ ] `biome.json`, `commitlint.config.js`, `.lintstagedrc.json` all exist in the project root
- [ ] `package.json` contains `prepare`, `lint`, `lint:fix`, and `format` scripts
