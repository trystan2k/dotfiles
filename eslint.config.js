import json from "eslint-plugin-json";
import markdownlint from 'eslint-plugin-markdownlint';
import markdownlintParser from 'eslint-plugin-markdownlint/parser.js';

const markdownLintConfig = {
  languageOptions: {
    parser: markdownlintParser
  },
  plugins: { markdownlint },
  rules: {
    ...markdownlint.configs.recommended.rules,
    'markdownlint/md013': [2, {
      line_length: 180,
      code_blocks: false,
      tables: false,
    }],
    'markdownlint/md024': [2, {
      siblings_only: true,
    }]
  },
}

export default [
  {
    files: ['**/*.md'],
    ...markdownLintConfig,
  },
  {
    files: ['symlinks/config/opencode/**/*.md'],
    ...markdownLintConfig,
    rules: {
      ...markdownLintConfig.rules,
      'markdownlint/md013': 0,
      'markdownlint/md041': 0
    },
  },
  {
    files: ['**/CHANGELOG.md'],
    ...markdownLintConfig,
    rules: {
      ...markdownLintConfig.rules,
      'markdownlint/md024': 0
    },
  },
  {
    files: ['**/*.json'],
    plugins: { json },
    processor: json.processors['.json'],
    rules: json.configs.recommended.rules,
  }
];