import json from "eslint-plugin-json";
import markdown from "eslint-plugin-markdown";

export default [
  ...markdown.configs.recommended,
  {
    files: ['**/*.json'],
    plugins: { json },
    processor: json.processors['.json'],
    rules: json.configs.recommended.rules,
  }
];