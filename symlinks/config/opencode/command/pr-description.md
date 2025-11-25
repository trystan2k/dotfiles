---
description: Generate a description for your pull request based on the changes made.
agent: plan
model: github-copilot/gpt-5-mini
---

Based on the changes staged (if any) or from the lasts commits compared with develop branch, generate a description for a pull request. The description should summarize the key changes, improvements, and fixes made in the code. Use bullet points for clarity and conciseness. Ensure the description is informative and helps reviewers understand the purpose and impact of the changes. It should be written in a professional, neutral tone and in Spanish. It should be written in markdown format.

It should have 3 main sections

1. Contexto
Should be a brief summary of what the problem was that the changes are solving.
2. Cambios Realizados
A bullet point list of the main changes made in the code.
3. Como Probarlo
Instructions on how to test the changes, including any setup or configuration needed. It should always include the step to run the QA script (npm run complete-check), besides the steps needed to manually test the changes in the application.
